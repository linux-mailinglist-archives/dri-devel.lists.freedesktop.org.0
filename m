Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F41EA963B7
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 11:12:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3D0010E1ED;
	Tue, 22 Apr 2025 09:12:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KGLvupC+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2079.outbound.protection.outlook.com [40.107.212.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD8E910E1ED;
 Tue, 22 Apr 2025 09:12:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=osqx38F4DCtBj+IAkloYePCXkn7BZRvs0l4PMAJ6HpLio1oaE/LoaOjYVOTSPnQtWwQArKtTy9EpBmPig/Eee389xKG6pNJoe7zBahysTkAlP+AC8CIHP70E4sD5Y2pe+izgbyZdxE5Nf5PrtwcUHFBz8xuL5QxZyM+lXDVoLZ6bHIVxvpVN3J3UvBBl/UFmgo9FgzjeW03ax1pYxBOVjoB2FLqpFEQtv66axtcyoD/SLIFiD+ZUa/OXW6YlMSt6RUYRCInF1tz1x5vz2bFwbC06IcOo7dwe58aOX4cYNDaPZzkBahW7OHnW2LqXdRXTB+lla9xyF6WBbusyCYYJig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2S55NNficpjntQzktwxVJuT+hHzSuvdFbTblclRC0Bo=;
 b=rlk+S0ikVb6I8f7/HItWK/oUw3q+brKc/fMyO2fC67JHZMvLbVcDyB25YeVEKtVwFZqcR5pEm3vrB5mDshhGleAdnoJRLxKdM9kwxhi9zp3ukj2e6Xou3D2A+5nrOZ5kY5w9rtC2g371/P94lVbOJVgk/iVS7+jtStC+tjWTv1FlyNPqeN2kUFudJbwQWZei4PePyRicemd8ev+cADSpfCfn4O/5m3ouholSYJmG41GHzr+6xt8kSGCrQsPQCBe2m0CIg1nzzSe0tfnxqhdPliPn/Ta9uIR5no1oGM2G7hECzOkwllMfPc56HgHFztW8LgslsEE683QUp2yuocSSHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2S55NNficpjntQzktwxVJuT+hHzSuvdFbTblclRC0Bo=;
 b=KGLvupC+grh1cdWYqZ6PLQTvrLQI9xWTHg3leTS2T1lLNHwawliuv0i7ye3LWXMY5vLFue2eQJAQYuRuUw0sm+eL6fQevAshda/E2O+cjMHY8l7bXK6cRdU046RaMki+/+c31UV5wH9oQuBVe/zltB1bulmXkDbMdVppUf3SPgc=
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS7PR12MB5864.namprd12.prod.outlook.com (2603:10b6:8:7b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.36; Tue, 22 Apr
 2025 09:12:25 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%6]) with mapi id 15.20.8655.025; Tue, 22 Apr 2025
 09:12:24 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Denis Arefev <arefev@swemel.ru>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>
CC: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Andrey
 Grodzovsky <andrey.grodzovsky@amd.com>, Chunming Zhou <david1.zhou@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "lvc-project@linuxtesting.org" <lvc-project@linuxtesting.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: AW: [PATCH v2] drm/amdgpu: check a user-provided number of BOs in list
Thread-Topic: [PATCH v2] drm/amdgpu: check a user-provided number of BOs in
 list
