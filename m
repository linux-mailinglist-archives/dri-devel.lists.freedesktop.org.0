Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86520CD1593
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 19:24:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 163F210F06A;
	Fri, 19 Dec 2025 18:24:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E2DyBf4I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 779E010F06A;
 Fri, 19 Dec 2025 18:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766168679; x=1797704679;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7ODthoatcML6DJTXzaE35QGvbd0NMckGWZBlXRzX3EU=;
 b=E2DyBf4IsG4HSMn7kzYLUbQYuXGa4emfLC3VZw7zRQDsy8mhjoMMvjoe
 oaU/CxZzOwFCNZX3pVxuBryD5GL/oeC+nR2W2t6Pp02DpFVqB/wQ/RVOi
 /HfLU4yi6qxaTlHl4DWyqVorcJCcEtnqqOiqzl5nS1AE3uNit/WsEYgaa
 XEJZo/wGDi3WuwnrM+66z/HCbyvWgI+S0phL5f8ViYDrf7R6ndEyMGHIA
 FyK3dF3RcUDQ0t+sBPi+9fNckUmT0qn9hSWhw2VLWUEhuvIJcRDgOCG9+
 h0q588474WteRRpwvO8jVblOIsx3whKRzWp8uKB11BvzF57O7M++5EFC+ w==;
