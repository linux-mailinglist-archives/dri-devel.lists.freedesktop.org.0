Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WE2QMzTrlmkzrAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 11:51:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C13315DFCF
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 11:51:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A26DB10E2DA;
	Thu, 19 Feb 2026 10:51:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="RKDjUAuc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010055.outbound.protection.outlook.com [52.101.85.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CBFB10E59A
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Feb 2026 09:35:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JpSXdPf6n8HN1n6gjHkvRJnrfcafJEg9M/4ms+vDshDiyJwPpK5SznzSY/tEl7G2XGzb68mzE4KSGc9SF4KOuMUIUy57aRRO7lYZ7c8vBf+uphj4/ADdntEaWFLFkdpQ/5SzttE8RhoNWWWK0nfoRVrBpzMedURQ6IbXEEQ5IijDyEvsAYZyZ3euJ+Rfsn0Wo1yvFjAlqQ0Yxo0EII5Rnz9zmvZnhpZc5vpShjrAg0GT+Scktt4AHPYdQFMJnJtCfMAwygvRs6Lq+YaEc0XuDgBRvgi9egujqUOFpD8/ZLDPZezCZDo3J9OqKrRha2CWzFmCqmCW2daXKlJfVEAxoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zAuPOB5kKv9JvcSJkQadj1JbGTjOxXbhpOujO14SzyI=;
 b=QghrwfszmJskktFh8neL93JzocLH9cELYX2I7Pj7ldQqDprTU4XQFqjCVfD6BTsM/s6zifUyUicUtdzU1GkoFaJ4PktPSRhqOSR5C4fVJuYAtCK9H9YR3sCrOzLjzAQV0K2gZImgAMQtOM4k+Mq7sK+jc1ZAbzTBR6U2gzrmIsbRXMUZeu2XjhAld8Y6Uqf64ph4X4/tai5/wfCBze2QBFS2j55PF76QYAFKGkABGNW3d+sq/MADpWPYQakEsJYnzDrUY3xyzm7Lt82bCg6dFsIzxznFU1QP6UuUQc+hmPBkqoOikDzoQnMjZxoaiC+LPOqXBGUsWbe8dM0PG6AO3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=suse.de smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zAuPOB5kKv9JvcSJkQadj1JbGTjOxXbhpOujO14SzyI=;
 b=RKDjUAucO0c+DMFr5au7Vmg8LCvVdtBqwg+MKCpEmocF6nFe5Fw7rlM0lF+0DR++WimD+Na50cTFAhtvXkBc05WQ4Yz2DEeEgG2BxeTZ7d3I3YGZA9BDB+uS3l0zqFF+QEvGT+VOwv60wzRMLlK81yxpbi8p4X6PEZANQrgkcRo=