Thread-Index: AQHbsDxNKPvfxs51gU+r8uYxJ9vWc7OvbLgo
Date: Tue, 22 Apr 2025 09:12:24 +0000
Message-ID: <PH7PR12MB56852EECD78C11BD15157AF383BB2@PH7PR12MB5685.namprd12.prod.outlook.com>
References: <20250418083129.9739-1-arefev@swemel.ru>
In-Reply-To: <20250418083129.9739-1-arefev@swemel.ru>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-04-22T09:12:24.464Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard; 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB5685:EE_|DS7PR12MB5864:EE_
x-ms-office365-filtering-correlation-id: 28b0ee06-81fe-44df-f2e4-08dd817dcbe9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?Windows-1252?Q?Gjlfr+K+eQFN5CYgou1B7RT2sqjjJXo5IlDETzyNhF05Bwwpx5WKNbeQ?=
 =?Windows-1252?Q?leoyk4A6vaS6J1yjymw6TnKDcg0HkAPLUo35r+AfKggVw7bvjR+kz6PU?=
 =?Windows-1252?Q?rkCmVCSOsdvs5uK0LebSVOdqTLKrDpEW0M900NEJurwBr4aXvyxx5Y4l?=
 =?Windows-1252?Q?8Wn3sRPz4Yojv2yor8aFBILLDSgkqCU0DIJQQqvGSipIExloyZjW54PW?=
 =?Windows-1252?Q?Wdhbupl00GqAWSjzcNDKYJVp5BVcHoyxvOKvDyXVAd67hEqjoVnyah5u?=
 =?Windows-1252?Q?P3sn9mcCzdhRJOj+hvm4cwtIrvDJ/0hCcmYYJVWyr2R6TgvDVH4LbmAv?=
 =?Windows-1252?Q?tMuXveLE+zGlLEoYVzwXxuQsMCCg+DhZioFdr7INPhieDMUfzpIPgYPf?=
 =?Windows-1252?Q?qOiuCH/XsHwbGFReG5pUuW/D5jcMncLOppB6U4pWiVME0SUBI8QvNYF3?=
 =?Windows-1252?Q?qh3xOTvdKSiUp8ptqtcOzzLjcwYoeDnIAkBMBXGkNLz2JL/yS724vX0h?=
 =?Windows-1252?Q?NAO1HH4UFLiCD+GSp5+dnSgBQikLYwW9qcdS5ot4wr7cqqSXvVLa6/fz?=
 =?Windows-1252?Q?PuDGs9BJLXrqhUYwq8aBJhDQFjyN7un578ymGpv1xQ7S5TlIOa5EyVyw?=
 =?Windows-1252?Q?8malmRlI/LMJdQFnvOtYaS9ghrJ7LRfHcDZ1j3YfbjocHoB88SMa6vP/?=
 =?Windows-1252?Q?IARTPaopBXjnnpwYEQaPPi0jtJSmhVoTg8OD1MjnSHL6Sx//LDMy8sPn?=
 =?Windows-1252?Q?uUlElzLYq3KtYAmTajep7DuM+kH6SkT6FakXL3JzaGFqu7U5IzOOXhur?=
 =?Windows-1252?Q?evS9bM41DRAGTBD7lqiVQRLV2ZKiddkzlPesVC9y6Xl9yxbBFK9DDbhm?=
 =?Windows-1252?Q?A4qK3hRIxhNQ5PFMlhHmdWoxlaSiikhlfVBzCGnE7KPgADJCvMk6Sd0B?=
 =?Windows-1252?Q?YIj4hHHGxix13Capj8mdMx/f4+J07VrjRx5Vr7Oa8F+4ZNZSLmFkuSbj?=
 =?Windows-1252?Q?+MCbQbotkH++vc0sGY3fFiOjk5ANV/gpmb7vorDzTNf0KeHwtA8H+fX2?=
 =?Windows-1252?Q?c/XTNOqRKvgQFJaW5rqy2WGmV6KZiyUZw/r+zvJdthMRYginoJGs79Tr?=
 =?Windows-1252?Q?7dd9imrouPhCIGBdwZL7Gvxp17pKquL2MgF1me9TTopyOn4wa+YS1dRw?=
 =?Windows-1252?Q?EluOkke80KGxw8URiQ/77gFAeZvyMFuJG0MaLnBkDT8ZTVqLhCL2HplR?=
 =?Windows-1252?Q?j0ZyIrqlxjq9h3YU0M+Rcg4kV976c/Hd5oCEBndHPxsxMwno7vQeCYhh?=
 =?Windows-1252?Q?I+YN0gPVeSwpOTg0zuZDNsrHdT6U91lS0L0Izj+9i+qlKGsZpQe0zXH3?=
 =?Windows-1252?Q?79p1wsMeiS/v3HeDe5tY3LStLRAOeyS3MxiLys1DMpNdb0hmaQRuHuys?=
 =?Windows-1252?Q?H0IoRiqeRetWmlIoA/Dcw5TVDdYGGz7OH3obCJDVTBxIg/WamtRghlVs?=
 =?Windows-1252?Q?Q42dsCGTxclSYjGsjw0RtNASSkbcD5/mGnrlPukSXw7V/PDaGkmC1QeV?=
 =?Windows-1252?Q?oEUjUCe2c65ZT1xGo3MIJMO/xF1h6ghLMit3RQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?alXhHlw3VTdQyCniZQZGbus1ob0Qk1yEYZ8vgD019wPHOpb3Rt1Z3yo2?=
 =?Windows-1252?Q?IhyVFHOvZRx8JATk786W5IgBbKFvegvMYvpJ2x4QquUIgjPntqnMLLuR?=
 =?Windows-1252?Q?2dDrtvMfY1dqiDV4793A903urYc7dk1jNI6SSuUc12OQaXKdfr4qFsou?=
 =?Windows-1252?Q?tkKVY0ckOzs40/K8XQ8Z9DoU5cuZ1VL97xpeuAJVfKzpBzd2jN4/dztz?=
 =?Windows-1252?Q?cDw7Khj6AEndDL8zrzBelgY/y2dtYi5ekfLJrk/QxbR9PXhDw95GNibi?=
 =?Windows-1252?Q?bzUkz4RyIXzKZvCeQkeH2UiOIDLB62+fPRpUax+11aZcyjDMqMNSpMEs?=
 =?Windows-1252?Q?JH9HjhsO7gU56ptcn2Coy5mxo2H7JVIytzGEkQu340NsIPQHnn0sx0KB?=
 =?Windows-1252?Q?NmICYNcMUNtbe5XBi5I4/Y2PNm/3jbLr5Vlv+XfxX7d0k+FlIcsY04Uv?=
 =?Windows-1252?Q?ACX7lk3iBN8CbgymwZfF91cxZMY9//g93CAzZnLpzUw7xlF45z8hkE78?=
 =?Windows-1252?Q?fBgGFLN1xHQb77ZXucpkW6SZ6QhGGiy52jsk0qqPV3FUxgu963AUEGgm?=
 =?Windows-1252?Q?Bra+9IkotENFbDEvqsC4R/acPIiYI1OWBvETH07Buf1J0LV42s0RJQte?=
 =?Windows-1252?Q?fbVzgF7WtzszZaE0/3l2gzpqtSCWbyCo0FsWaqtH5MMzgcu85sxpvI53?=
 =?Windows-1252?Q?7aKmwHWWvfZwe5N9z6YIKyUIHClY8BmZAFLMya+twRv8NdctBm0HlTTt?=
 =?Windows-1252?Q?FMyqG1csBjij5jQ/9rMYGoSOe7DwX5xIpeCgkfad9A8+GXTbMfll5ZNw?=
 =?Windows-1252?Q?MAs4helZkU6Puz/EJmt9jbWLqxxdn3/WDf8zsv0ADS3wuYXp7lZFtJEh?=
 =?Windows-1252?Q?qUP/vp5Rs7ZSLSSxvChaLJ6SxjWx7rIoy9Phfwv+AYgYjvVfTXVgFvU+?=
 =?Windows-1252?Q?2C/rlS9cl9x1aka6sZ17eG4PmmxwAzJVwtde1i3yu9zc3zp9q+JcXKOX?=
 =?Windows-1252?Q?7JltZpKzZWxXkdbk+ln0FC0M5gwjkHoVdRPSycmSs5VWb6rOR1f0yX4+?=
 =?Windows-1252?Q?7NToHvGfym+MwbZOYMXOpvuvsHK+F66/4ms6EGE5nezsK7IbONr4M44D?=
 =?Windows-1252?Q?BcSQHGAqDPf06uzDLqTHZwDGE4gQY1WSHM+3iPVgrMUrWryPkapioTCm?=
 =?Windows-1252?Q?5HQ7vx2HpTZ7bEdX/TXt4vOinYcntnkOS9YErWorr+7JMboBBbfFj25P?=
 =?Windows-1252?Q?SDbMZqH3C1bSRowJxnDqn2LlFhXYVL++DxiAO3xpjTK9N/G0J3NqsJKU?=
 =?Windows-1252?Q?fVxrbnW/61fMYEM32Cqv3+Mf3OOqOYEGypeTaQJb8FW/RVz0qbN3MPvz?=
 =?Windows-1252?Q?Z3lW8r3DGdZ6OLff+JZagvcH7vgPkAcJ7SJu9Afa6UmdvxUFhvl3zFe5?=
 =?Windows-1252?Q?gQL8mM4OrSqwU6vsvekE1xVyXFTLeC7DAx67tEUW9iAblM0GMbS4jfD7?=
 =?Windows-1252?Q?L9VYFqLJcZSmThn2sqtIpYpR8zC/Nazr256XaAJnf9SLJbmztYk22FCr?=
 =?Windows-1252?Q?r8cDunZji39CrsvhMUHTjAbUqxBIBYwfyYi75OSVbX2XDcTCxtp7ucHt?=
 =?Windows-1252?Q?cNol4EOdEOesdyoLhcRtJGfZa8NaVCrAj0eREzjIhu0Bbf29MG4mWt3G?=
 =?Windows-1252?Q?QbuFg/PcQVM=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28b0ee06-81fe-44df-f2e4-08dd817dcbe9
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2025 09:12:24.8176 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8fmH2RGHyRoBjg1JKxWwWXqje+3hh71ID2W5KTFEH4BNTNj9Bp07PcNPKIcVvf4R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5864
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

