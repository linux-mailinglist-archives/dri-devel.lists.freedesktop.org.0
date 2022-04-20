Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCE750870F
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 13:32:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB73A10F24B;
	Wed, 20 Apr 2022 11:32:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2047.outbound.protection.outlook.com [40.107.93.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D1CB10F245;
 Wed, 20 Apr 2022 11:32:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CW16o9pEcXLySIWtntByfEah6H+K6BswtA0dVz4i5zM8Hen0maVlmr+PuSidCcOo3PZq6XmKwPrrZVntfcsZ5+V19qjKW+zePiIZT+FjG4zGEH33s3cKSz9Zyw+lX4HAP6GrXXKB4Dcw3mZoDu+Rh8N7sFw3L1jPZztloPN9BBUrcLTpjbB9gKxmJs3RVngv5GQuaLKliRs/LM9pUqwerlVaU4fCGkpmHC70IUy3npmrYwssSIXWAOzxZDmaPxwNEQ2vRd3bpxxzagUNRDsxREN0l8hVsPQyK/ktp9ePURPawBC9rA91E1nFGvXav2COfjduCyzpT9OTw004ehF6eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fu7h3AoxKxgJ0cYGEogmAe15e6av5Ir3pm4CE9lecZU=;
 b=N0fwEFqpawi7wNi+LaoRYFhUKHouEayzc45ZXdseobepHQTACGnf97Qi5WNuAVGyDWTpadmIpCzNiA2roy/eq0g7FXnppl0OWidl30v92UTXBS513FfkqEoC9+2k2gLQoRbDOnPazKDZqPyUS61PQrGbIt3/HlPxvzg9NZuXIyxZPxueFFUkD4jSuv2kQ+kAP02SUCIymMJwFoSr9uH/IL7C5vC0ZsK4eulmzgyYHr8kcMhfl6snguoI0lZ5Y7Qwo4nqm5yTwRgQJ8rAeQi0JYBrc2JnovaELD+5+M2GKFtNbMawwc0B6U7b+hkM/qBOEW4L/tNA5653AFSIFQ/U+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fu7h3AoxKxgJ0cYGEogmAe15e6av5Ir3pm4CE9lecZU=;
 b=KBVw9stCTWLA5HbJ4gFsMs0tnVkek4en+U5c2EB9OSUkOOJnSUsu16E7fE4Z12W/Z9FxUgDbIGtc1rVBfOBxHM/J7dIXSAimXKrPXo7oni1Gbz/5HjmDaQ/shw2Sd4/SN6b8OLORDUoS1F8rGM4g5C8bFbmtYezxuM/wap07J7w=
Received: from CO6PR12MB5473.namprd12.prod.outlook.com (2603:10b6:303:13e::8)
 by MN2PR12MB2942.namprd12.prod.outlook.com (2603:10b6:208:108::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Wed, 20 Apr
 2022 11:32:19 +0000
Received: from CO6PR12MB5473.namprd12.prod.outlook.com
 ([fe80::28df:431f:d965:e6ef]) by CO6PR12MB5473.namprd12.prod.outlook.com
 ([fe80::28df:431f:d965:e6ef%7]) with mapi id 15.20.5186.013; Wed, 20 Apr 2022
 11:32:19 +0000
From: "Wang, Yang(Kevin)" <KevinYang.Wang@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/ttm: fix ttm tt init fail when size exceeds kmalloc
 limit
Thread-Topic: [PATCH] drm/ttm: fix ttm tt init fail when size exceeds kmalloc
 limit
Thread-Index: AQHYVJSHP8/0hJsFF022HGuI3b/QKKz4gPOAgAAAasOAAB8mgIAAB9e4
Date: Wed, 20 Apr 2022 11:32:19 +0000
Message-ID: <CO6PR12MB547340CB065269B1731812B182F59@CO6PR12MB5473.namprd12.prod.outlook.com>
References: <20220420085612.1664787-1-KevinYang.Wang@amd.com>
 <00dfec71-cf38-d6d9-8775-0ae88f59224e@amd.com>
 <CO6PR12MB54733101E19842B59668482B82F59@CO6PR12MB5473.namprd12.prod.outlook.com>
 <65ef352b-59c8-e802-5285-afc59e56fa9b@amd.com>
In-Reply-To: <65ef352b-59c8-e802-5285-afc59e56fa9b@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=True;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2022-04-20T11:32:19.821Z;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD
 Official Use
 Only; MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard; 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0d758582-ba7c-4c16-b1da-08da22c16de7
x-ms-traffictypediagnostic: MN2PR12MB2942:EE_
x-microsoft-antispam-prvs: <MN2PR12MB2942FB95B67153BD6D8C1A1082F59@MN2PR12MB2942.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XMKexIZw6ybIkUKjqwezGHZSA1zSr449084SS3YTdv0xcZQFOHSQZs7eR19J5Ifj+1WSgb4D3qWP4xxX+3vH3+a0lI0OvUw+wb238n2Ykmplj+YfjqT2c24BLyqGGZ68iWI1Sxhvz1VsSsJEyIk7VTZvSTqTZLP7DqJtF5+dEW7+C0HZwa3NWAmjVtn2KM7MRLEYW+f9xdeuX87GCuVdgewSDIYHmdTb997WlsBE+kl/20c8erICp6xXk9ulRO8OqYjl6AcBFT0dBMuhvFkPvVZxNDze5WbDZa0UjZzr8Q/fP9+VueRzL5kLPdMLXCmOJyuJzNMGC8qZs+aPGuuXsrm5GB5QP8fGovKC40sYgeV1+nIGYX7z3nOZuCPwWFBmh+TKNJDbaSlVn1zVP5guGfCwY6lL66mTFMZ0aD1X3eypT+kFE1H4u12kdihHfTImOIh6KFwDAXg8wbbMHWQzxquoVade94axyVDVMoYlcgmUYzJ0JWfI8Lqez9QaggvfJef4RZYtQETYd9p20NIwO5wDvn2YCoPx7hCMhtDKt3Ahlk1CljMNgc5tBHpLYSuvllYVb5SC+RTqOUHoL2c2thw05scMWchkHr3cU7InksIykC6FNLGZPMm/T/2tWs6VsO3pALzNSpvxO1Ed0Gykc59bAMNLQvi7y6g59l93IGEaNiOWWqHj4S3w2VBmwtlHa9hnsd15e/K1Iv+iqf6R6Q6GF/xtD13R6ZTtaC5+0m2hYL2OSdPGLR92yEYtKr+k8KKb6dCz3OHvdXDqNLta3/7LuID1olsQ+FiVTIUithk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5473.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(71200400001)(7696005)(9686003)(53546011)(186003)(33656002)(6506007)(508600001)(316002)(110136005)(19627405001)(2906002)(86362001)(26005)(38100700002)(38070700005)(8676002)(450100002)(122000001)(91956017)(166002)(76116006)(64756008)(66446008)(66476007)(66556008)(66946007)(8936002)(5660300002)(52536014)(55016003)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?lJoxwPYnq8sxnIZrZxxiIUngUjvIDRXp4dmlA6f0RwzeJilVzDR8Pgsxuf?=
 =?iso-8859-1?Q?xy8ALNSGLps0F9WKrO00oCej8nVyTB8KfLah8jSCGyEWDmVlqoq3KmWNOH?=
 =?iso-8859-1?Q?EcUlaBtcWn0Ut8QaAzN5Ggol19MRB+LxAmp0kw3pxb6DoKlLgcEgoHPvwm?=
 =?iso-8859-1?Q?NVq2qP7sw/bV6x6WJT9iKhW+mOySaSpq6x93tEMi+jO78WrMW5BU2Xzq24?=
 =?iso-8859-1?Q?VwLPwkLVKuE4DuoTCchAaMyrslO4iAV3kOQF2nBc1XcspC0+DY2s6n7gQ/?=
 =?iso-8859-1?Q?+09Iz710YSF2wAGAbldtcAuqMsgaBR5YBiUu91ehAV0uGiMH1UtfTggcdy?=
 =?iso-8859-1?Q?KRWBjuCyKivXdX3vIEpzNzfXHGh5kOO2UO+iBgCgJls5onC8vOXc6mHCTh?=
 =?iso-8859-1?Q?U176wxvK/SYhnzFeMh4hwPwGOGOxaMYD4HJ10B5uFGhYnOgz5KxLRkB388?=
 =?iso-8859-1?Q?6Ido4rFxEVqzJWXeqCB/5top5LbSAppkk3aqd0XHdvAMFJIAksW4IKHerD?=
 =?iso-8859-1?Q?BaQye79sRnRogceRgqnzNvru3RiNKqI7au5F47HBASPFtbNCy1pIMbHr95?=
 =?iso-8859-1?Q?srsMuDP16kNMxFx+7CBoEe3fMAOwiG5ofNzunNo+Qrxndc0v1OQ+XymwAt?=
 =?iso-8859-1?Q?BypPBx+8nQTWamkB1OVxDL9dXdr683CaIiDQw7kJtqxLIAxA6RCEyhed1r?=
 =?iso-8859-1?Q?bAfrkI8duLaoRvoy+L1efy4ox86rNTQ8PEBx8zpD0H3qAysiQP/c38vEE5?=
 =?iso-8859-1?Q?Mtlz9bRtDtrvkOeEHSTW9c7cXIKrt52lUr+mndEHDZHSg1IxVFffCXJyTf?=
 =?iso-8859-1?Q?Pu/I5r+hEmcldhByhAluGeEwSG4pSpQDvVdzHbBfpPQjHknlWOnYGHCGog?=
 =?iso-8859-1?Q?5kVaHO/jPkpp+csp4Vt4dhTbhqWabkNgBymeo7/fhtkHQkz1Ai/GWJkOl+?=
 =?iso-8859-1?Q?1dCQFGte1HGmVkkIJ5VGlOqBlEPKcJgo/tv1iRfMoRRd2iGVVYjqMw6fmf?=
 =?iso-8859-1?Q?OEBdjMDpCVsbY3W7xkigtkP9phFJ2vvXjMmjeKOrPzff51W/mFo72xqWUU?=
 =?iso-8859-1?Q?BIeI4J5Vx99XR7zRRLaDtuhQ3Yg1qYKnRkB/5eEWH9IAaSMvtqpJn0C077?=
 =?iso-8859-1?Q?TxzXRHnO93n+14RvmGPgf6NO2hcNCNgctMGi4tBhwbSq7mgGoIWNCByXta?=
 =?iso-8859-1?Q?nzPEN8s+lfW/rwXgN9hY3AHvJ0zMiNoGc5twT74c3TD/YzfFdoGgvaNTXd?=
 =?iso-8859-1?Q?LNr7kcJrHioPsLroC6tH3UTJDPhjkKEEqUOHaYI/k708wcRJrc3X6uVf7B?=
 =?iso-8859-1?Q?x9tR6I4UnluyTiRugElNfQ1A8KnChblbygEvDNL2Cdltm4Fx4A/5+j8NbD?=
 =?iso-8859-1?Q?2t3J/kFO+BXnblAJSIXmlNynQh6M8HnCkxBx0IA5Ag5vHh/R+D+WetzlEa?=
 =?iso-8859-1?Q?PldB3QiRTC0SuRZPq5yd+WzH/q5ODP7ov4gdEnB87CfpeBTLjxw91YI9u3?=
 =?iso-8859-1?Q?oNdAYS6COtW69AXq1JM8WrNEeRCPcfANenPTJZP4UFybcgevUzWXmnmsYQ?=
 =?iso-8859-1?Q?56x+GvVhebCf3/Qj+Zmj3Z2X573rkFtX/pp6PWMXQX/f0W8d/HFEb8mufk?=
 =?iso-8859-1?Q?Fgadp15zIr1FZ70+V4+1ehu58W+SRru7h3NOxVBq9VyIsmxHymWVN7spPW?=
 =?iso-8859-1?Q?B4lq+3RO+bjGNYNr9USvqJveegXf5tKYWSr6bOIrzEd58v6utdrY1ykDGU?=
 =?iso-8859-1?Q?OYsmXEDvDfRmuK6qblqA8LV+Cpmn4+kzqzeRgpLcLMxCeR?=
Content-Type: multipart/alternative;
 boundary="_000_CO6PR12MB547340CB065269B1731812B182F59CO6PR12MB5473namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d758582-ba7c-4c16-b1da-08da22c16de7
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2022 11:32:19.4123 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xDpSZR+msauih9mVRW7DeRqSIXiKlxIl4jzcrxoH7eeJkqKL3XlWC0tnuHAoC/E8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2942
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

--_000_CO6PR12MB547340CB065269B1731812B182F59CO6PR12MB5473namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only]

Hi Chris,

you misunderstood background about this case.

although we expect this test case to fail, it should fail at the location w=
here the Bo actual memory is actually allocated. now the code logic will ca=
use the failure to allocate memory to store DMA address.

e.g: the case is failed in 2TB system ram machine, it should be allocated s=
uccessful, but it is failed.

allocate 1TB BO, the ttm should allocate 1TB/4k * 8 buffer to store allocat=
e result (page address), this should not be failed usually.

There is a similar fix in upstream kernel 5.18, before this fix entered the=
 TTM code, this problem existed in TTM.

kernel/git/torvalds/linux.git - Linux kernel source tree<https://git.kernel=
.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=3Dv5.18-rc3&id=
=3Da421ef303008b0ceee2cfc625c3246fa7654b0ca>
mm: allow !GFP_KERNEL allocations for kvmalloc

Best Regards,
Kevin

________________________________
From: Koenig, Christian <Christian.Koenig@amd.com>
Sent: Wednesday, April 20, 2022 6:53 PM
To: Wang, Yang(Kevin) <KevinYang.Wang@amd.com>; dri-devel@lists.freedesktop=
.org <dri-devel@lists.freedesktop.org>; amd-gfx@lists.freedesktop.org <amd-=
gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/ttm: fix ttm tt init fail when size exceeds kmallo=
c limit

Am 20.04.22 um 11:07 schrieb Wang, Yang(Kevin):

[AMD Official Use Only]


________________________________
From: Koenig, Christian <Christian.Koenig@amd.com><mailto:Christian.Koenig@=
amd.com>
Sent: Wednesday, April 20, 2022 5:00 PM
To: Wang, Yang(Kevin) <KevinYang.Wang@amd.com><mailto:KevinYang.Wang@amd.co=
m>; dri-devel@lists.freedesktop.org<mailto:dri-devel@lists.freedesktop.org>=
 <dri-devel@lists.freedesktop.org><mailto:dri-devel@lists.freedesktop.org>;=
 amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org> <amd-g=
fx@lists.freedesktop.org><mailto:amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/ttm: fix ttm tt init fail when size exceeds kmallo=
c limit

Am 20.04.22 um 10:56 schrieb Yang Wang:
> if the __GFP_ZERO is set, the kvmalloc() can't fallback to use vmalloc()

Hui what? Why should kvmalloc() not be able to fallback to vmalloc()
when __GFP_ZERO is set?

And even that is really the case then that sounds like a bug in kvmalloc().

Regards,
Christian.

[kevin]:
it is really test case from libdrm amdgpu test, which try to allocate a big=
 BO which will cause ttm tt init fail.


LOL! Guys, this test case is intended to fail!

The test consists of allocating a buffer so ridiculous large that it should=
 never succeed and be rejected by the kernel driver.

This patch here is a really clear NAK.

Regards,
Christian.

it may be a kvmalloc() bug, and this patch can as a workaround in ttm befor=
e this issue fix.

void *kvmalloc_node(size_t size, gfp_t flags, int node)
{
...
        if ((flags & GFP_KERNEL) !=3D GFP_KERNEL)
                return kmalloc_node(size, flags, node);
...
}

Best Regards,
Kevin

> to allocate memory, when request size is exceeds kmalloc limit, it will
> cause allocate memory fail.
>
> e.g: when ttm want to create a BO with 1TB size, it maybe fail.
>
> Signed-off-by: Yang Wang <KevinYang.Wang@amd.com><mailto:KevinYang.Wang@a=
md.com>
> ---
>   drivers/gpu/drm/ttm/ttm_tt.c | 14 +++++++++++---
>   1 file changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> index 79c870a3bef8..9f2f3e576b8d 100644
> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> @@ -97,9 +97,12 @@ int ttm_tt_create(struct ttm_buffer_object *bo, bool z=
ero_alloc)
>   static int ttm_tt_alloc_page_directory(struct ttm_tt *ttm)
>   {
>        ttm->pages =3D kvmalloc_array(ttm->num_pages, sizeof(void*),
> -                     GFP_KERNEL | __GFP_ZERO);
> +                                 GFP_KERNEL);
>        if (!ttm->pages)
>                return -ENOMEM;
> +
> +     memset(ttm->pages, 0, ttm->num_pages * sizeof(void *));
> +
>        return 0;
>   }
>
> @@ -108,10 +111,12 @@ static int ttm_dma_tt_alloc_page_directory(struct t=
tm_tt *ttm)
>        ttm->pages =3D kvmalloc_array(ttm->num_pages,
>                                    sizeof(*ttm->pages) +
>                                    sizeof(*ttm->dma_address),
> -                                 GFP_KERNEL | __GFP_ZERO);
> +                                 GFP_KERNEL);
>        if (!ttm->pages)
>                return -ENOMEM;
>
> +     memset(ttm->pages, 0, ttm->num_pages * (sizeof(*ttm->pages) + sizeo=
f(*ttm->dma_address)));
> +
>        ttm->dma_address =3D (void *)(ttm->pages + ttm->num_pages);
>        return 0;
>   }
> @@ -120,9 +125,12 @@ static int ttm_sg_tt_alloc_page_directory(struct ttm=
_tt *ttm)
>   {
>        ttm->dma_address =3D kvmalloc_array(ttm->num_pages,
>                                          sizeof(*ttm->dma_address),
> -                                       GFP_KERNEL | __GFP_ZERO);
> +                                       GFP_KERNEL);
>        if (!ttm->dma_address)
>                return -ENOMEM;
> +
> +     memset(ttm->dma_address, 0, ttm->num_pages * sizeof(*ttm->dma_addre=
ss));
> +
>        return 0;
>   }
>



