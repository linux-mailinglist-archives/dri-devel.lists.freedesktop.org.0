Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA05C914390
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 09:23:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08D8E10E384;
	Mon, 24 Jun 2024 07:23:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=synaptics.com header.i=@synaptics.com header.b="sEztR52A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2109.outbound.protection.outlook.com [40.107.237.109])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26D6A10E373
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 07:11:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dFDebIR4cVl34e90GrDLQ1PfQ/ZKJVYHItb68RhJi3gBtalNH+g+plEWFN4cWtFSw46m5N8gn1+E2yNVFlsB3lbtLXWp2ss9YQFPjJZOuubgvdMfwlQ+qHxPaImt6hyimQsA0UV5cFM3UdBm4nUTBcX7xMDS7pBeNB6fJtKnlKgEkTsQHMj4R7lS8aWTR1kqcG9saZAlrQLqAGUDbVX3XQFgDpOXFCJlAbGpT1q6BZOlGW/cKIBBUTGsLEg/U+hPoDs7oGqKT8e0phkiIhc0zFwq1i1DKwhxLh6+wJyDawoLG0HatsegAZT3LA4g7sh44Ku9iMH3L57Q8x7uyqFEEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=onylsF04H65p4cNS9Gq/jVFb4QEKUi6xIP+DEei472c=;
 b=I3fAVAeX+iN/e/QSR2mLvTe2rJbMt8QHgl1INAzgiK/gEygZ5QkEKQ5NZB+I00WjEAU5mGVMfGfW4zzV3hwkrKOc+iu8YoxLTsJx9TCUjoyaSVUaHwl6l/ANxPKK+c1QYYX5jgOXOvbHooxRI8LEdfNwrU9Mks+WBGxNIhf/BLfILxcmVgsWS8UUPUZUnE9+PI6QQOMxqxNR3266TAWzm0gIXdHTfWoHMHr4jUnYS/mxjwQhTl144GR0YSFhzAn0OSrVI/bAGpXniQLKNxnGNvhZj1/4Kzf1FG1U5BRlcDBcE1xpn94eo82BQ/D9fC0dXoACAthmLFa8JLa86yu8BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synaptics.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=onylsF04H65p4cNS9Gq/jVFb4QEKUi6xIP+DEei472c=;
 b=sEztR52AkMRWkB+s+gku2Q51RBxti5n6NEbny3MT4dCq1qn95KHmHNRwmoJ2uTRhGNru1ObAPrvaHYGPF2IxxH4S4Q7PpnHKMmP5Mif2soePdc+vYKrId+Ge4YTkPSZuXvGEewsSPX1IS6cp+etUQ6JEjOSirW2MHsqOOYCFoLg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synaptics.com;