[AMD Official Use Only - AMD Internal Distribution Only]

Reviewed-by: Christian K=F6nig <christian.koenig@amd.com>

________________________________________
Von: Denis Arefev <arefev@swemel.ru>
Gesendet: Freitag, 18. April 2025 10:31
An: Deucher, Alexander
Cc: Koenig, Christian; David Airlie; Simona Vetter; Andrey Grodzovsky; Chun=
ming Zhou; amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; =
linux-kernel@vger.kernel.org; lvc-project@linuxtesting.org; stable@vger.ker=
nel.org
Betreff: [PATCH v2] drm/amdgpu: check a user-provided number of BOs in list

The user can set any value to the variable =91bo_number=92, via the ioctl
command DRM_IOCTL_AMDGPU_BO_LIST. This will affect the arithmetic
expression =91in->bo_number * in->bo_info_size=92, which is prone to
overflow. Add a valid value check.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 964d0fbf6301 ("drm/amdgpu: Allow to create BO lists in CS ioctl v3")
Cc: stable@vger.kernel.org
Signed-off-by: Denis Arefev <arefev@swemel.ru>
---
V1 -> V2:
Set a reasonable limit 'USHRT_MAX' for 'bo_number' it as Christian K=F6nig =
<christian.koenig@amd.com> suggested

 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_bo_list.c
index 702f6610d024..85f7ee1e085d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
@@ -189,6 +189,9 @@ int amdgpu_bo_create_list_entry_array(struct drm_amdgpu=
_bo_list_in *in,
        struct drm_amdgpu_bo_list_entry *info;
        int r;

+       if (!in->bo_number || in->bo_number > USHRT_MAX)
+               return -EINVAL;
+
        info =3D kvmalloc_array(in->bo_number, info_size, GFP_KERNEL);
        if (!info)
                return -ENOMEM;
--
2.43.0