--_000_CO6PR12MB547340CB065269B1731812B182F59CO6PR12MB5473namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<p style=3D"font-family:Arial;font-size:10pt;color:#0000FF;margin:5pt;" ali=
gn=3D"Left">
[AMD Official Use Only]<br>
</p>
<br>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0); background-color: rgba(0, 0, 0, 0);">Hi Chris=
,</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0); background-color: rgba(0, 0, 0, 0);">you misu=
nderstood background about this case.</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0); background-color: rgba(0, 0, 0, 0);"><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0); background-color: rgba(0, 0, 0, 0);">a</span>=
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt; background-color: rgba(0, 0, 0, 0);">lthough
 we expect this test case to fail, it should fail at the location where the=
 Bo actual memory is actually allocated. now the code logic will cause the =
failure to allocate memory to store DMA address.</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt; background-color: rgba(0, 0, 0, 0);"><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt; background-color: rgba(0, 0, 0, 0);"><span st=
yle=3D"background-color:rgb(255, 255, 255);display:inline !important">e.g:&=
nbsp;</span>the case is failed in 2TB system
 ram machine, it should be allocated successful, but it is failed.</span></=
div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;"><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt; background-color: rgba(0, 0, 0, 0);">allocate=
 1TB BO, the ttm should allocate 1TB/4k * 8 buffer to store allocate result=
 (page address), this should not be
 failed usually.</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"color: rgb(0, 0, 0); font-size: 12pt; background-color: rgba=
