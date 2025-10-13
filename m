Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67AEEBD1621
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 06:36:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BA2210E05D;
	Mon, 13 Oct 2025 04:36:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="y+QbhPqb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012045.outbound.protection.outlook.com
 [40.107.200.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C87AA10E05D;
 Mon, 13 Oct 2025 04:36:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b3jaxsV5mJfJqhh4lt6eo5Eu13G9P+MBT7JH5nSBdI6wBA6a7jU2xhg++Svye8XBE1nIptv0qMafFQrlNztU+JybTyv4IdM+BJA8lmzx43hX+yhkj2SaxFK2cG+iBmBuN/ONBQ4APjTeMXu4dMlZ3eB0f45a8KofmOSF7X7wwTOxykn4xWAtqVN615P7WTIocgw6lm9U2FpStVwDqrVAKC3DUL6ZtMS9AG5Uevg2/gnc8uVOP/nJrTh5LEG4PRR6mqGXce9/hZSN/exoUVyYuKBmYuDJASbSfW85CUb9HgzMfrNvqbNsLvkMzv4DIbzMqbZo+/b83a2jBxeNOwyHSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mwsUFZPqJ5c/ou1xPW4aghFMRqIFWZReEHp1/0rHywU=;
 b=ZqLO5lRnrJxdm1eG6VfVdbmvhQ5Do9AlhbaykKGCRwYor1JGRNfLRFfS795BrxeeCccCkCyTjXRtk50alfPear3k5QNA9Syx0+W7eaQ7MRP9R21mcE1rpl9v4Xzk/TpY4n5E3zOKLYDD7hTtRZZbF7+yH7q1ZOyUwMgOnvMgIr74gecXnLksoYw33QbXYt2E0Rgzazmr3j80IFq8K5HknIBXJVQWxXi9i1An1FeX6ze9anWeE57pen7ZLj1VfjVDDJvMuCUoQb/DjQfz53PEPTvCtYbQL3HvlMKT/nqsNJxbMDakczJx7rJotJ7BpqGCzZ8Abl9oacqgZiBKmizYeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mwsUFZPqJ5c/ou1xPW4aghFMRqIFWZReEHp1/0rHywU=;
 b=y+QbhPqbc246Cn9i9v1ETa+t8hx9j5imwVcedNxxgJ2DZzmminXBJczsxKFDNKgqQLsByKUB+wWAQZCynUGh8OEjL2hIq0Az2td1dMiTI5bCdiXahgvp9Ziyj5l9ev3jf2TAa5ylUS0/GYCioroN8XylGWZK2MztzulBasUDOVg=
Received: from DS0PR12MB7804.namprd12.prod.outlook.com (2603:10b6:8:142::5) by
 IA0PR12MB8325.namprd12.prod.outlook.com (2603:10b6:208:407::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 04:36:49 +0000
Received: from DS0PR12MB7804.namprd12.prod.outlook.com
 ([fe80::e71b:4ec9:237f:24ea]) by DS0PR12MB7804.namprd12.prod.outlook.com
 ([fe80::e71b:4ec9:237f:24ea%5]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 04:36:48 +0000
From: "Lazar, Lijo" <Lijo.Lazar@amd.com>
To: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>, "Yang, 
 Philip" <Philip.Yang@amd.com>, "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
Subject: RE: [PATCH] drm/ttm: Add NULL check in ttm_resource_manager_usage
Thread-Topic: [PATCH] drm/ttm: Add NULL check in ttm_resource_manager_usage
Thread-Index: AQHcO+SLFAIsRElsD0GxxdHIaHUhKLS/fagw
Date: Mon, 13 Oct 2025 04:36:48 +0000
Message-ID: <DS0PR12MB780437771222808EBEB675D797EAA@DS0PR12MB7804.namprd12.prod.outlook.com>
References: <20251013015550.1317222-1-Jesse.Zhang@amd.com>
In-Reply-To: <20251013015550.1317222-1-Jesse.Zhang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-10-13T04:34:54.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR12MB7804:EE_|IA0PR12MB8325:EE_
x-ms-office365-filtering-correlation-id: 93c9307c-9694-4650-0aae-08de0a121f31
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?/i9zIpf/dpZSze9g3h6/+wtga6yUop+QPFbBBdxYl7EikfBVGGVS/8Ob0K8V?=
 =?us-ascii?Q?/SZMzRTG4Xwfsbz/m35pXBpqrx25f3/mNBK2H4rIT+2VKjyrSV+80Hve9say?=
 =?us-ascii?Q?xJAxXa4pPzYJjRDDt7UUE0VFprH8GkX4LWbY/0a3WpDG1q6OkWZixB2pXP5d?=
 =?us-ascii?Q?V8gihb7cKZ07XDBfBtWNfmuAQ0VzBUEOb4OIzw1I5pjqkfhK37zRpAnhNyTK?=
 =?us-ascii?Q?myS0VFrxt31rMYuOj3fW6Nr9RxgsdfxLQL3Xy4ROg0R1pGUNoLcQU/GgidMT?=
 =?us-ascii?Q?pJw8zNeAhF6HMLrE7DmC4fQqTjkIMe4EJyM31S6w16p+N0FDOdthSpdI0PQ4?=
 =?us-ascii?Q?ks5R8Y1svmPAGwcfFgePSHtA6seJHLNvQCz22sBRlzPqnxV3qxLMQXPnGtTP?=
 =?us-ascii?Q?YPXnuxwnyzXF+hhKulqL178yzdXX+zcUsHiFeO+xEVSY5iheISzP05ADnwq5?=
 =?us-ascii?Q?gQA4MeCHjuh3cSZeZTfmRxgFwZZtl7bvP1HSko+jMgOCVf0Of/5IeQjgJ0t7?=
 =?us-ascii?Q?EVcKFCXPszxO6KTK8sxy5HD6/YRJK1wxwRnZMX7mYWXSzQxrE8ZkB/zWd756?=
 =?us-ascii?Q?jtNus6vCX9HsqhvPOiWqz8ioQXZwA13WUmtAzzqaaF56YZHZOsyJbinbYRcA?=
 =?us-ascii?Q?vXv13xznjcQ/CUi67xMQLQZ0jMLy/B9S/W+Lcv78srTo8e3LENUlVUz8IqkU?=
 =?us-ascii?Q?5o8BcGziggP4NwbuznXtWqVgGZ/RUWA1kEKivWPNeBVn4VP4CQ1YjpVpH9OI?=
 =?us-ascii?Q?iE7iQ6EQW1u8/b1uTdTvM9HRUk6SHAdcD3qJ6rk9njYUNrh85jYm99SY7ZJw?=
 =?us-ascii?Q?/c4f6HJHtjVD1zFdTtEMgUb9mTUBpSAxYBfsSZ0c4I3r2NU4ocduymYedFX7?=
 =?us-ascii?Q?8A495azbIZr0p470ZgqaimEl+VDanXLQPsac/rYMXv86HvnsVVbcz2juNphq?=
 =?us-ascii?Q?XSFb/JzHEJubjE73Ns/ZnEQfgB7S9+9poIrRPbgkREv5GNwnkdPBfNWrPDJd?=
 =?us-ascii?Q?AFABnFDeNPt+VnPqKaR9Xf0oY26ykqiPLFYH176Fc3JWfldYOAVJwsJNjp1M?=
 =?us-ascii?Q?rZzNf9Pd/lQ+4UfIoCR9zsuVsNKBbBEpkiMDuLCsT5TOkvtPiJzwDR1B1GVy?=
 =?us-ascii?Q?D0+jJs5M4rTrD8/GvRwX3C+sLkwQ/hpGWgTlTlHD6e0RmLrAW1WIFqoW7I+U?=
 =?us-ascii?Q?j2TWuPPi16LL1fxpDDgzumt4YOV+FB3SGXOOy6RwgR9M4Dw0rOq7QK/b0doQ?=
 =?us-ascii?Q?TrKcxMYjncYDxeDngCnkt/xZyy+gWQouTcfTEf2+QmaojHNPS0UFt+ifUeq1?=
 =?us-ascii?Q?q54LSsKx7y/sSIUZl+mLiqyku/EFrj94BXNNaTI3hCkMhgc5eAVeulxxGFO0?=
 =?us-ascii?Q?DivPEokJvNtMRYFyly5UgLfaxD9gXI/m/zFga9/pT1Zwm/T/p19zPY8LqT+U?=
 =?us-ascii?Q?kaC+Ej7v+b7gJmniYUZ2ZiNUweBY1KSTXGRjQNisTv0SeL1IcGwWHENl2IkL?=
 =?us-ascii?Q?dReoUPO13KLQ5pbbnrK05iFyEV5ltapipuXL?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7804.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3/uCqzve8RRF3xxl/wD7W53Fsa/f1BlTZs5SryQg/UdaGBqG4ptCiRHQxCYU?=
 =?us-ascii?Q?Qu0OcNoM6Cea1exXVB+BpO9IQTCi/3riLu5DwMjXLM/hV31K5dzgWfFaLPJS?=
 =?us-ascii?Q?JGnTR5mLh+POO7LEi3GZS6hoIKBQ9kM6DtLAb1qTLbxu90STM0DMvOuES14j?=
 =?us-ascii?Q?JhzL7mXcWHG+sOQpngcku6vTprAeaO3HBwUFgYiO7qgDyfaPcyuB/I1E+neV?=
 =?us-ascii?Q?F6/91+zKxaSTFwcJe1aMWtlgUSSOoLCzxEV6ku7NgE8g6gAGk3K6ul1Z4ECw?=
 =?us-ascii?Q?p6/wQIM3jjd3iHYn1doNKGxnhEBZ6dmEimYs49gkGWTypU1sDC+09q2Zdz3p?=
 =?us-ascii?Q?tRqXbLsY+YuXqvHlA3T9ZrI54MtGDFDxY+XYioT1GuCrYzr+a8ndPWOpSgqd?=
 =?us-ascii?Q?Z/qL9Q9LrBe9D+726RdXiBXbxhcD9Pxg9oyh3eapzXUL8r8DUMaDVcUGqWFL?=
 =?us-ascii?Q?EY9yQ4bfUNqeGNkzYvA8KPs36TOW6ZyVCv79YAPc0p+xnCxe0hOu2jxNI0Az?=
 =?us-ascii?Q?0QN4Ta9ZLHdm1L1W3TfWmZyKQCFeFwzhrsRSZsHb/NjXJ7nBBNrj+cM0PpH9?=
 =?us-ascii?Q?N05XLRhuuzyuKeTWPtosc0UDf/7heaM9euICCnJLZWH90iDNS9G6o/9nVdsW?=
 =?us-ascii?Q?/6KI240KBfFEDJYY9JcvcdJ5SGmZj8wBviRkEgyAZbW8myO9GwJoi4OjixEM?=
 =?us-ascii?Q?VnXok07GaIWNV53GCIGeHQq7S68E87IMFXjiu4dVR3ukrHXrjjau5OBuA042?=
 =?us-ascii?Q?gzwvbn0q/7qhD5BDfOgKf4awvkLaej9ancjlGxO2PIB4qaT241DNQO6lQvCL?=
 =?us-ascii?Q?qOvxILl8YkVXMvZoxsoVzCOmw1XtzIWaLqEBoqRw/AdpvURd20ODDsPefNMT?=
 =?us-ascii?Q?86f1Im9RvhhnImXWSVKPq9kxFC6vQqg/RSFYhcHT1yqPNZmA/uOSlWZPpEqI?=
 =?us-ascii?Q?pS4bXhqzOMmNCtc4v1YnGwvrj2rHbLxqWhn8s/ZOFk2rL1jGvG3SztpNZuAQ?=
 =?us-ascii?Q?rG712HsVBJGZl28wZCyJXKRl1O1dT97KZ6kZttfRAEKog032Tot7TYHpQ+sQ?=
 =?us-ascii?Q?v4l5QtoQEsL49FSwV0ObppjE/scctHB6P0jmZdLB0PpYOzFeNgxGzMndPMzS?=
 =?us-ascii?Q?i/kqHMxhclOUqSwCe8PixkD4bG+ajIG+UiB80cL2gbQkpmZSE6Id+sRASLW4?=
 =?us-ascii?Q?eeMLmmR0bRIzhqzoQjf+yoSckxkQoQjj3cK5J33aDX0P5xPD8rtgtfK82LCQ?=
 =?us-ascii?Q?Pl7HjTPE15g/M0L9dT+93/tGdfpY3C+Gto6NSm8yCc899EpU5zG/KoHDN6Go?=
 =?us-ascii?Q?rR28QJlIVojEyBYxHxnRIztCoQ1zIrvCrjUtrFNlMG1vnmeLYKkYu2Qkpw4h?=
 =?us-ascii?Q?ExvdUoDFE4ah9fcOw/g3fYlRxxDeWrQtR4ijxWr3n2Sk1taTw1IHArSpSRlM?=
 =?us-ascii?Q?Cw6XmDQp3jeaengVM4QRZnEm5nqLe2qemAXhXMJVSzrNqNe/5nRMxvEqKzpB?=
 =?us-ascii?Q?/VXmVxTaJ7VXd9VSnLPNDqBfWKJeriqnx2FrTQ28FgPVjxpjL/IwtRxBsBba?=
 =?us-ascii?Q?YK4NiRzaK5MEx4na+s8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7804.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93c9307c-9694-4650-0aae-08de0a121f31
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2025 04:36:48.1859 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Nw1s9475WWmSUfGlcEKAQOfZ3+Zq3u9vsWgmsEQDxKq3Rm1Czi9YNEus+KFT+iPJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8325
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

The specific issue of trace with amdgpu_mem_info_vram_used_show should be f=
ixed with this one - "drm/amdgpu: hide VRAM sysfs attributes on GPUs withou=
t VRAM"

Thanks,
Lijo
>-----Original Message-----
>From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of
>Jesse.Zhang
>Sent: Monday, October 13, 2025 7:25 AM
>To: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
>Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian
><Christian.Koenig@amd.com>; Zhang, Jesse(Jie) <Jesse.Zhang@amd.com>;
>Yang, Philip <Philip.Yang@amd.com>; Zhang, Jesse(Jie)
><Jesse.Zhang@amd.com>
>Subject: [PATCH] drm/ttm: Add NULL check in ttm_resource_manager_usage
>
>Add a NULL pointer check in ttm_resource_manager_usage() to prevent kernel
>NULL pointer dereferences when the function is called with an uninitialize=
d
>resource manager.
>
>This fixes a kernel OOPS observed on APU devices where the VRAM resource
>manager is not fully initialized, but various sysfs and debug interfaces s=
till
>attempt to query VRAM usage statistics.
>
>The crash backtrace showed:
>    BUG: kernel NULL pointer dereference, address: 00000000000008f8
>    Call Trace:
>     amdttm_resource_manager_usage+0x1f/0x40 [amdttm]
>     amdgpu_mem_info_vram_used_show+0x1e/0x40 [amdgpu]
>     dev_attr_show+0x1d/0x40
>     kernfs_seq_show+0x27/0x30
>
>By returning 0 for NULL managers, we allow callers to safely query usage
>information even when the underlying resource manager is not available, wh=
ich
>is the expected behavior for devices without dedicated VRAM like APUs.
>
>Suggested-by: Philip Yang <Philip.Yang@amd.com>
>Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
>---
> drivers/gpu/drm/ttm/ttm_resource.c | 3 +++
> 1 file changed, 3 insertions(+)
>
>diff --git a/drivers/gpu/drm/ttm/ttm_resource.c
>b/drivers/gpu/drm/ttm/ttm_resource.c
>index e2c82ad07eb4..e4d45f75e40a 100644
>--- a/drivers/gpu/drm/ttm/ttm_resource.c
>+++ b/drivers/gpu/drm/ttm/ttm_resource.c
>@@ -587,6 +587,9 @@ uint64_t ttm_resource_manager_usage(struct
>ttm_resource_manager *man)  {
>       uint64_t usage;
>
>+      if (!man)
>+              return 0;
>+
>       spin_lock(&man->bdev->lru_lock);
>       usage =3D man->usage;
>       spin_unlock(&man->bdev->lru_lock);
>--
>2.49.0

