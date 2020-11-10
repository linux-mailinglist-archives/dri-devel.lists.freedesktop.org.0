Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 603FA2AD091
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 08:41:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59B148982E;
	Tue, 10 Nov 2020 07:41:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2083.outbound.protection.outlook.com [40.107.94.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 456BE89819
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 07:41:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R+IdvNNBGXFLASH56ZEsZ83JmQffrtkByqd9XR/fZa0ScidA5dsYh55Z9+vy7y38QYmfCgM+sEqBfUKdIriQWr+iVsVE6HP+LOXX6KxdkHylujs3jKDje2udpxbyDF4d5a2tRFrCW3EwPn03gRtGBFhNd7qeeFOdXnFK/BMbXFZHCIVqIfCTk1mQ9bnkH7n9WiFJV3q8m8IYWqVB8NNFHhtQTfgUKWmatn8vYf8yjJ6shoBJ989uqs1XQmvEskKTbJ+m0j3Xt/AzWGmNk3h5vjkVgLmabyhu8umUtQllNjQhmrWynl2Uoa3lvxZFk7jrfU5NPnY6Dptv0a2tlBMHmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JxzoKaM4r6suO7Y++i4mydhKLRu9Q7pf9eVytEho6Ds=;
 b=QJlONlznKQUTlTJNXwQi0ED9YfhfCJQ9xBCiUjstnZPVOkqKxdcsbQVT2POZqiFxuwB1MJKRnEZBJ7yTag9VLTFgr8jaqhx6jT9RxCd5jvtMd/0YVe4c6PAc9pBgFTbzD60Df/g9CCrba+cjTDAAi9cYK4BtZfltRxAM2yC6Iu6AYkCS22JjQjHrjTfZOUmKYhAw/7pM19WNGPay+H35CI1ZYPqRkDvGj4fh60dj+2SrmQNl9CIXEWdWfZKBQXF03zQfqHyzZk66ZNzGhABvm+0DIOPPKG114fNTmSZcTVnDOyllQnb8bU+KRULDA++1LXWSQTUtwXSrvGOUs3T1cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JxzoKaM4r6suO7Y++i4mydhKLRu9Q7pf9eVytEho6Ds=;
 b=v0MGt4/krik7osqSZXTTg/DXVIPzYqrzNQQjiVaHA+lBh75PIYg3deFmGau/rVbDMIa0f03VxrgynEjjB906A/nnOxdENtqzpWAj2yxJn4qTTpPJ9Y+ImTeuluYSfTXJ6uYc8QRrq9UrSiqi3I+ttLrz+NdM8WymYBCisMc/oIc=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1226.namprd12.prod.outlook.com (10.168.237.135) by
 DM5PR12MB1769.namprd12.prod.outlook.com (10.175.89.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.23; Tue, 10 Nov 2020 07:41:03 +0000
Received: from DM5PR12MB1226.namprd12.prod.outlook.com
 ([fe80::8874:6c82:5323:923c]) by DM5PR12MB1226.namprd12.prod.outlook.com
 ([fe80::8874:6c82:5323:923c%6]) with mapi id 15.20.3541.025; Tue, 10 Nov 2020
 07:41:03 +0000
From: Stylon Wang <stylon.wang@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/amd/display: Fix memory leaks in S3 resume
Date: Tue, 10 Nov 2020 15:40:06 +0800
Message-Id: <20201110074006.42324-1-stylon.wang@amd.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [165.204.134.251]
X-ClientProxiedBy: HK2PR02CA0173.apcprd02.prod.outlook.com
 (2603:1096:201:1f::33) To DM5PR12MB1226.namprd12.prod.outlook.com
 (2603:10b6:3:75::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stylon-T495.amd.com (165.204.134.251) by
 HK2PR02CA0173.apcprd02.prod.outlook.com (2603:1096:201:1f::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.21 via Frontend Transport; Tue, 10 Nov 2020 07:41:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d55eb233-cef6-4219-7429-08d8854bf9cd
X-MS-TrafficTypeDiagnostic: DM5PR12MB1769:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB1769D804C1D72EC1134A8185FFE90@DM5PR12MB1769.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NSaSrJasZ0aK99MqnFZHlCczg7F3WfFAyCDSumw1sh+Gs9NqUESGvLWfcre+Z2hq+LJjT7KjFajYc/Vej50zZ0l0okeCKY96izpdlkbPvnakocMD63526VvBT5hko+Kw4G1LuaCcWkbgWm4B8I3ya3dMDZOXt10qCaXgMYgkCbDnpaJVuLV6CeC3KbL0I5+xvkkmTjeOwpH7erbmNpnOuiV7NCuld7ZoFvaj+lb1T7RC5HpEcAzWS/zFJ12T4+ItBChu4FPrFGnBZofmFcc+cF7iOlYjZnKvgy4tr3MRuns0CwGo+/hF1rWU9sahhPln8hjJTQSPc8V2N6oP1fUwtg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1226.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(136003)(39860400002)(396003)(16526019)(316002)(478600001)(8936002)(956004)(5660300002)(36756003)(66476007)(66556008)(186003)(2906002)(83380400001)(8676002)(86362001)(44832011)(6486002)(4326008)(6916009)(26005)(66946007)(2616005)(1076003)(52116002)(7696005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: NEb+nCSgywCP5NyUnjAyMzWPir2F32XC/UyMd4yaM/Qr/x105nd5i6VJhmb05+uibgXHNo4f70WsPpRXxwvDVo0diBduiKGoRwr/95kwIoP17yCKmtEnYGF4FszUB0+wGYdy5R9orYKikJYTXVv3Zpl64r5G11Hazjv8R00u2kxJNRwym/cuRfCuFTjFZLs3bshOG09jBzBzb19QdN37IV4MMMVntr+fPiTTch9fA9+VDfPp1MSxmMCY7XeSmiQVDMXqQrws+0BsDd8mh4rb5puhz8Vmo6vnnVNDcRBkWrJfTabx+X14inlGd62mO8XyTXUIcYDQQq4mi+EkkBbyiP/xyfyL7mZHmkSGcN6XfES/0QZLhNZ/lyaYFF+xk7rZcxHT9N0I+jSASymtfRZZ44xr8EJRZ8aaknQrxRSABXyhAqb/lNho7mOX5bcG8jFO+8vrvt+Lv75u5nW+0FrN+Vo3NSz2mp1+CqCheO0TOnx1wQzoM1j62rDU38+FJf8HunRtWw1bxYKlUa0kvqvhj1VBiYwZlf6ytx6Y/x7ZbfH/ZmHFOhPK4XPQyeTjcz9IS/ncabT2nCI/puRwO3nDY1gPh9kx/bH0funyJ/S5BObCoXnzYi7ExeqRJkoT9gCr9kNNV8nRww947d924Lbi+IMVYBt3wikCqTP895n/ZgE1W0UUXsfo64lP19sdcP+59YdQQB0tmCzCUp4Mj2jqKRKTR5x1rJm9Je3zvzVAjV9D826EcynQOE/L78XxoHws6MnW+O++YSt8vBsH35/BqXAVVrsOua3mnt5XJIqD3yYQv4Hjs0WIQbOUv56zUPfqXWqUDtMULAcPlRqWAYIzkDQ++EiwtIOZCaG4b7nJwbgK8EFJvuPyOoh9BTGOQxgN4ztB6PHfg9g5nUjol+/hzg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d55eb233-cef6-4219-7429-08d8854bf9cd
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1226.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2020 07:41:03.6956 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k5d6kaySoM6ve2viFHsQB082cOIdtxz/kGA/BtXMh5k93gM1fw8TUrI7lz5JKX48l1ajy5A66wMDflWvijGgbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1769
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Stylon Wang <stylon.wang@amd.com>, Alexander.Deucher@amd.com,
 Nicholas.Kazlauskas@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

EDID parsing in S3 resume pushes new display modes
to probed_modes list but doesn't consolidate to actual
mode list. This creates a race condition when
amdgpu_dm_connector_ddc_get_modes() re-initializes the
list head without walking the list and results in  memory leak.

Signed-off-by: Stylon Wang <stylon.wang@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 0b6adf23d316..715e0bd489f8 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -2337,7 +2337,8 @@ void amdgpu_dm_update_connector_after_detect(
 
 			drm_connector_update_edid_property(connector,
 							   aconnector->edid);
-			drm_add_edid_modes(connector, aconnector->edid);
+			aconnector->num_modes = drm_add_edid_modes(connector, aconnector->edid);
+			drm_connector_list_update(connector);
 
 			if (aconnector->dc_link->aux_mode)
 				drm_dp_cec_set_edid(&aconnector->dm_dp_aux.aux,
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