(0, 0, 0, 0); font-family: Calibri, Arial, Helvetica, sans-serif;"><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"color: rgb(0, 0, 0); font-size: 12pt; background-color: rgba=
(0, 0, 0, 0); font-family: Calibri, Arial, Helvetica, sans-serif;">There is=
 a similar fix in upstream kernel 5.18, b</span><span style=3D"color: rgb(0=
, 0, 0); font-size: 12pt; background-color: rgba(0, 0, 0, 0); font-family: =
Calibri, Arial, Helvetica, sans-serif;">efore
 this fix entered the TTM code, this problem existed in TTM.</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"color: rgb(0, 0, 0); font-size: 12pt; background-color: rgba=
(0, 0, 0, 0); font-family: Calibri, Arial, Helvetica, sans-serif;"><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"color: rgb(0, 0, 0); font-size: 12pt; background-color: rgba=
(0, 0, 0, 0); font-family: Calibri, Arial, Helvetica, sans-serif;"><a href=
=3D"https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/?h=3Dv5.18-rc3&amp;id=3Da421ef303008b0ceee2cfc625c3246fa7654b0ca" id=3D"=
LPlnk660272">kernel/git/torvalds/linux.git
 - Linux kernel source tree</a><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<span class=3D"commit-subject" style=3D"font-size: 12pt; margin: 1.5em 0em =
