Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF5D37FC28
	for <lists+dri-devel@lfdr.de>; Thu, 13 May 2021 19:12:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54D476ED80;
	Thu, 13 May 2021 17:12:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDA6A6ED80
 for <dri-devel@lists.freedesktop.org>; Thu, 13 May 2021 17:12:18 +0000 (UTC)
IronPort-SDR: HB3RY/yu9SXUwvxNFUxykdOjnmlmCnszUbGUnthlMANq+9zdWP5z1Kg0aLyzGbIE0Tk0CBlosL
 pXunhPDx3FfA==
X-IronPort-AV: E=McAfee;i="6200,9189,9983"; a="263925546"
X-IronPort-AV: E=Sophos;i="5.82,296,1613462400"; d="scan'208";a="263925546"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2021 10:12:15 -0700
IronPort-SDR: 7/klbYEBKoTnAhAwD962k5mdRQgZy8wWnOGflNiVwk6iq0X/1JXZO4jFE4gem+J0RHQaqCZWMM
 XH53hWefIjng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,296,1613462400"; d="scan'208";a="463355005"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by FMSMGA003.fm.intel.com with ESMTP; 13 May 2021 10:12:15 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 13 May 2021 10:12:14 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 13 May 2021 10:12:14 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Thu, 13 May 2021 10:12:14 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Thu, 13 May 2021 10:12:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kt2ud9PYAclrohQWCfrjt+teRrYkxlYv7+xcPxjZseJtHWFa0L7WJopYiDCI4UjM+fvNWiymmL3UNQmTDnBTfT5z0bnYNCji4un6xOg9PpoC0s4wqwKS7dIaJSwM1O9EMPAKCiTTq5uAVNzR81toPIcmyov1+LTGNq2CMsSWDdHJrTn16Qtd3SE/JH8F0ZcIsom1gjEljmjUhx4o8elrAZbObi5dt/tKKKhwsQN4U8EVp1oaZqQVvEyh3IdrJ8wcR2UJQb5oAccvtnVwZugg9ag7hlmDzIo6BnfZJ/aeAXMhp0oz1wvuX9WqS4Y+Sk/79oxf4FLSg9dws2lL61QffQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M65PijsiXLDuEQ2+zo0kA0IOQQYoeKPMTpCM1dXj+CA=;
 b=JXd++Y0v668bN9BSBGX/+QVoqGIuAQqDJHhWuQswejOpq9uxl+ouq8rPi+34WZ5fWgyoHSv9YDdJhoG2XiebS+QKvKLT47gRjLsSJclbkwiH+eqPa/pHmWz2FnhQmYP2fhKcbZnxSM/0cEbvzNA07goO9ic+dkN9AGKuGa5gBUCLFygwaZ8Le6h2yICTBIefGJ1Z4ks33T+SJXZYtPfLQlz6X8CJGempER+U/PIWSZfNKcCSZnUk7MRtA80AHRTcTyP3LpGWhmLJjYdWSiMyeDDfm6+AUBPUG36zv/+uOYPkkrmRJ3kGRPJWmJQVSgCaNx192rNSqEOwz/OiMnB8UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M65PijsiXLDuEQ2+zo0kA0IOQQYoeKPMTpCM1dXj+CA=;
 b=NuXsUhVmys3nvYWvdZMY/yQ4n7GO/EpXUyde2LIG+gTWrWt+NnbtoaU7/BQdvDEJrmdRf8l+ItzQcbxR9KNqyc0BfMQmmufgEjTi/HAwWzItsKVsrm7DdQFS0QdmIiJUojf2HsbG9pHIVUpICJiVWc61NFGbWQEXhuNMly25dNw=
Received: from BY5PR11MB4182.namprd11.prod.outlook.com (2603:10b6:a03:183::10)
 by SJ0PR11MB4800.namprd11.prod.outlook.com (2603:10b6:a03:2af::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Thu, 13 May
 2021 17:12:13 +0000
Received: from BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::f071:7bd8:d502:a6eb]) by BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::f071:7bd8:d502:a6eb%3]) with mapi id 15.20.4129.028; Thu, 13 May 2021
 17:12:13 +0000