Received: from BN9PR03MB6188.namprd03.prod.outlook.com (2603:10b6:408:101::18)
 by BY5PR03MB5063.namprd03.prod.outlook.com (2603:10b6:a03:1e4::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.29; Mon, 24 Jun
 2024 07:11:23 +0000
Received: from BN9PR03MB6188.namprd03.prod.outlook.com
 ([fe80::7b19:7f50:4645:3990]) by BN9PR03MB6188.namprd03.prod.outlook.com
 ([fe80::7b19:7f50:4645:3990%4]) with mapi id 15.20.7698.025; Mon, 24 Jun 2024
 07:11:23 +0000
From: lukasz.spintzyk@synaptics.com
To: dri-devel@lists.freedesktop.org
Cc: Dave Airlie <airlied@redhat.com>, Sean Paul <sean@poorly.run>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?=C5=81ukasz=20Spintzyk?= <Lukasz.Spintzyk@synaptics.com>
Subject: [PATCH 3/4] drm/udl: Allow smaller plane sizes to allow cursor plane
Date: Mon, 24 Jun 2024 09:10:40 +0200
Message-Id: <20240624071041.5087-4-lukasz.spintzyk@synaptics.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240624071041.5087-1-lukasz.spintzyk@synaptics.com>
References: <20240624071041.5087-1-lukasz.spintzyk@synaptics.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0209.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::16) To BN9PR03MB6188.namprd03.prod.outlook.com
 (2603:10b6:408:101::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR03MB6188:EE_|BY5PR03MB5063:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a8bdbc5-98a8-4faf-5557-08dc941cdb1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230037|376011|1800799021|52116011|366013|38350700011; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cmwySlpDVnE1bzF0d3hCdmd0ak10bG9HakQ2WDF3emV0M3VwV2hyQ1dMUlRm?=
 =?utf-8?B?aGtrY2plRFZENlYvRVY2eEc2R0ErRXFMMFh6cHJPT1k2cHBjRjkzYnpJb2Ny?=
 =?utf-8?B?b2ZMMXQrS2h5aFl2bXVxVDFBdHQwbDZNa1ZvZXJzQktob2h3eVEzd2ZHM1Fv?=
 =?utf-8?B?SEIyUXQxQnh1b3NVSS91VXFDZFpoSExMaWtaSWp5TjI3Z1dWZWQrUFJyalFP?=
 =?utf-8?B?a2h1bm9oNmpGaW03T0RMYktYc01GcmxCY1ljSytUWnE0WWhNejBPcUI2NG1a?=
 =?utf-8?B?RC9EdmtQU0trUEhkWjZ0N3pHaklGb3FSaWZ1T05CaVhhQ1BzY2dWa3dZZmpa?=
 =?utf-8?B?cUpkeER4N1MrOVJ3cGphQ0VZQlRUTHFjVmNkYVk5TjN5TFJrUmc1V2lCWHdu?=
 =?utf-8?B?elN0cVpLZW1jRnZoaEJGZjErVm4vbXRtOTg5eDMwZFZKQ01qZXhOTjVEVThs?=
 =?utf-8?B?UDdHbjcySVdkWW5DVk5FRHZxOWRVY3hsa3MzU1lBZTFjbmgrUm1ybjhwb0tt?=
 =?utf-8?B?QnpIY3VaMWE1dXdGaGJ6WFBVdktYVnBNQ3BhWU1CNis2ZEJNekZzTHBkWEYz?=
 =?utf-8?B?eTR1QjhaY0xJWUVWUlg1T1ZRc1RNc211dG1wMmNjdHoxejUrWlJRSlNBSlNx?=
 =?utf-8?B?VEhOMVBjVkJWb0NlaFBGbmFuZzlyY2VmR2pxcCtTRFBKN1NqUFBUcHNzN0xn?=
 =?utf-8?B?ZkhNMkIrN2pGT0t0aVVJclNJcVNFS3NhM0RldUZMVmxaczFZeWY2Q280b2ZK?=
 =?utf-8?B?WC92M2xrVE81cUFFRjgxczRtWUc4aGl3eVZGN1hpZktzWjQwTDQyanlYYVZn?=
 =?utf-8?B?OGhKT2U0aVBhTnVnQXhNNGFrUkhHdUVtdC9RaXh0QkQ4SGo0WVFMbEUvMFhH?=
 =?utf-8?B?NWdPU3VYd3JocyttRlN3Tlc1Zk1rU1FZWEFka1VSbDZkbGJ5RGgxV0o0cUpw?=
 =?utf-8?B?QjZRU2RzblA1elJVZkpYQ0MxcE1PeHdheXVPeVZtVFZRN3BaOEI0ZnZmZDVU?=
 =?utf-8?B?SjhpTE9OZEpFc0RLYzVBSmE0VVNKZFkrWitoeXA5eCt6RzdtYnlVNU03YzBt?=
 =?utf-8?B?blAxOU9rUFlHYm5FV3kzditNQVd6dlF5Mlc3Y0lqMklweXBEMzJ2NEpCSFkr?=
 =?utf-8?B?RWRLWURtRjJ1OW81aE9laHNoVGE0aEV4NGt4YXk1RHY4NUtqcTFDUDFLaTlH?=
 =?utf-8?B?MzlhR0ZoekhTaS9TT3llNlFkVElqTW9jT3ZsRmVpVi83d2hESEFVcEtkdGpE?=
 =?utf-8?B?WUJCMkRaMkl1WHdxem5yamNMS0J4K014RUhRbzJyYWt1UVpCTkRTUHNDZ1po?=
 =?utf-8?B?VFFSVFlwcE1hbUNocURTaGZ6SWJleEJhbXRtVDBIUmkzbXdZYy9wMEtHaFF2?=
 =?utf-8?B?b1R0VWloWFl3UG1uWGN0TkJsVlhyRW82b0RBekdiZ3Y0ZTU2UWVNaWxEK2g0?=
 =?utf-8?B?a21IY1A5azhNV1NKMEdlN1BlL0ttdUwwRWtYUEh4KzlsdGZubW94RG5nb3NQ?=
 =?utf-8?B?U3E2bFFUWDFKdDU0NmpackNVQkJPcmVERVdEWlArZFR1eWNvMUI3WXdBNW9j?=
 =?utf-8?B?bEhvOEhIVnQ0bVluelBVK3J4YWtzd2syNFlMUXdFV3J1eW5FQ2pCVXFlRUQw?=
 =?utf-8?B?aXhzaDQrSFAwYjBFSytvbnBFVnc0RHFteTdJYm9jTTljWjNxUVgrR0hCSTJD?=
 =?utf-8?B?bytEV2xETXdhdzYremxDRWxBUVJDb1Nzc0pDYm5HeEtua2tlMHJtbEJaQ2U0?=
 =?utf-8?B?YVNnWnI2UmZUZ0VpQlpocU9SS3dackVlZkk1UlppVG1mSk9UaHhJdDE1a01r?=
 =?utf-8?Q?Z3Rk2x5NzkWXEtEXS5rNSliixsUXZ0szYfqKs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR03MB6188.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(1800799021)(52116011)(366013)(38350700011); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUFpSlhqckpQalZCVkVjUFFpdXJoU21MVnlLZFFQQjdQM1VIWERsUy96RjJY?=
 =?utf-8?B?RllmcHBLL0xuQWtpNlJPeU9YRkdGM2RvbVpZNTA3SW1rc0dpTFpKRWpLVmlh?=
 =?utf-8?B?WGF4WUhMZFNoZURySU5LanA3V0t1K0pMcXVvOW1LOG9QeWRHN2JKWUtDOTdo?=
 =?utf-8?B?Y2E1aU5jTW4vbVVON0tRSGxMTmN3ZUtBeFJ0WmhBbC8xa0JZNlg5ZHliMEgv?=
 =?utf-8?B?UTJTaHc5eXlQa00wbDBldjNacXFLdlk1KzVuUzFuSjdWWm9OZU94UHZzQUd4?=
 =?utf-8?B?WUt5ZVpvSFdBTEN5NmJsZEYvUjQzZUJ1SmxOZXZiMVh4S1VVcllXNVJGQ2Rn?=
 =?utf-8?B?MjBxUERRbHl3QXJSMkxlbWRNV3pkc1NYM2JkL0ExclNXRGd2NnZNanl4ODhP?=
 =?utf-8?B?bWpOcDNZa3A1aVdOZG5kVzhtK3R3NklEMUIvazIwVVh5RlFLWlNkVWViUzFu?=
 =?utf-8?B?cTh4bmVpeTlKUFFXcGNsM3E3am9ROFAzMHA2WWlsQXNUL216TjFpU3hDSWIx?=
 =?utf-8?B?Z1dIbE8rd2VrZ1p1OERjbXlESVprL3JhWTVIN1FNbXVaaHVLMlFkZ1NjanAz?=
 =?utf-8?B?SmMyall1S3Z0M0VVTjh1bFJJei9EVG9tbkg0cEdqYUFvdjhQcjRpRTA2TnJZ?=
 =?utf-8?B?SnFwTkJrMjFhSHhydUhVWk9aQjhDL3UwdUlhYjliSUw4cEs5akxGbGl3Q0lB?=
 =?utf-8?B?b1h6b2QxbDk2LzR0amwxRmhLS2g0VWY1QThQWXNwL1BTMEcxVzIvM05DbkNL?=
 =?utf-8?B?QlpTaW13elRTZ3M5UVlZUW01cVpNeDFhVjNFcWFjRFdOMkNMSWF5VWZwR3VU?=
 =?utf-8?B?N3N1NXo5NjUzU2Z2cWVZYlJkVGF4MEc1VktLN2hvWGE0K3prdFNKOThGR3Z4?=
 =?utf-8?B?WUh5bUh3WUtMeUpXcHZOTmlZN0dBVzRUVDlwR1hCeTYyTGdRaVUvbldvV2ly?=
 =?utf-8?B?WElOK3NJSS94cGRrQjQ1WnRqR2lPZ25DMHRjVmFvNHYzNGQ1MjdrOVF1amo1?=
 =?utf-8?B?UFhVYldaR3RGdE0rVEMxb3BGNHlSdGR5U25SUjRqL01NMllxVHZVdXdUNGh0?=
 =?utf-8?B?cEZLbU9zOUR2UUl0d1NselRkQ3JjU0hFYlA1Q2FNM1c4TW9TVmpEa1B3RVJo?=
 =?utf-8?B?SHJYYjBmNWkzRy9wZHd0K0xaQ1BWNlZXUkpwQXJuTmhXQlA5SjlYRHRnc0tR?=
 =?utf-8?B?QlBUK3ZleXNGVVhKU3I1KzZJUllQVWNTTFNGenIxUXFNMiszRXlVTlhyWVJp?=
 =?utf-8?B?M21BZkYrMUR4KzFnay9ITlVtVmY3aTA2ZSs1NDNaZEFTWjVrSVNMdCs3UTRa?=
 =?utf-8?B?bDc2VC9kenFORkhRaFpCNjNXeklPQ1A2QVYzK2hnMEpscG5vaVc5c3VJVDJ0?=
 =?utf-8?B?UUVoKzdJZ2dDakJWYXVBZjlMVG13Q2NVVXczSHRzYnUxUllVZ2RoRTNGU0lH?=
 =?utf-8?B?M3lhRDAvd3duc0t4d0J4azQ0QWN2VXFTVFArM3JzajZ1K1kxQTZxOVdXdCt5?=
 =?utf-8?B?NmRTNUZISTIyRzMwb2xUbmxtelRLU3ZJb08rSXkvUTArMXlkUzNHc015Tm11?=
 =?utf-8?B?azZkazV2MjFKZERnWUFVUUhydjlQNm5Fd2VxQXlMUFNrZnlmMnhSWEJvUUhK?=
 =?utf-8?B?NldFMFk2TEVJd2plNS9SQ01xUUVvT05MdlpBdGxUbEQ4cWtMcjYrbUxxYWRx?=
 =?utf-8?B?cFVtQ0NiMzVvUmF5RWc5aWNycWhseEpPK0w0NVBpL2c5azZ2NEVPVlArSm8y?=
 =?utf-8?B?Sjd4UGYzMk9BdHlYeDhVZjFqaFRFK3ZtTlVGNTNaUytZbFpySVlFTW8yZzNO?=
 =?utf-8?B?MVlZdDlyczFtOWllRWFZa256OEEwbkxaUVg1THFpRUhmekFmUjY5Qy9LdlJk?=
 =?utf-8?B?Z3JnVnQxTmhGdFhiRXloTzJ2L0xUdDI1K0xTMFZyZ0dOWjExQVdSNi9SNS9T?=
 =?utf-8?B?YUZ3ZEk0RU85cUM4cmFDYVVNOS9HYWlWdUNZaW83SjJwU0Q1QWI2cnlNZUlR?=
 =?utf-8?B?eGM3WCtOTDFmZHNJckFaVVpScTRzOERrLzl4NmVIL09jMi8wL2s2bUI2NlJp?=
 =?utf-8?B?M1U3RHFZMDdNK3lHWUFXSUZjWTQzYk9sQWxnMVluQWFmekZzTVA0eTk4dk1k?=
 =?utf-8?Q?KWHW98QfdX0fOwUnJjs6dsYBY?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a8bdbc5-98a8-4faf-5557-08dc941cdb1a
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB6188.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2024 07:11:23.7828 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1zP0iJK5ddmtJO6APPScMukhc9qNtJo7gvIEHdwKc0yinZ5wfpG9qr4YOGl/kg7FanKGtj+Kx3YGl4jTbQz+Uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5063
X-Mailman-Approved-At: Mon, 24 Jun 2024 07:22:58 +0000
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

From: Łukasz Spintzyk <Lukasz.Spintzyk@synaptics.com>

Signed-off-by: Łukasz Spintzyk <Lukasz.Spintzyk@synaptics.com>
---
 drivers/gpu/drm/udl/udl_modeset.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
index 0bd4e2f02dcf..28b7c269e913 100644
--- a/drivers/gpu/drm/udl/udl_modeset.c
+++ b/drivers/gpu/drm/udl/udl_modeset.c
@@ -659,8 +659,8 @@ int udl_modeset_init(struct drm_device *dev)
 	if (ret)
 		return ret;
 
-	dev->mode_config.min_width = 640;
-	dev->mode_config.min_height = 480;
+	dev->mode_config.min_width = UDL_CURSOR_W;
+	dev->mode_config.min_height = UDL_CURSOR_H;
 	dev->mode_config.max_width = 2048;
 	dev->mode_config.max_height = 2048;
 	dev->mode_config.preferred_depth = 16;
-- 
2.34.1