Received: from DS7P222CA0011.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::18) by
 LV8PR10MB7799.namprd10.prod.outlook.com (2603:10b6:408:1ec::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 09:35:00 +0000
Received: from DS2PEPF000061C7.namprd02.prod.outlook.com
 (2603:10b6:8:2e:cafe::27) by DS7P222CA0011.outlook.office365.com
 (2603:10b6:8:2e::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Wed,
 18 Feb 2026 09:34:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS2PEPF000061C7.mail.protection.outlook.com (10.167.23.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 18 Feb 2026 09:34:59 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Feb
 2026 03:34:58 -0600
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Feb
 2026 03:34:58 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 18 Feb 2026 03:34:58 -0600
Received: from [10.24.50.162] (uda0510294.dhcp.ti.com [10.24.50.162])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61I9YpSG643228;
 Wed, 18 Feb 2026 03:34:51 -0600
Message-ID: <cff8c928-9dab-49aa-942d-745d8b0fa75a@ti.com>
Date: Wed, 18 Feb 2026 15:04:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/6] MHDP8546 fixes related to
 DRM_BRIDGE_ATTACH_NO_CONNECTOR usecase
To: Harikrishna Shenoy <h-shenoy@ti.com>, <Laurent.pinchart@ideasonboard.com>, 
 <airlied@gmail.com>, <andrzej.hajda@intel.com>, <andy.yan@rock-chips.com>, 
 <aradhya.bhatia@linux.dev>, <devarsht@ti.com>, <dianders@chromium.org>,
 <dri-devel@lists.freedesktop.org>, <javierm@redhat.com>,
 <jernej.skrabec@gmail.com>, <jonas@kwiboo.se>,
 <linux-kernel@vger.kernel.org>, <linux@treblig.org>,
 <luca.ceresoli@bootlin.com>, <lumag@kernel.org>, <lyude@redhat.com>,
 <maarten.lankhorst@linux.intel.com>, <mordan@ispras.ru>,
 <mripard@kernel.org>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <s-jain1@ti.com>, <simona@ffwll.ch>, <tomi.valkeinen@ideasonboard.com>,
 <tzimmermann@suse.de>, <u-kumar1@ti.com>
References: <20251209120332.3559893-1-h-shenoy@ti.com>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <20251209120332.3559893-1-h-shenoy@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C7:EE_|LV8PR10MB7799:EE_
X-MS-Office365-Filtering-Correlation-Id: b68e79d8-e2f6-4bfb-e4dc-08de6ed0fc0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|7416014|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SFF4Z2FJSnlsM0FiSHRBalhlSWQyVE02UHZ4R2FUUFJ6NmhxRklNWU9KVXdP?=
 =?utf-8?B?cC90VnA5cUdseXdSZm1VcHo5ZFhka2xCTzJLQmQ4Yk5FOHVVbEdkaUF0d0Zz?=
 =?utf-8?B?VHJKZUY0UERyMWlGZE1Kd2o4N0xKS2lETi90OUxpV042clU5aXEwTlg0T0pL?=
 =?utf-8?B?eU5uY0J5QlRxdjBKYjB3Mm55RjByTGhTc1Y5RUhHd09Ia1h5TVRDbzdVNmNR?=
 =?utf-8?B?UmpuT3JjdDJzbnhjc3ZBcTQxa3FtUzBqR1M1QlNlbEZuM1BObGxuVG5YK3F4?=
 =?utf-8?B?TEV6ejluV0ErKzMvRWh5d2ZnZDEzeEhJVXVQR1NGYkp5ZjNCUW1TRlVVMCt5?=
 =?utf-8?B?dm1YRlJuVEExQ3dWNDA4d3RLM0JWTWQ0V0c2YzlZcjMrcUhURjRuWTNQbG9h?=
 =?utf-8?B?WHN1V3Z0K09saU5Tc3dkbWU1Vi9YSTVEa1ZJYWZraFNxMDh6NXNqK3lTRUhk?=
 =?utf-8?B?UUhSOVEvMjhsZkdiYzFvZEtCcHp3K0pUVGg2bVJiaUdkS1Z2OHJGUGtkYm55?=
 =?utf-8?B?TDBrWDRKTThUVnRlcDUyODFBUk1zRUZ6b0Z0L2ZPMUlieEw2cHY1cWN0M2ZW?=
 =?utf-8?B?Uk1lNVBZUU5GT24xT2s5emJCN1VueS9LZFZIR2luWHRYZW95b1AyY081OWJi?=
 =?utf-8?B?NGpjY3oveWllQXlhMzBMdlZrRUxWY2hMc29lQ1NnN2x3VmRzVHpkWG52YnEx?=
 =?utf-8?B?WVFGTTQ1L2MzaWtxWnFLWkR2QzJ2THlENGNYbG04eGxWVTRaSm5tbXYzaDBw?=
 =?utf-8?B?Sy9TcEJLY1R0MDlJcUV6SXBYVXo2UllUZlJqZ2ZrQjhEV2ExandEdG9hZi9R?=
 =?utf-8?B?TFNBK2pZaUhRTURFc3krYzRpcDcwd2w1Y00zeGNMeEZaN1laR3lSYXdiL25u?=
 =?utf-8?B?aXVSZTJkUFNqOVJBcHZhdFVjekl5YitsSS94cEgyYk1oZEhTbDBXckNmNXJr?=
 =?utf-8?B?NlV1VjMvZnhoaDRJRlJ0dE92SzZ2Y0VHM2RFb2NVMGtMMHRmWUR2NVBEUzRa?=
 =?utf-8?B?MGdRdmc3OVgweHYzTkg4NHRrczlXV05Hb3FUMlZ5MTJVQkYvMldJWWFad0hs?=
 =?utf-8?B?M21kZ3JkNktJekFEVXg2dS94UWg2NndKVW1XeHZwczU2QlRoSkdKdFR6MC9P?=
 =?utf-8?B?UXdvVVVPS2FhOVY0KzVITVlsME5IVTRjeTJpd2Z3c2hYaGRHUmkrRzY4ZDEy?=
 =?utf-8?B?TXVqWllKcmZOWjYrR2pTbVhManpXWnV4S2NKY2V3Z2k0YUxtV0tQenJFSWxR?=
 =?utf-8?B?M1JmWSthSDZvaFIyL01KZEJwdmlrNDNWK2FxZlpMVEg4dmtNN0c0SkZza2VZ?=
 =?utf-8?B?bDVkTEU4OG9Pb1RVT1RiOUdzRUpSRzVvNkc0VGdodFhLNTh6WWx6QzI1ZlFP?=
 =?utf-8?B?UWJHVmhKVmZzU1U1cWJQQTVxbHZKQnhyenpYODZhaTNtYWhrM3ZTSzk5MkNN?=
 =?utf-8?B?RVlnYXpqRndaN3VyMGZrUDBWYzdsOFN6d3pVWk80OVZPSmNwdE1aWXp0QWN4?=
 =?utf-8?B?MmMvUFA5cXBvek1CN2J4V1dqUGgxZFIrMEtrL3Vud1pWUnI2c1JZcDg5dUdU?=
 =?utf-8?B?UzVnektZa1VuU29RV2tXVHR3Z0R2WENTRHpDL0pWSEdDNndXUkNXVGNtcUNZ?=
 =?utf-8?B?K3NwWU82QUVUdklTRkYrL3N5UlZyTTZWYjdRQnJlZzBrUjNNSUNZQStrSTlu?=
 =?utf-8?B?eWkycE1YbStkTWk3R2pGMTJkbWR2THJJb2lhZGNleHhGalJvZDcyWFdzUS9y?=
 =?utf-8?B?Wk9iOEt4aklwdXVZR2dGeWU3alNEd0Y3QVNnZTV5cTd2dytIY3hnVXl2WXRz?=
 =?utf-8?B?UUlPMVhRMFJTa3c0Ykd5aVFyVi9idzVsY1lZSi9HZ29LL0ZZVHFVaFF2RWEv?=
 =?utf-8?B?YWhVVDJPcWFnNTRFUW5GUS9HQ0hveEt5OUJSM05YMGU3TnNnRTFEcTg0VERh?=
 =?utf-8?B?czUzcEUrZlFKUGdMRkYvVDlPaFgzY0U1cUJiMGFjNkpaTElpVTRrODJWalBB?=
 =?utf-8?B?TlhWY3RKTGhJREVMRjNnNEdLYUZwbFgwWWRUdHZnZW51N2xmcUFJcldDeHNx?=
 =?utf-8?B?bkpFM25wSys0VmQ3YjAvVmp6SkJFUjltTnRRemF5NjBITDBvRDJydnFmbkx1?=
 =?utf-8?B?NDlpVko0dlJGbWFDcmhkMDRsbHhVTklOdEJEZW53MmJST0V5THNSS2tsMVlC?=
 =?utf-8?Q?bS1isEBpvUdnFKAHfp0qvVE=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet200.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(7416014)(376014)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: OL8Lf/ovewUGBLDOR8R0DQU1eaHdhbMxMzGEdVnK4MPqAmv0eLtvh0YffYT2SbimEShCKcy6auVMLFbxWISsc6Lzk3PvdkSsUdT7VtgrjtAleW8uZqURAEwL9odQPkqfHQKpvArGBvJ/t7Rz7WPN6BtBoKIwx3prXQiAahqHTPLbb7akDOAVZGyZFJ7a9E6OCznfcoFVwidvoezIzh1tBh5nE9AzgoOo1/NDJVcPFfgkwwopl4bk4HArg37mDX7WlKbsPchqv46qwUQukzXeJHNJJzsMyaASHZbdydxlcbIN8y5drPvfxsic9vPzXE57EIOhzsPl+bsra6VdVOemhvyHjnogOQRcc3B0OmJq+Xm4XnFydWcV8yVdCracnHDd8Q5gYiBQorkYVRX6U1YJbc7tH++KDzL15fiEiEpiFdBdbPAfDX86lku77gbdfT61
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 09:34:59.3051 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b68e79d8-e2f6-4bfb-e4dc-08de6ed0fc0a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.194];
 Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF000061C7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7799
X-Mailman-Approved-At: Thu, 19 Feb 2026 10:51:28 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DATE_IN_PAST(1.00)[25];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:h-shenoy@ti.com,m:Laurent.pinchart@ideasonboard.com,m:airlied@gmail.com,m:andrzej.hajda@intel.com,m:andy.yan@rock-chips.com,m:aradhya.bhatia@linux.dev,m:devarsht@ti.com,m:dianders@chromium.org,m:javierm@redhat.com,m:jernej.skrabec@gmail.com,m:jonas@kwiboo.se,m:linux-kernel@vger.kernel.org,m:linux@treblig.org,m:luca.ceresoli@bootlin.com,m:lumag@kernel.org,m:lyude@redhat.com,m:maarten.lankhorst@linux.intel.com,m:mordan@ispras.ru,m:mripard@kernel.org,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:s-jain1@ti.com,m:simona@ffwll.ch,m:tomi.valkeinen@ideasonboard.com,m:tzimmermann@suse.de,m:u-kumar1@ti.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[ti.com,ideasonboard.com,gmail.com,intel.com,rock-chips.com,linux.dev,chromium.org,lists.freedesktop.org,redhat.com,kwiboo.se,vger.kernel.org,treblig.org,bootlin.com,kernel.org,linux.intel.com,ispras.ru,linaro.org,ffwll.ch,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_SENDER(0.00)[b-padhi@ti.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,ti.com:mid,ti.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[b-padhi@ti.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	NEURAL_HAM(-0.00)[-0.994];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 3C13315DFCF
X-Rspamd-Action: no action

Hi All,

On 09/12/25 17:33, Harikrishna Shenoy wrote:
> With the DRM_BRIDGE_ATTACH_NO_CONNECTOR framework, the connector is 
> no longer initialized in  bridge_attach() when the display controller 
> sets the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag. 
> This causes a null pointer dereference in cdns_mhdp_modeset_retry_fn() 
> when trying to access &conn->dev->mode_config.mutex. 
> Observed on a board where EDID read failed. 
> (log: https://gist.github.com/Jayesh2000/233f87f9becdf1e66f1da6fd53f77429)
>
> Patch 1 adds a connector_ptr which takes care of both 
> DRM_BRIDGE_ATTACH_NO_CONNECTOR and !DRM_BRIDGE_ATTACH_NO_CONNECTOR 
> case by setting the pointer in appropriate hooks and checking for pointer 
> validity before accessing the connector.
> Patch 2 adds mode validation hook to bridge fucntions.
> Patch 3 fixes HDCP to work with both DRM_BRIDGE_ATTACH_NO_CONNECTOR 
> and !DRM_BRIDGE_ATTACH_NO_CONNECTOR case by moving HDCP state handling 
> into the bridge atomic check inline with the 
> DRM_BRIDGE_ATTACH_NO_CONNECTOR model.
> Patches 4,5 do necessary cleanup and alignment for using
> connector pointer.
>
> The rationale behind the sequence of commits is we can cleanly 
> switch to drm_connector pointer after removal of connector helper 
> code blocks, which are anyways not touch after 
> DRM_BRIDGE_ATTACH_NO_CONNECTOR has been enabled in driver.
>
> The last patch make smaller adjustment: lowering the log level for
> noisy DPCD transfer errors.


A gentle ping for this series. This has received multiple R/Bs.
Please help with a review/merge of this series.

Thanks,
Beleswar

[...]