From: "Chrisanthus, Anitha" <anitha.chrisanthus@intel.com>
To: Zhen Lei <thunder.leizhen@huawei.com>, "Dea, Edmund J"
 <edmund.j.dea@intel.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>, dri-devel
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 1/1] drm/kmb: Fix error return code in kmb_hw_init()
Thread-Topic: [PATCH 1/1] drm/kmb: Fix error return code in kmb_hw_init()
Thread-Index: AQHXR/583sIOTx+AkkmX8c9ZBbLQKKrhpgLQ
Date: Thu, 13 May 2021 17:12:13 +0000
Message-ID: <BY5PR11MB4182F6C7F095EF9DF0E97FBC8C519@BY5PR11MB4182.namprd11.prod.outlook.com>
References: <20210513134639.6541-1-thunder.leizhen@huawei.com>
In-Reply-To: <20210513134639.6541-1-thunder.leizhen@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [73.41.68.160]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 638a8350-2382-41fb-2a53-08d916324098
x-ms-traffictypediagnostic: SJ0PR11MB4800:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR11MB480043F5C4AB89D4C86C462A8C519@SJ0PR11MB4800.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1KxRidLLoqX/rhxDdbBnwlJlOkRdc7Xdx4pR+3tRYpQNR6xkp8ApPaaD9Fq5YAqh1R4IIzhnqZMTyx1F2h2iJvQ1aiYZRmjVF8sCh8WOFB25cvQ8tBEo+Jr6H+GZx3MGAqj/IxjPjHG+g6rFd3JlK6gT3owdYl0M2zBGa5yJeV96LHhPUa/Gb2F4gs3u2TyMgsL1YSw4SU7Cv8NSiefzsGiUmYO90kcglci4YxAybdbEXpRRie23TkS7nNXQo1mdVmbpwRevi+3bx2EtTwuocCQB28vnTVM6tAfv6lYky+sPAsjmr6mU1Jq7/MLMPk58jdOGyKEj6QHEV34ymr7c1HfxxqIJw0CbzhyGXMt+jNz1PDBjqW8LTYQvvPfM3I+MRVaVgK3ghzrwZ3TWuxLqMOIf8PPfqiUIL5X1iQ58Ep4BLGJTy1/2KeMTgVXrXNt9nXwgYSHQVNjyd5j6liDC4rA1xu9XoYto62h8op73E5YVBQqrGbnN2kHCUSD9L8NMJAqBFOBspDc1M+nGqK1+vsvHwff7TczC0Xp5Ua33wvW4E7H7Qk8coaPVlX9CZHuQSITAXlMNHQ4nVaYcm560PYtMtmR2o4/dWlES9WFRj50=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(396003)(39860400002)(346002)(366004)(376002)(6506007)(26005)(478600001)(5660300002)(186003)(316002)(7696005)(66556008)(33656002)(66476007)(66446008)(64756008)(9686003)(38100700002)(110136005)(8936002)(52536014)(83380400001)(76116006)(2906002)(66946007)(55016002)(8676002)(122000001)(53546011)(71200400001)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?ImFkkvFGFergmDRGvwuuSXpjqcbPhlB7gVby+zT1olcWbBzu7VIYYkMcm2cx?=
 =?us-ascii?Q?K+w3dDA2Guch0YGVtJHE055T0xOfEeDOsyf6I5q2HZzIh4vHJIoOCQ/HN1e5?=
 =?us-ascii?Q?PC+JFQK+c1ZrU49zSaEFUEDGhgB5uUkBsj8OOs+4iqyqVckbHWoLgOkLoCLr?=
 =?us-ascii?Q?UOt7DYUFDiWkpBB2T0CJl8pB3ziIaXYtSb0nQyTEkCljXWY50F5DTIiZHjyQ?=
 =?us-ascii?Q?ntCFgyxWKtcwVBaPwtceAiVKVcS7+G2bNagBfbDjuyPx7bBxjgfS66c4DeWa?=
 =?us-ascii?Q?t8GfJlOoO6i0/heOnyS5hXCCBHw11Mv7jRuaYpazLZC5KYzbfzxogyFKjBmI?=
 =?us-ascii?Q?oPEdqB0bW5oGFbryAtPWReLK0G8+7khoNKTM3tpjZqqmYG2JDBRU6vDIFg1l?=
 =?us-ascii?Q?dM6Q2Lf4GOwAHTvxTf56ib4PYQZpmIAu4eKkO8gizXQeLPRfxQqpAX/HA8Gw?=
 =?us-ascii?Q?gB3xMiVHMG3vP4Xvyw7LItiQEXoZ9F6Uk+aqw1bDlg3TolmbuUK8TJJbWzQ8?=
 =?us-ascii?Q?Jr7d/F44bM44/HE81AfuT1SEfcCjkifu8OmSTYxTjW+OD5liGZE3U5WR4R5N?=
 =?us-ascii?Q?DXajOR+c9nfXDAAADEF8qpASr6qUup7WW07E6zQaewIXOC5ZD+7zXtszgtwN?=
 =?us-ascii?Q?6B+qPZ9TtqT//pKw0/9S5CTyjcXwo0VBzSIWy6qBJ6bAxWMliLTwQOHykLPK?=
 =?us-ascii?Q?FOka7iX+cjkjxDwIMmb+UDt9GhU4jwc0QGafRgzk/Qk5bP9YuOo3Lt2WNM8n?=
 =?us-ascii?Q?387FeoiVKKYCCAsGRjGC2S7js2V9Nyl+/21vWk108rhC3cvtWDiVWe0cW5+E?=
 =?us-ascii?Q?F6KV6wXLtjeaIOOhf9gR/++Zo2Ws6hjcjHwq4wJFVu9b96ZBYthwgR1PdRoy?=
 =?us-ascii?Q?dSF1+BTiM6GD+Q1TeH30AYEsroYP7imPLSz832UZT6L6Mq8sOvud7dkgshD2?=
 =?us-ascii?Q?kOBfIACROY5hyzOVrOCxQvxqrpkOyvq2R3fD2hMZil8DfpmLl5IMMFyuNpJ6?=
 =?us-ascii?Q?J/xifxxhcg2D9KpY2VZwxsotZd01qzoyxrI9M/qYzRBl5XLbLaV8ro2ZtLxH?=
 =?us-ascii?Q?BWQPYKnlqmEZJQnc0kBP1nXinzUuWn2TtvMVjGDUR4bmzKgiQSZ8vxcR+biK?=
 =?us-ascii?Q?nCsd7UhYBYq/YZ6CpAOzRG1zneA8De/Rblzr/aiR83ji1NBfCBUCJ41gOTy9?=
 =?us-ascii?Q?37lFq0ZPimtRly75xL3P9vafYxFvXUVB1ZxYgy9ZazKPjp91HGG1u04FoKFm?=
 =?us-ascii?Q?DaELubs0NPYAWQCpuNjzMDyiE5FVQPaiudL7le7sXQ9xdEgS+VIFT6dmaIuZ?=
 =?us-ascii?Q?8os=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 638a8350-2382-41fb-2a53-08d916324098
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2021 17:12:13.2798 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c+IDLFV75dxW0NTHJYUtQrzDJMVIHlFfPz6ARxiXN7WA771NiGdCUXGJLxtQb9W5Tf2q9I8x45A9S73NOrKTD9hsOIvBKGETh7TJ7EW1ty8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4800
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

