Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC89302521
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jan 2021 13:51:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85F366E13C;
	Mon, 25 Jan 2021 12:51:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2050.outbound.protection.outlook.com [40.107.92.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 229F36E139;
 Mon, 25 Jan 2021 12:51:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nvkUVhUe2yGK1j5dcNoFG04SxgWG9ZIcvRLvt8eCn3VekCAhtW+gGEn1//1OrgpI7EfBdN1NMPG+TcRG+C50pyuSUilkxBJNoHk+M3TS6jEjCbdLJE9nSkvewQeeJhIZY+EeyvctXap1qhs+1Ej5iGUZf67AwUvvQhTB9UZnA6rNQ5ZCAMRusLFKa+EuxjYiWynjL94WsoUfWdwvkSm632c19aceV76Ta54DYozctZwmWyJs/+TjfFyM2SjGM5Jq/fziAwMBVkj7igic3rj70QAz2MU6D1jMKcbE7N4Slh5cA2lrVD0Ze0MPJoDxVzYQPIvALQfcM34uAgfUPFW/pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y9eWoRtzmfEofR7xel36hDq/sZcTaQavEWF3YgC/kVc=;
 b=EmnYQSL0S7nqclw7OoJxc45kI+3NKuD4rfLLySqR/+jMpq8wJreG54ZrvWDNK/EJQNSyh+bkHXFWntjXyrCKfEq7jwmvO6qXgVjD3TH2WSUPrE70owG+MgVbWbmFxqifzDl3miBGEXaNTHpHq4b5wfhmeEy1/8JPV9dhrPOCh6y4kSI9620OmQrTiVEmFZOlejdYUeoFjMPBvoS3oYfiWXIPwwZLe2leKTg+72jI14ctPv2lL54/mZcJnNtwpEOgdj9R0SeUY6udpeWSO7Z6VxqE7FyEEm72+E0o/pg6kOZciCWXqDNz8rByinMvwtxBxNzTGTF4PLfsl8w378JGrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y9eWoRtzmfEofR7xel36hDq/sZcTaQavEWF3YgC/kVc=;
 b=yRhxnUFQGQ8hIDEVamzyiiTGm1f63PE6EY/PkJn1S1pLrc4Xld4ozn2r9EHyn6xv5Bvx2POYPVWmFPDSCEIIEOlfq2eMH7Vy1KR429eqgXdBVdqYcM218Vwd9G3qZClCHaOL/Bj6wauHO7TaZihtn0ExazXdNvOrteYQ2HCJdiU=
Received: from CY4PR12MB1287.namprd12.prod.outlook.com (2603:10b6:903:40::8)
 by CY4PR12MB1749.namprd12.prod.outlook.com (2603:10b6:903:11d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Mon, 25 Jan
 2021 12:51:34 +0000
Received: from CY4PR12MB1287.namprd12.prod.outlook.com
 ([fe80::bc0f:dd2:ef80:de2]) by CY4PR12MB1287.namprd12.prod.outlook.com
 ([fe80::bc0f:dd2:ef80:de2%12]) with mapi id 15.20.3784.019; Mon, 25 Jan 2021
 12:51:34 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: Arnd Bergmann <arnd@kernel.org>, "Wentland, Harry"
 <Harry.Wentland@amd.com>, "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, "Aberback, Joshua" <Joshua.Aberback@amd.com>, "Lakha,
 Bhawanpreet" <Bhawanpreet.Lakha@amd.com>, "Kazlauskas, Nicholas"
 <Nicholas.Kazlauskas@amd.com>
Subject: RE: [PATCH] drm/amd/display: use div_s64() for 64-bit division
Thread-Topic: [PATCH] drm/amd/display: use div_s64() for 64-bit division
Thread-Index: AQHW8w7f9zwUf5VmV0W3hq1/1dnYF6o4SpRg
Date: Mon, 25 Jan 2021 12:51:33 +0000
Message-ID: <CY4PR12MB1287B8B020D280A5F12ED62DF1BD9@CY4PR12MB1287.namprd12.prod.outlook.com>
References: <20210125114012.2480845-1-arnd@kernel.org>
In-Reply-To: <20210125114012.2480845-1-arnd@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Enabled=true;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SetDate=2021-01-25T12:51:27Z; 
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Method=Privileged;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Name=Public_0;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ActionId=5905a068-9ca2-433b-ba79-be6e78fd8f54;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ContentBits=1
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=amd.com;
x-originating-ip: [180.164.215.185]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 77c5e308-4ba4-4981-7aea-08d8c12ff1fa
x-ms-traffictypediagnostic: CY4PR12MB1749:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR12MB1749C15C542A56BD78DFDCFBF1BD9@CY4PR12MB1749.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2512;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uaAQ+ctbBbdbu3lfLtifZAqixiQ0828cvvd0QZSCU0jpcHfDWKgSZUzs2B9poHXwfsJ4COdF5wKveRXkaEZClPgJ0VT3l3neArQSefmhx5BPcpsA37JlTK2j1BYkqpL9Ur9QZgRnUqyTtFTujBPYQqyabGBtGBAWBTFCTtP31sEUpLgyFYNJJBN7ZKfTtux7IpYQNcMEtPYND2QRcmQ/nuT33eER5aW3sOwTFVklYiqzK/e5UawLIfEacjctRZ72Ib7tLMI7fpg3mKO79JOCwvrIsNpErd8QrvILBAmYkER/J61uNBa0aN47nqFwIwHvqo8BjvhhM3eGTTZlZ2o5zCcfQO11YH14quPF6NevvYwYolim4ubKRvCxQA6z1jnrW07RHNNFh+JulOLmg7D1hp2eHIw2c7UZNaIiibuNxKFRIxNOUeCnRzLNF+msh5MD4+YMuEhGUwPE19v7RsNCcNjuTPZZAccg9E4qniqrR+Y=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR12MB1287.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(136003)(346002)(39860400002)(376002)(76116006)(33656002)(966005)(71200400001)(54906003)(316002)(66946007)(83380400001)(26005)(110136005)(6636002)(6506007)(2906002)(8676002)(66446008)(4326008)(66556008)(66476007)(8936002)(478600001)(55016002)(64756008)(53546011)(186003)(45080400002)(86362001)(52536014)(7696005)(5660300002)(921005)(9686003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?qnAyumjZh6LVZQzhx8goOUF6iPjKICO2EG2VcxIwTRVr2BrNIeVTZYNEfS8f?=
 =?us-ascii?Q?rik6O4KO47FPiU8xdRyldEByhHiYmoKSmRBILmg1wQQVKODHMbYGoCod3Z2J?=
 =?us-ascii?Q?SWtwfnf7+OUzcQ7n7RJ8ctD+Qlf0EOC12H6Jk0761u/xV7H3FLMe4qx89HTm?=
 =?us-ascii?Q?nNrXTOiLYnYDCpC+nO9utEEEo80/c6pZkLbOCP5VSHePeF2eSoL4As0GtxcC?=
 =?us-ascii?Q?y8MwQlGv5Iy5M+7o0xQxSldN5+zen3FSvtsrGElr0LYYwOsNR7ETLhw14/Xc?=
 =?us-ascii?Q?XaAtPAmwN5mG8QPPt6cMgfWac6nHJVCJFQSRa0YLkeeBgejKtBco8VePchoi?=
 =?us-ascii?Q?ZU3SyQX66u5InkDXdBcn+2kAE7FvPJICqo/0tSNj8sKU0FwRghC8ccePr/vZ?=
 =?us-ascii?Q?v+EKyoyINmuDM+F3h3nZFZ7z14i2JWYVID1JsaqLznHQpeEZ7t8wSOdBxoyn?=
 =?us-ascii?Q?ZuLtX97SgKpey6LO1If7gVb3+mhwN8no13kdQxRLi3VwVvee5+JdF8lulHNS?=
 =?us-ascii?Q?O81Eh+Gb7NngxC96T2jGVlN9fX8sReAPURsAsXyjD5hFaX2M/1WDMoQ91hIT?=
 =?us-ascii?Q?ZYPq4lveyJemIKldotxBoBrpHLSuiektdPNpH8+xU7SA8UVb+PIHZnPtMpqu?=
 =?us-ascii?Q?/VA6brMXpL6J65odVJ8Lv/b2SWcij51fEvku1F15k/RcSUfQKOdM5waxcGzK?=
 =?us-ascii?Q?rwhGsccT65NCtBoAEU2Ofelk4Sx90IwlVYr1XUJUhFgxVA7ibPkOvdD8/Qsh?=
 =?us-ascii?Q?EnUtY5+VNpm0pPA+0qalmUh8BrHuS+ylgthG2xxP4W0f1MYHB8dLODFtGBlK?=
 =?us-ascii?Q?fGrkJ2vBHJrQHZ5eAtiQRUxYgWb67BPjdbKjj4sH+aI0E4ZvvGasjrZNnOrf?=
 =?us-ascii?Q?AmU9Tvnegupyz5huNEn+FBBS54vCpwb0VgDrx3G9C7y/+BdrDdZ5HQK/3Q36?=
 =?us-ascii?Q?7SywyuUmqIBOOIUN/IIpgZhH3TMIvt0jmjPyO7iabVmVF9/lo8ai+rYxqbbl?=
 =?us-ascii?Q?EvyEedJgPQlOq0jEgNtOsgasAeLV9KyltcpqZ2ivIvrVJpNiPMk+oAENJG6a?=
 =?us-ascii?Q?MJZIdILd?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR12MB1287.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77c5e308-4ba4-4981-7aea-08d8c12ff1fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2021 12:51:33.8034 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: icYnYWQN6lkGZ92f2hlAK/tRzLYtiz3wEASIUK3Z7Dxd0lDjo8ZUu6MIO2+/o+LwZpUF5mBKF4IH+RUzmVB3Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1749
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
Cc: Arnd Bergmann <arnd@arndb.de>, "Chalmers, Wesley" <Wesley.Chalmers@amd.com>,
 "Zhuo, Qingqing" <Qingqing.Zhuo@amd.com>, "Siqueira,
 Rodrigo" <Rodrigo.Siqueira@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Jacky Liao <ziyu.liao@amd.com>, "Leung, Martin" <Martin.Leung@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Public Use]

Hi Arnd Bergmann,

Thanks for your patch. This link error during compile has been fixed by below commit and been submitted to drm-next branch already.

5da047444e82 drm/amd/display: fix 64-bit division issue on 32-bit OS

Regards,
Guchun

-----Original Message-----
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Arnd Bergmann
Sent: Monday, January 25, 2021 7:40 PM
To: Wentland, Harry <Harry.Wentland@amd.com>; Li, Sun peng (Leo) <Sunpeng.Li@amd.com>; Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; David Airlie <airlied@linux.ie>; Daniel Vetter <daniel@ffwll.ch>; Aberback, Joshua <Joshua.Aberback@amd.com>; Lakha, Bhawanpreet <Bhawanpreet.Lakha@amd.com>; Kazlauskas, Nicholas <Nicholas.Kazlauskas@amd.com>
Cc: Arnd Bergmann <arnd@arndb.de>; Chalmers, Wesley <Wesley.Chalmers@amd.com>; Zhuo, Qingqing <Qingqing.Zhuo@amd.com>; Siqueira, Rodrigo <Rodrigo.Siqueira@amd.com>; linux-kernel@vger.kernel.org; amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; Jacky Liao <ziyu.liao@amd.com>; Leung, Martin <Martin.Leung@amd.com>
Subject: [PATCH] drm/amd/display: use div_s64() for 64-bit division

From: Arnd Bergmann <arnd@arndb.de>

The open-coded 64-bit division causes a link error on 32-bit
machines:

ERROR: modpost: "__udivdi3" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
ERROR: modpost: "__divdi3" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!

Use the div_s64() to perform the division here. One of them was an unsigned division originally, but it looks like signed division was intended, so use that to consistently allow a negative delay.

Fixes: ea7154d8d9fb ("drm/amd/display: Update dcn30_apply_idle_power_optimizations() code")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
index dff83c6a142a..a133e399e76d 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
@@ -772,8 +772,8 @@ bool dcn30_apply_idle_power_optimizations(struct dc *dc, bool enable)
 							cursor_cache_enable ? &cursor_attr : NULL)) {
 				unsigned int v_total = stream->adjust.v_total_max ?
 						stream->adjust.v_total_max : stream->timing.v_total;
-				unsigned int refresh_hz = (unsigned long long) stream->timing.pix_clk_100hz *
-						100LL /	(v_total * stream->timing.h_total);
+				unsigned int refresh_hz = div_s64((unsigned long long) stream->timing.pix_clk_100hz *
+						100LL, v_total * stream->timing.h_total);
 
 				/*
 				 * one frame time in microsec:
@@ -800,8 +800,8 @@ bool dcn30_apply_idle_power_optimizations(struct dc *dc, bool enable)
 				unsigned int denom = refresh_hz * 6528;
 				unsigned int stutter_period = dc->current_state->perf_params.stutter_period_us;
 
-				tmr_delay = (((1000000LL + 2 * stutter_period * refresh_hz) *
-						(100LL + dc->debug.mall_additional_timer_percent) + denom - 1) /
+				tmr_delay = div_s64(((1000000LL + 2 * stutter_period * refresh_hz) *
+						(100LL + dc->debug.mall_additional_timer_percent) + denom - 1),
 						denom) - 64LL;
 
 				/* scale should be increased until it fits into 6 bits */ @@ -815,8 +815,8 @@ bool dcn30_apply_idle_power_optimizations(struct dc *dc, bool enable)
 					}
 
 					denom *= 2;
-					tmr_delay = (((1000000LL + 2 * stutter_period * refresh_hz) *
-							(100LL + dc->debug.mall_additional_timer_percent) + denom - 1) /
+					tmr_delay = div_s64(((1000000LL + 2 * stutter_period * refresh_hz) *
+							(100LL + dc->debug.mall_additional_timer_percent) + denom - 1),
 							denom) - 64LL;
 				}
 
--
2.29.2

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=04%7C01%7Cguchun.chen%40amd.com%7C4bb97aae9edc4153392c08d8c1260048%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637471716255231899%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=kLdkVHfkYx%2Bd249%2BmtG5GJTq295Pxzw7mgTe0FD8QvY%3D&amp;reserved=0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