0.5em; padding: 0em; color: rgb(0, 0, 0); font-family: Calibri, Arial, Helv=
etica, sans-serif; background-color: rgb(255, 255, 255);">mm: allow !GFP_KE=
RNEL allocations for kvmalloc</span><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<div><br>
</div>
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0); background-color: rgba(0, 0, 0, 0);">Best Reg=
ards,</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0); background-color: rgba(0, 0, 0, 0);">Kevin</s=
pan><br>
<div><br>
</div>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Koenig, Christian &lt=
;Christian.Koenig@amd.com&gt;<br>
<b>Sent:</b> Wednesday, April 20, 2022 6:53 PM<br>
<b>To:</b> Wang, Yang(Kevin) &lt;KevinYang.Wang@amd.com&gt;; dri-devel@list=
s.freedesktop.org &lt;dri-devel@lists.freedesktop.org&gt;; amd-gfx@lists.fr=
eedesktop.org &lt;amd-gfx@lists.freedesktop.org&gt;<br>
<b>Subject:</b> Re: [PATCH] drm/ttm: fix ttm tt init fail when size exceeds=
 kmalloc limit</font>
<div>&nbsp;</div>
</div>
<div>Am 20.04.22 um 11:07 schrieb Wang, Yang(Kevin):<br>
<blockquote type=3D"cite">
<p align=3D"Left" style=3D"margin-top: 0px; margin-bottom: 0px;font-family:=
Arial; font-size:10pt; color:#0000FF; margin:5pt">
[AMD Official Use Only]<br>
</p>
<br>
<div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Koenig, Christian
<a href=3D"mailto:Christian.Koenig@amd.com" data-auth=3D"NotApplicable" cla=
ss=3D"x_moz-txt-link-rfc2396E">
&lt;Christian.Koenig@amd.com&gt;</a><br>
<b>Sent:</b> Wednesday, April 20, 2022 5:00 PM<br>
<b>To:</b> Wang, Yang(Kevin) <a href=3D"mailto:KevinYang.Wang@amd.com" data=
-auth=3D"NotApplicable" class=3D"x_moz-txt-link-rfc2396E">
&lt;KevinYang.Wang@amd.com&gt;</a>; <a href=3D"mailto:dri-devel@lists.freed=
esktop.org" data-auth=3D"NotApplicable" class=3D"x_moz-txt-link-abbreviated=
">
dri-devel@lists.freedesktop.org</a> <a href=3D"mailto:dri-devel@lists.freed=
esktop.org" data-auth=3D"NotApplicable" class=3D"x_moz-txt-link-rfc2396E">
&lt;dri-devel@lists.freedesktop.org&gt;</a>; <a href=3D"mailto:amd-gfx@list=
s.freedesktop.org" data-auth=3D"NotApplicable" class=3D"x_moz-txt-link-abbr=
eviated">
amd-gfx@lists.freedesktop.org</a> <a href=3D"mailto:amd-gfx@lists.freedeskt=
op.org" data-auth=3D"NotApplicable" class=3D"x_moz-txt-link-rfc2396E">
&lt;amd-gfx@lists.freedesktop.org&gt;</a><br>
<b>Subject:</b> Re: [PATCH] drm/ttm: fix ttm tt init fail when size exceeds=
 kmalloc limit</font>