Thanks for the patch.

Reviewed-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>

> -----Original Message-----
> From: Zhen Lei <thunder.leizhen@huawei.com>
> Sent: Thursday, May 13, 2021 6:47 AM
> To: Chrisanthus, Anitha <anitha.chrisanthus@intel.com>; Dea, Edmund J
> <edmund.j.dea@intel.com>; David Airlie <airlied@linux.ie>; Daniel Vetter
> <daniel@ffwll.ch>; Sam Ravnborg <sam@ravnborg.org>; dri-devel <dri-
> devel@lists.freedesktop.org>
> Cc: Zhen Lei <thunder.leizhen@huawei.com>
> Subject: [PATCH 1/1] drm/kmb: Fix error return code in kmb_hw_init()
>=20
> When call platform_get_irq() to obtain the IRQ of the lcd fails, the
> returned error code should be propagated. However, we currently do not
> explicitly assign this error code to 'ret'. As a result, 0 was incorrectl=
y
> returned.
>=20
> Fixes: 7f7b96a8a0a1 ("drm/kmb: Add support for KeemBay Display")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---
>  drivers/gpu/drm/kmb/kmb_drv.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/kmb/kmb_drv.c
> b/drivers/gpu/drm/kmb/kmb_drv.c
> index f64e06e1067dd8d..96ea1a2c11dd6a3 100644
> --- a/drivers/gpu/drm/kmb/kmb_drv.c
> +++ b/drivers/gpu/drm/kmb/kmb_drv.c
> @@ -137,6 +137,7 @@ static int kmb_hw_init(struct drm_device *drm,
> unsigned long flags)
>  	/* Allocate LCD interrupt resources */
>  	irq_lcd =3D platform_get_irq(pdev, 0);
>  	if (irq_lcd < 0) {
> +		ret =3D irq_lcd;
>  		drm_err(&kmb->drm, "irq_lcd not found");
>  		goto setup_fail;
>  	}
> --
> 2.26.0.106.g9fadedd
>=20

