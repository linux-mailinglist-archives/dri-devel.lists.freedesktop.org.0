Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C949807AE6
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 23:00:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D774310E7B9;
	Wed,  6 Dec 2023 21:59:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on2074.outbound.protection.outlook.com [40.107.15.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E603910E734
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 13:52:11 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=hhKmvoYXqQvyG0HR+AYt3Tvhq1jv++Vnc1xGxtHnrkcuTBQlHJ/r1easBsEbuoYy/GNxRm6cwdwy9ArYJDNZLgzTYbWMshnu4R48QJyzjcENUUBQ9vtDJIOgCGq7YuUQN+Df16NFu+/M9P492B9q+IUluzmNGKBb/2kapFj+HJyqyx5LsZFG+4keQ2RpieIwXd7TUovjTBqdA46VX4FExoDYnSEgJOJl7UDRKFdWupaM6c4lfLawl8YYsbxby7jgHyLDipA1YPhS81a1UZvURbhCMRNzz+XpdumplQ7gCgj4M5wnPsr1F5vVpT4eRX0M1PcnL7A+Zd7HUp4TMbgGZQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jvE2OctWpPD/K1DHfAF771wxa27YcVx+kLym4PgKpgI=;
 b=LixuENnLTPli2jxG3IyAoxnXqPWjgEFDYX5UJxv+63bHPphIXvYAmHeImuPGFsAU27aIfaw4h68ZhSq8Zbxgzocr0Z7SEyb3IFaZjG7hRQBndl4iGr7HZW+IeAD10XvWBYHND6Wa65aQ2HW4VeVMcMVU+doVCEIRcwEIW7tFvoOswj47oN2Xln4zC7jLgYTgfRpvZ8X537wdOgMkZw6H1I39ZOON9q8X8USCklEQ1pJpDT7hDbV24id3F69nO/U/aaEg+SOO+uew3cQNy4Cylqtj3gymVjwZEUjynmELXYEmgRhMxsoLcG7wsPSp9mpnrrvb+pTbEEpUaFFK04YAxA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jvE2OctWpPD/K1DHfAF771wxa27YcVx+kLym4PgKpgI=;
 b=cRd+AGS5/LAkpPHPjlK3H9UQZhdYUv0tnpN6COL92jrnijENMu3zlc65TVB2UqTVJ0Utxu3DgVoFpnKvRtRK8ByLQZsdkN4+DvxlFSy7vTaxyvLnqYzomyImnn2jDithYUB45MjhUFhfRuLs9UTI1WIwoHDKED3qMXEtf0hPpUw=
Received: from AM0PR04CA0130.eurprd04.prod.outlook.com (2603:10a6:208:55::35)
 by VI1PR08MB5389.eurprd08.prod.outlook.com (2603:10a6:803:137::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Wed, 6 Dec
 2023 13:52:08 +0000
Received: from AM3PEPF0000A79B.eurprd04.prod.outlook.com
 (2603:10a6:208:55:cafe::9) by AM0PR04CA0130.outlook.office365.com
 (2603:10a6:208:55::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25 via Frontend
 Transport; Wed, 6 Dec 2023 13:52:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF0000A79B.mail.protection.outlook.com (10.167.16.106) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.20 via Frontend Transport; Wed, 6 Dec 2023 13:52:08 +0000
Received: ("Tessian outbound e243565b0037:v228");
 Wed, 06 Dec 2023 13:52:08 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e002ee3e5b4b5c6e
X-CR-MTA-TID: 64aa7808
Received: from 9194113950d0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0DA86B93-8E85-41BF-8562-F8C6619C52E5.1; 
 Wed, 06 Dec 2023 13:52:01 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9194113950d0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 06 Dec 2023 13:52:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gWWhEGQtJy3EDPdK4XFY8kei4OHj9WgBpSgxb/X/LObmvibapYU5imN2R2w3Byi4SCANa6NKQQFv1oIc7sslM11lzLPPAiyZhT4Wq1r/N+4cuQhbENR28Q6k2vVBrCcKo8r0OkhTx72KBKzkZoq0q8BaKM0b96RT7njhkj0kTKedGvAqTIABe/+DAvDcfH6bsKySKslodESY5qSBVGU3sQN+I+m8vLGy2riOZ2U0F+wpi2FPyj76T9nVfdM4urtXZcyz/uEoR1hFvj4IK33Fk1vkFJzLFR4YY/+P2v+C07IWVQNA5wZDa6oeRCh35iTFz1z1Sw59B6Ccq/fUHgH4+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jvE2OctWpPD/K1DHfAF771wxa27YcVx+kLym4PgKpgI=;
 b=i0lvAARVFMiWbWdEn6OWO1Rqopkgwa9hURrJJvCKM/Wr8byogZfH3lmGe+O5ehhZGRTuM/x0GtgciOQ2tELsExvMIFhzn0qqco9jW4otYL4iWyYBKx31EKtEmiHfE6lTNizBi0bg2NjDIC/H6ejVSionsqU6E24DZkIB2WQGMdNYo7VG2jf7hZougeE72kCtEOX9CKoOksLXNsrptoMekfkyVqOzZFwYGdngXQDfgsiGBkZLe0wwq4I3IotbkSBRNUgs6bxY0JLHfT2IkEMCp4hga6PUVebPudb445yWitwv+Gl3UkitZ/9V6DmJaoSA/JimqzLOoNqOITAU5cSebA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jvE2OctWpPD/K1DHfAF771wxa27YcVx+kLym4PgKpgI=;
 b=cRd+AGS5/LAkpPHPjlK3H9UQZhdYUv0tnpN6COL92jrnijENMu3zlc65TVB2UqTVJ0Utxu3DgVoFpnKvRtRK8ByLQZsdkN4+DvxlFSy7vTaxyvLnqYzomyImnn2jDithYUB45MjhUFhfRuLs9UTI1WIwoHDKED3qMXEtf0hPpUw=
Received: from PA6PR08MB10766.eurprd08.prod.outlook.com
 (2603:10a6:102:3cd::17) by VI1PR08MB10148.eurprd08.prod.outlook.com
 (2603:10a6:800:1bc::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Wed, 6 Dec
 2023 13:51:58 +0000
Received: from PA6PR08MB10766.eurprd08.prod.outlook.com
 ([fe80::8c27:ae9d:320a:c8e0]) by PA6PR08MB10766.eurprd08.prod.outlook.com
 ([fe80::8c27:ae9d:320a:c8e0%2]) with mapi id 15.20.7046.034; Wed, 6 Dec 2023
 13:51:58 +0000
From: Lingkai Dong <Lingkai.Dong@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm: Fix FD ownership check in drm_master_check_perm()
Thread-Topic: [PATCH] drm: Fix FD ownership check in drm_master_check_perm()
Thread-Index: AQHaKEsCo6nWPH/KmkyDAqKUxClNUw==
Date: Wed, 6 Dec 2023 13:51:58 +0000
Message-ID: <PA6PR08MB107665920BE9A96658CDA04CE8884A@PA6PR08MB10766.eurprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: PA6PR08MB10766:EE_|VI1PR08MB10148:EE_|AM3PEPF0000A79B:EE_|VI1PR08MB5389:EE_
X-MS-Office365-Filtering-Correlation-Id: 7948aab6-f4d0-4fc6-89b9-08dbf66289e2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: UhvF3Zk1EzM4GngUg06aJs4de0ltcccvAht159sZ4HloykqVgFx0JFIKbmH2mrqmTnjn/HW5mzBzTCvtmeFW9yZvdIw8aArNLo2ys15AhtQGCNezf5SdVUlM7WJ0IPbAdWZb8iB6t7kxE71ZhFGORhwilxzzLNK9qEFol99wTYbqNp8CtjELGSj6rFzk/TwV454U0ztOtXLWksqvHSKRIFB0uhdAg+BFjKuKss3BWsJKJOKuNBYCMqtABalfemIuHe7lSyG0IE5i4PtIaK5Kt2Qgbv5CVlcRSQjnIZf62b2VbsR+uKq9OwSL58GDn1h8zwfMWWzNxGbsm882W4DuH/k4LmIMRlxfgvqrzaKytpihr6et7QJdTnrr1mTKc4f2Zdy67Ab6BhxJ8W7JFJes6RjeYdC0AbXFIBNFzjBIWCWeXD/fLHAsP7gfNvJ4S+2DfSevHfX5gN3p84LntpNTH+ENNwAHlzHaK9w6hlbHep/dXUO5AI9yBP0JMG9lFFQgwbw4b1KGbVfQcAIkPY1rxOE6QUgWEOQLZrDIpygp9Y24LSqmb7PHcMBMVuG275EU3E4Wqm5WPusHDIOQweLOEL2lDQuJNR8tRTzHhakrJXo8JXkX+QrHWnpPKyM/0Js3
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:PA6PR08MB10766.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(396003)(346002)(366004)(376002)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(2906002)(55016003)(38070700009)(5660300002)(33656002)(83380400001)(86362001)(38100700002)(122000001)(71200400001)(6506007)(7696005)(4326008)(26005)(8676002)(8936002)(52536014)(9686003)(41300700001)(316002)(76116006)(6916009)(54906003)(66556008)(66476007)(66446008)(66946007)(91956017)(64756008)(478600001);
 DIR:OUT; SFP:1101; 
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10148
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM3PEPF0000A79B.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 4d152f34-141a-4f16-0334-08dbf6628418
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BgY/EOBj3fKTO+4U0lr5tmN0z7OD2Xpath5xnxvKIHKS9jfyoYxB7BrEz7NC7dpvRsAWZFSVOz/rCCtH82no335hI7O89ANzfP32I65Sw73+/iGWfMHTWllKiiom04FNiY28oW9i1X1zZ8MFXJbRG4bRSUs0/o+gs05xn1eVqLJH+ilikDNhQfwtqG/n/rL5/v+ebOvTRqSmwDdTl4uwDgkgN/qA84KlpLnNsUgUtHFZ5CPoACAvCI+RMOAokwRRGz3WEu83tkBI6t5v70EeyijuDKpyYCQmjyEJ2/S7xvZKABLQvXlAIbBI2Tw84t5R3oJ9AAE6ZCtk/dixOr+MrJh9aCH2nwntcvcpYLUwDEEt2sQ7Dc+HS30NaI+8bmNjeE+2wn4U57qDYg9NPjxDMBlfBpgEwBn5CZHvvwBmQ5CzyIb/v82UY6r03SQLrNzPv4lJiQ8wyOdxqQxf+lGKnd+UTR/eXxi9DDd2dR1rCGDKeddZWPPQPKvSzVFzAx1OVLlszYB3AEiIEZ4JJEKjmW39IbDnsWM5W/2d0gsiUY4CGlGC0FPBGtsaGu2vZaTCWHsCiXu2zIlwEk7RYHZAWqBA5a4vGtbm5OuZxR69cUsQPp6MQKJw2zE36c32+uRCXOy2F6L/KvmyayN78nVER9aRPhB6iL2jCqzJvUmkbmGlB7bG3BSbD6sEX/+b7PF7r4B+pLiNTVY2MgT392mWdgbreDaPnUOMmQ3vUfLG3lo=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(376002)(136003)(396003)(346002)(230922051799003)(82310400011)(451199024)(186009)(1800799012)(64100799003)(36840700001)(46966006)(40470700004)(81166007)(7696005)(478600001)(36860700001)(47076005)(356005)(9686003)(6506007)(336012)(40480700001)(26005)(83380400001)(82740400003)(55016003)(8936002)(8676002)(6916009)(70206006)(54906003)(70586007)(52536014)(40460700003)(316002)(86362001)(41300700001)(5660300002)(33656002)(2906002)(4326008);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 13:52:08.3141 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7948aab6-f4d0-4fc6-89b9-08dbf66289e2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A79B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5389
X-Mailman-Approved-At: Wed, 06 Dec 2023 21:59:57 +0000
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
Cc: nd <nd@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DRM subsystem keeps a record of the owner of a DRM device file=0A=
descriptor using thread group ID (TGID) instead of process ID (PID), to=0A=
ensures all threads within the same userspace process are considered the=0A=
owner. However, the DRM master ownership check compares the current=0A=
thread's PID against the record, so the thread is incorrectly considered to=
=0A=
be not the FD owner if the PID is not equal to the TGID. This causes DRM=0A=
ioctls to be denied master privileges, even if the same thread that opened=
=0A=
the FD performs an ioctl. Fix this by checking TGID.=0A=
=0A=
Fixes: 4230cea89cafb ("drm: Track clients by tgid and not tid")=0A=
Signed-off-by: Lingkai Dong <lingkai.dong@arm.com>=0A=
---=0A=
 drivers/gpu/drm/drm_auth.c | 2 +-=0A=
 1 file changed, 1 insertion(+), 1 deletion(-)=0A=
=0A=
diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c=0A=
index 2ed2585ded378..6899b3dc1f12a 100644=0A=
--- a/drivers/gpu/drm/drm_auth.c=0A=
+++ b/drivers/gpu/drm/drm_auth.c=0A=
@@ -236,7 +236,7 @@ static int=0A=
 drm_master_check_perm(struct drm_device *dev, struct drm_file *file_priv)=
=0A=
 {=0A=
 	if (file_priv->was_master &&=0A=
-	    rcu_access_pointer(file_priv->pid) =3D=3D task_pid(current))=0A=
+	    rcu_access_pointer(file_priv->pid) =3D=3D task_tgid(current))=0A=
 		return 0;=0A=
 =0A=
 	if (!capable(CAP_SYS_ADMIN))=0A=
-- =0A=
2.34.1=0A=