<div>&nbsp;</div>
</div>
<div class=3D"x_BodyFragment"><font size=3D"2"><span style=3D"font-size:11p=
t">
<div class=3D"x_PlainText x_elementToProof">Am 20.04.22 um 10:56 schrieb Ya=
ng Wang:<br>
&gt; if the __GFP_ZERO is set, the kvmalloc() can't fallback to use vmalloc=
()<br>
<br>
Hui what? Why should kvmalloc() not be able to fallback to vmalloc() <br>
when __GFP_ZERO is set?<br>
<br>
And even that is really the case then that sounds like a bug in kvmalloc().=
</div>
<div class=3D"x_PlainText x_elementToProof"><br>
Regards,<br>
Christian.</div>
<div class=3D"x_PlainText x_elementToProof"><br>
<div class=3D"x_PlainText" style=3D"margin:0px; background-color:rgb(255,25=
5,255)">[kevin]:</div>
</div>
<div class=3D"x_PlainText x_elementToProof"><span class=3D"x_PlainText" sty=
le=3D"margin:0px; background-color:rgb(255,255,255)">it is really test case=
 from libdrm amdgpu test, which try to allocate a big BO which will cause t=
tm tt init fail.</span><br>
</div>
</span></font></div>
</div>
</blockquote>
<br>
<br>
LOL! Guys, this test case is intended to fail!<br>
<b><br>
</b>The test consists of allocating a buffer so ridiculous large that it sh=
ould never succeed and be rejected by the kernel driver.<br>
<br>
This patch here is a really clear NAK.<br>
<br>
Regards,<br>
Christian.<br>
<br>
<blockquote type=3D"cite">
<div>
<div class=3D"x_BodyFragment"><font size=3D"2"><span style=3D"font-size:11p=
t">
<div class=3D"x_PlainText x_elementToProof"></div>
<div class=3D"x_PlainText x_elementToProof"><span class=3D"x_PlainText" sty=
le=3D"margin:0px; background-color:rgb(255,255,255)">it may be a kvmalloc()=
 bug, and this patch can as a workaround in<span style=3D"background-color:=