X-CSE-ConnectionGUID: KjXckgK7STKCk3qehkWxeQ==
X-CSE-MsgGUID: 8P7kQI7RQ+Kq9E7XnABy+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="71992330"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="71992330"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 10:24:39 -0800
X-CSE-ConnectionGUID: bkFwwa3kRYKwe/WDWIUM0g==
X-CSE-MsgGUID: V0Hcl3NvQRe2Z52g7bP1VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="199406692"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 10:24:39 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 10:24:38 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 19 Dec 2025 10:24:38 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.63) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 10:24:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YQX8aKLjro5lmNWoEgvWbsq7cxCNTKS52oTnBjaxau9rMReU1uyr1BISdiUwVvWs4ZrZzHHpxGT8AxSC0Xqe/nVHfW3IN+SU5p7nJp9RRkCx1oOJ3ScG3I9N239eNCQqIH7R2pnZpS15x6/uINQIKQqBAydadZVXdZ54U54SnJ6ZghaWHe28ddTTFKNr0uwhYUQ94cqs3hMVkGgFDekgbCS1wKtkaCFLljxlZqhKN92XMq3bqLAmftfKEz1XbVycjjV2r/sSzEvVomJTKHKYwicjTjsnQmAP5BSSLI58ODSHd51wilnrKl2MI8azgWuJDqibwbBVo6lkY5D/M5QV/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ye3xYJg/xKiOdOxb4RivVtDmwiaUSvS0wMqlauPDkpY=;
 b=O5+YILHQ2/lYVXn2QYizyhfVz9+LmvpEO+poBqFukhICS29/xjOHx517pAH3oEt5txsvPDZ1sYngCYPR2lYZB9O8gOu/TbaiOBrpvWCskB7YEW3Ln4CtLH7mfTMLCo391IKdHMTEfgBsDQrtvSYjrPgAY4s5hNem9MdTv61MpOX7xlJQDalMLeEYO1kbnlTR1Ic9RiDQnl3jBzRwJWqdI0LPDoM3n9PF8Fy8qEZF0tUOfZ5IQLtwdbChIZ4mZPHYbZWcbOwte3XYQPxzoo8utY3xMknZjQDRCWZxRQYaiSxLk28CX8HeToE5s1XNP2LRmLfc9hXuTIGPIPooaigqEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by IA3PR11MB8985.namprd11.prod.outlook.com (2603:10b6:208:575::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 18:24:21 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9434.009; Fri, 19 Dec 2025
 18:24:21 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Yao, Jia" <jia.yao@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "Yao, Jia" <jia.yao@intel.com>, "Wang, X" <x.wang@intel.com>
Subject: RE: [PATCH] drm/buddy: Free free_trees array in drm_buddy_fini()
Thread-Topic: [PATCH] drm/buddy: Free free_trees array in drm_buddy_fini()
Thread-Index: AQHccRKa0Z5kq/LvLkiz7nXhAcQclrUpRGiA
Date: Fri, 19 Dec 2025 18:24:20 +0000
Message-ID: <DM4PR11MB54568A775C5B1EF6EF76B1E4EAA9A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20251219180804.162756-1-jia.yao@intel.com>
In-Reply-To: <20251219180804.162756-1-jia.yao@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|IA3PR11MB8985:EE_
x-ms-office365-filtering-correlation-id: 70f3b069-d1ed-4990-ca60-08de3f2bd446
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?9jFMyHwviuSDClXNbtYFIznV/qtG6fwH51h+4UzA5MegZyMqguOUaalq/YPl?=
 =?us-ascii?Q?hFr1tEfGQTa/n0BEW4CkLY1Ytorpk5Mg0HKh3pAQ/fZX5bCmuoXb4Yu7kY66?=
 =?us-ascii?Q?pgCP2XHWLmlj5Q/evFAaeojRpjqDjjTN/9Mo1n+a/e+CZ04evFlXt0sDu4z9?=
 =?us-ascii?Q?ZR8wvbNLpTmrWJJ3MOgfCtNokrJOapKCA7L5X7+ZgAjyDkHrmNYbJ04TKrR6?=
 =?us-ascii?Q?MFMB+cyLpv+/5lnClT7P+zha4fMJaLH/NHaREgMnHHspmk2Zh1gMj+MBuWQl?=
 =?us-ascii?Q?PR6cYB1ClU2A7g/9Lb48dgLUv02FcnaEMHksyIeiDCl9aq1mUsNuxoB7pSTr?=
 =?us-ascii?Q?E6+1ix/sVrOpfCQB0osvxcIkO3p0MybwCbeIy1n8dSa2jg2JsQE5Twp2mAYB?=
 =?us-ascii?Q?4kK49RuZOGpFAGe6JKXdOwSxHoMMG6usR9y2bw5z6JlQz6gomN4VK4rj35nQ?=
 =?us-ascii?Q?5MElvYKPPHKSxZK5dYjgYRxantKpova/A1FAzLN8LNHQBaf030XG2z4dpisE?=
 =?us-ascii?Q?cqOlKh/tUSJboJm5Aywl9rHc0rMr1erxRwvd1kfSytWXbP9+nOUTT67k5KmD?=
 =?us-ascii?Q?ZwFnTzv5y6BVKD+BgT1iimLc/ooeqrHaaWZchtA7rdFGKOm3yFDtu9mnPocy?=
 =?us-ascii?Q?PgOdEdyU/X7QLdXBMQLZY1ItvIW+ARdQg68+TCT+NK7vVjgjdpUxr/NW+dnD?=
 =?us-ascii?Q?UNYZHvXl53WGeEJKHwi6H4iTmlRGIgQvt0PC1LBc2bnzrlk3wCummhRJGl7l?=
 =?us-ascii?Q?mEfrCn5V0WvxhZcH6ixmOX2OjRYQTKyNGtuNTDEtiDtW2KTXgUHz/WwEdyjq?=
 =?us-ascii?Q?VLis2T4039HDthP2xltqf09S4OPdQPY+0Nk8lTA9DHnu2C2BCY04l0IsjrZo?=
 =?us-ascii?Q?Ht59ZeqY5m59v/7R0zg3wcMehKQzhYmjyll84tz7ErxKN4YP8FgXprnuBH8z?=
 =?us-ascii?Q?oKrPk0eN8COoN6dqpzTKoN3M5HqJknoTlFQnbNxyS/uoiqdgWcyN7HqFu1WG?=
 =?us-ascii?Q?jk9zpkNjfQP+28xVJwaOilsP+Lwbt1INVTbcPNq828KH851/wyqEpX8F+jNW?=
 =?us-ascii?Q?hZiatMwS5vJdg2YKzPEb1V7kaJWxNniFzvAnBJVMPEF9EMk5XnZ6LrI1mlE7?=
 =?us-ascii?Q?cFdz0rEAZSyoRSIB5nOYUm/e4VzJZhscXTR5wO4tmMfZJX7ZCwP7JJhvfep9?=
 =?us-ascii?Q?V1CSBR5jxDnk6qoWlMI4jDryFaxQjOJEmByTaW9s0ZZwe7SRyx2mRT6sWTo4?=
 =?us-ascii?Q?DjX+zSxbSrsn6j89ly6WlRhIP4zR7iYpAMTufZx9wL/6Vt7aHywtO0LdvJhs?=
 =?us-ascii?Q?LVQNiUBNp9OUilg9W0WLxyA6RCGULhI4MBFy1CPKaaLGs6fXuqRVGeDg4f21?=
 =?us-ascii?Q?66mvVNIpSiRcyN6GcVIE4VqpTYHhXvcG3hJI9Q2a3ihf5dLp9SlX4eHtgom/?=
 =?us-ascii?Q?Q+QmN8KE7A82PgxhVrU9Y4c5Lssu4lcUHtt97HFLO3tGl9Ibh+r27eJVwPR+?=
 =?us-ascii?Q?n5ZoPEaGabwkRccENZgOg/AYGE1LrBLgdEVC?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ucMcnm7FhqhoLPmHkitmc0QUDEJIxgUT7Z/cCtrchFUquSrQWhtics/cxdbe?=
 =?us-ascii?Q?qCYl2DYhXRyiYUtX+3z8OXdEWr632yky8swFMMN3Yt1qi5WDv4YMnpVhe5Ye?=
 =?us-ascii?Q?hSwGH/EW+A5aJ1veZXeHPmgITS29Uuvg1GoPncqTekl3zACCAVFB6FS0zS3w?=
 =?us-ascii?Q?5BjqkN375YDA4oCR9b6U9M+fTI2A7mipBNFoFaINRcQ1OSc9dZg+0TgAExi4?=
 =?us-ascii?Q?sbdD1QrwlE0Oyq5yK31dIsEKGxAm51QfkL9aZci4YTanoHqdsvmN51lLc6ih?=
 =?us-ascii?Q?dseTUb66SPPu+dpYDlEoPpyCIOayl8jzoQj5qdhriidNhN0x27sckCp+kXux?=
 =?us-ascii?Q?tcYhQmcMUewkzEpD4f8wCw0ltJ6p5cOiGB9vyVBpvJ3NG6VawArTJ+e0cFuG?=
 =?us-ascii?Q?aTHcj9uCzUVbLXFIyFMaH+UOhKbdS8rp0avcQ4CxdX+fnM58uX6H2MuJ0kj2?=
 =?us-ascii?Q?AxKKnHxoUTygSmsSu9vjlDhu4bmgW5jNjdF+povuj1Rg5Tr2yLm3HoT23Eed?=
 =?us-ascii?Q?JCKTeIDx4yWmasJYQl4sN+6CUXHOAh5PW/zbXbvu84r5KvdDf3wF1DuQ03Jr?=
 =?us-ascii?Q?VJR9MqBamkcm0wa/RZ5JlJXsIloGwsKY2LOU6UEZL54uvQs3qhf1fodbAjY6?=
 =?us-ascii?Q?NAFDlCzSwZBpQhHDNdp+aCAF/NLcf4CqF6lxHjpU5kqHC9nbZzcjg1N/PvOI?=
 =?us-ascii?Q?9Z7bssQlZAC1rrE48w6yExZPUls1ncbJBjIhXTVCtW2Gwtr1D9n2njVoxXpE?=
 =?us-ascii?Q?JHs1uwYCudql1yhus85nzO85MO078mKd4GsRdN1oQUQUF9Q2Ceessx1O9Dw6?=
 =?us-ascii?Q?wL9JjkWCU0C7SEtf3De5Rje4xGwcb9ZZQGTtP7W/Yi8gC++Tya07rqZSua54?=
 =?us-ascii?Q?4r4y62ypX88dFoS544V+FueTNi6Hy1JJPcjb+DpWJPqkHtWfohuY6pDZUqDR?=
 =?us-ascii?Q?BtuZEzybgeoNP+vAbSMnIck009ZInPDtPXs3VgaWH/Z+2cDE3lieJ4K5z23M?=
 =?us-ascii?Q?BfT6jNwbVrUizt6kOIjd+T8wg9Dqz3FGHPklnyTu9H11+xpTDuDH0THlKiZ6?=
 =?us-ascii?Q?Winf7yOLJ/l8chKPKClwcxseIuw5yL9A8u8i9DGXWHlHduQGkTK2kHTtDFEC?=
 =?us-ascii?Q?AP0DLO3wUO00QDJlSU0FmPJRtFZ6evK3BAYShlZNgDYF8NZDqNqlZywKVRti?=
 =?us-ascii?Q?3eESw8cuFRbKI8cOFfhsNlxryepQtmwPdsNAvDDdLbHk6h43NkygpTwPY1ZQ?=
 =?us-ascii?Q?R5/U3Mp3EfLMF9PPHHiu6jv3AQ8JM+Mp0HItJkO6sg0NWHXKrWPvVUTEcyVY?=
 =?us-ascii?Q?pR3dxDLQ0ukG+2PU1nQCwRZQXXZ1wzx9tng/1WGmDQi7CPP0aJvimB4IHq4M?=
 =?us-ascii?Q?b2LUHKJW/tGmKZJkXINpy3MmKtKWl9frUTBTXbReegRr/Kk6EU65/NK9DvzM?=
 =?us-ascii?Q?LQMVUMMw+nSM8izbf1KdPnk58O6byD+exx4qMHG1XoOW8MV1Lp6UPgyvKDyf?=
 =?us-ascii?Q?DlMOYC1lTRMkR+B88SH1woviTNARtt86Eo1ACKlC2e0GV9DG1T1LAMQZe6QO?=
 =?us-ascii?Q?EKSGTSzi5s/1Ay/8byKKxLGg6FZ1hgs57UqTscJfEBqF4mVjSwDHWUqSECI5?=
 =?us-ascii?Q?fbZfL3mslIPAuJlxQDPg8Zrrf/zdoqOWV5r12PhaCWj70PPoTQUPw84Y1U+Y?=
 =?us-ascii?Q?+sDjztzXmMkUgcXU+cnMHJUbXaOe5zBdfrmITL4LJwqAcfopP1w0uPKnwdBp?=
 =?us-ascii?Q?grZQnrZlRA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70f3b069-d1ed-4990-ca60-08de3f2bd446
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2025 18:24:21.0288 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aOmx9g1yw2+t020iJuAq+4cj0ws1L8vvr1jibnadDLLPkJckcjAxfNDkXwGN2lFv5NMw7Z3Zfd6T/7OeMlqFwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8985
X-OriginatorOrg: intel.com
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

On Fri, Dec 19, 2025 10:08 AM Jia Yao wrote:
> drm_buddy_fini() currently frees each element of mm->free_trees but does =
not
> release the free_trees array itself, causing a memory leak.

Could you please attach the leak stack in the commit message also?
And maybe a "Fixes" tag?
Thanks.

>=20
> Signed-off-by: Jia Yao <jia.yao@intel.com>
> Cc: Xin Wang <x.wang@intel.com>
> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/drm_buddy.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c in=
dex
> 2f279b46bd2c..8308116058cc 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -420,6 +420,7 @@ void drm_buddy_fini(struct drm_buddy *mm)
>=20
>  	for_each_free_tree(i)
>  		kfree(mm->free_trees[i]);
> +	kfree(mm->free_trees);

LGTM. The same logic as the failure path of drm_buddy_init().

With commit message fix:
Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>

Shuicheng

>  	kfree(mm->roots);
>  }
>  EXPORT_SYMBOL(drm_buddy_fini);
> --
> 2.34.1