rgb(255,255,255); display:inline!important">&nbsp;ttm</span>&nbsp;before
 this issue fix.</span></div>
<div class=3D"x_PlainText x_elementToProof"><span class=3D"x_PlainText" sty=
le=3D"margin:0px; background-color:rgb(255,255,255)"><br>
</span></div>
<div class=3D"x_PlainText x_elementToProof"><span class=3D"x_PlainText" sty=
le=3D"margin:0px; background-color:rgb(255,255,255)">void *kvmalloc_node(si=
ze_t size, gfp_t flags, int node)&nbsp;<br>
</span></div>
<div class=3D"x_PlainText x_elementToProof"><span class=3D"x_PlainText" sty=
le=3D"margin:0px; background-color:rgb(255,255,255)">{</span></div>
<div class=3D"x_PlainText x_elementToProof"><span class=3D"x_PlainText" sty=
le=3D"margin:0px; background-color:rgb(255,255,255)">...</span></div>
<div class=3D"x_PlainText x_elementToProof"><span class=3D"x_PlainText" sty=
le=3D"margin:0px; background-color:rgb(255,255,255)">&nbsp; &nbsp; &nbsp; &=
nbsp; if ((flags &amp; GFP_KERNEL) !=3D GFP_KERNEL)<br>
</span></div>
<div class=3D"x_PlainText x_elementToProof"><span class=3D"x_PlainText" sty=
le=3D"margin:0px; background-color:rgb(255,255,255)">&nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return kmalloc_node(size, flags, node);<b=
r>
</span></div>
<div class=3D"x_PlainText x_elementToProof"><span class=3D"x_PlainText" sty=
le=3D"margin:0px; background-color:rgb(255,255,255)">...</span></div>
<div class=3D"x_PlainText x_elementToProof"><span class=3D"x_PlainText" sty=
le=3D"margin:0px; background-color:rgb(255,255,255)">}</span></div>
<div class=3D"x_PlainText x_elementToProof"><br>
</div>
<div class=3D"x_PlainText x_elementToProof">Best Regards,</div>
<div class=3D"x_PlainText x_elementToProof">Kevin<br>
<br>
&gt; to allocate memory, when request size is exceeds kmalloc limit, it wil=
l<br>
&gt; cause allocate memory fail.<br>
&gt;<br>
&gt; e.g: when ttm want to create a BO with 1TB size, it maybe fail.<br>
&gt;<br>
&gt; Signed-off-by: Yang Wang <a href=3D"mailto:KevinYang.Wang@amd.com" dat=
a-auth=3D"NotApplicable" class=3D"x_moz-txt-link-rfc2396E">
&lt;KevinYang.Wang@amd.com&gt;</a><br>
&gt; ---<br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/ttm/ttm_tt.c | 14 +++++++++++---<br>
&gt;&nbsp;&nbsp; 1 file changed, 11 insertions(+), 3 deletions(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt=
.c<br>
&gt; index 79c870a3bef8..9f2f3e576b8d 100644<br>
&gt; --- a/drivers/gpu/drm/ttm/ttm_tt.c<br>
&gt; +++ b/drivers/gpu/drm/ttm/ttm_tt.c<br>
&gt; @@ -97,9 +97,12 @@ int ttm_tt_create(struct ttm_buffer_object *bo, boo=
l zero_alloc)<br>
&gt;&nbsp;&nbsp; static int ttm_tt_alloc_page_directory(struct ttm_tt *ttm)=
<br>
&gt;&nbsp;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ttm-&gt;pages =3D kvmalloc_a=
rray(ttm-&gt;num_pages, sizeof(void*),<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GFP_KERNEL | __GFP_ZERO=
);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GFP_KERNEL);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!ttm-&gt;pages)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; return -ENOMEM;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; memset(ttm-&gt;pages, 0, ttm-&gt;num_pages *=
 sizeof(void *));<br>
&gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp; <br>
&gt; @@ -108,10 +111,12 @@ static int ttm_dma_tt_alloc_page_directory(struc=
t ttm_tt *ttm)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ttm-&gt;pages =3D kvmalloc_a=
rray(ttm-&gt;num_pages,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sizeof(*tt=
m-&gt;pages) +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sizeof(*tt=
m-&gt;dma_address),<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GFP_KERNEL | __GFP_ZERO);<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GFP_KERNEL);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!ttm-&gt;pages)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; return -ENOMEM;<br>
&gt;&nbsp;&nbsp; <br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; memset(ttm-&gt;pages, 0, ttm-&gt;num_pages *=
 (sizeof(*ttm-&gt;pages) + sizeof(*ttm-&gt;dma_address)));<br>
&gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ttm-&gt;dma_address =3D (voi=
d *)(ttm-&gt;pages + ttm-&gt;num_pages);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt;&nbsp;&nbsp; }<br>
&gt; @@ -120,9 +125,12 @@ static int ttm_sg_tt_alloc_page_directory(struct =
ttm_tt *ttm)<br>
&gt;&nbsp;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ttm-&gt;dma_address =3D kvma=
lloc_array(ttm-&gt;num_pages,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; sizeof(*ttm-&gt;dma_address),<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; GFP_KERNEL | __GFP_ZERO);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; GFP_KERNEL);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!ttm-&gt;dma_address)<br=
>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; return -ENOMEM;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; memset(ttm-&gt;dma_address, 0, ttm-&gt;num_p=
ages * sizeof(*ttm-&gt;dma_address));<br>
&gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp; <br>
<br>
</div>
</span></font></div>
</div>
</blockquote>
<br>
</div>
</div>
</body>
</html>

--_000_CO6PR12MB547340CB065269B1731812B182F59CO6PR12MB5473namp_--
