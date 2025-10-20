Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1646BBEF736
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 08:20:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2819510E25F;
	Mon, 20 Oct 2025 06:20:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JNJz2gp9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55BB510E25E
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 06:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760941219; x=1792477219;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xXVngA2RlIlONLpRpjS51KfGOCa5krlCgPeSs+yX6Ac=;
 b=JNJz2gp9sqv+QtTUPyyLva78WWcHjBGGQtHTi6iESu98lIqrGBOczmfH
 Ez70f4XziAa903yC+UYPzHpulrk5q/HiaHY3yGUxQkjBHXXMTCOi7qBRz
 7P3deyCfECsHo9tQCDeVhPslJNmXFLQ0T/5G6RjHj8U7xR96RK3GxmA98
 grWx83w9IxaVH9LRApw3SKCt2MvDbmzHHJSSVHQNk6yMSN250aC5BhRpa
 t08dRauqUYhw6BK33fQAsTsNGOKoFD6GJNsaOwlgPnlS1yenUs/EH5AbI
 tgmbfSvJ7DRu6caEr798lPmUD7NU4pCIgqYMX5DpD1kwcqh7iFkCt8Lbk A==;
X-CSE-ConnectionGUID: K9bJwZKvT8yg4fyAUZiU8Q==
X-CSE-MsgGUID: PbCLznjoRkeWg5XPeJ2QBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11587"; a="66693712"
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="66693712"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2025 23:20:19 -0700
X-CSE-ConnectionGUID: 7WHmcbDPQT6thKuF9Em8jA==
X-CSE-MsgGUID: dCEylYjdTI+T+vNGgyaGvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="187516674"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2025 23:20:19 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 19 Oct 2025 23:20:18 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sun, 19 Oct 2025 23:20:18 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.9) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 19 Oct 2025 23:20:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rpR/0c3IQUPtLx20Jb1C1Xw9sct4MTEDxSKHAwsZkjWllFUhavSKS8xM/P6NWosHwoNvyWAlf3XBtw8eiq+shsmMHugouusI7ftxQtZRqlVBr7v5m2Lg/Nl4r4CkUbmVXBIiZ8kdeLZ2cTHd/k1ieGf06/MgwjCMP5YoVH0NDbvg0+hgNGt4laMG9EewAwDTc2rG4Ed/NcYQzr96IbA6W4Q02QdDrp+M05oGUcDLcHdXngDP107SiT2q1+SgJGawmNuCDLyFOCEPS9NTBayIz7VXIGe+8uSo3wrkOyatLD625nGqlsHNUX/Rv2gUaNmonfR7/ABkCMU2HTf/3Z2Ibg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4uQ2d599MqqsCbTRPEReFM3V88yqp7F/WlalAnDDeYM=;
 b=bReNsgcWY3O0VrxtyQkOxC8vKGvY87LsJwRE0WvwQSik+1XGvI9f30OAzOJe7f8et73AOBJ0V8mYsxTfpJm1kZimwFVg9XVcfpIIAa/VaBRXZiKumW6c4R5vj/3x5PIuKFIoQl2kKSRiYM2qZugHMd0MTe8zrFgk5ajWMpk9YF8LOWqWqUWV2bv4+X7RlVxV/Gld0vax+Css5IEi2EyPGuDFPmkVlaJyyLmZbpSfQxUntuVwH8B+cT8RV82yXPwHiHc2JgIShCRq8qmWtph5t9UfZzNgTucWl7NfjIkj0OV6nkogJJM5CCw848Bpe97A3EFvpongQhdm3SekwrEGUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by SJ2PR11MB8566.namprd11.prod.outlook.com (2603:10b6:a03:56e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.15; Mon, 20 Oct
 2025 06:20:15 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%4]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 06:20:15 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "dmitry.osipenko@collabora.com"
 <dmitry.osipenko@collabora.com>, "gurchetansingh@chromium.org"
 <gurchetansingh@chromium.org>, "kraxel@redhat.com" <kraxel@redhat.com>,
 "airlied@redhat.com" <airlied@redhat.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux.dev" <virtualization@lists.linux.dev>
Subject: RE: [RFC][PATCH] drm/virtgpu: Make vblank event dependent on the host
 resource
Thread-Topic: [RFC][PATCH] drm/virtgpu: Make vblank event dependent on the
 host resource
Thread-Index: AQHcPqyOICgcQp9euUCaQTY4FsET/rTFt30wgAA9H4CAALF2kA==
Date: Mon, 20 Oct 2025 06:20:15 +0000
Message-ID: <IA0PR11MB71850710909EE58B7543A8E2F8F5A@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20251016145230.79270-1-tzimmermann@suse.de>
 <IA0PR11MB7185A7BA7B8CEAC46CBC0922F8F6A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <21851b98-06ee-4e2c-8570-70e8a4fe5d86@suse.de>
In-Reply-To: <21851b98-06ee-4e2c-8570-70e8a4fe5d86@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|SJ2PR11MB8566:EE_
x-ms-office365-filtering-correlation-id: 3f135c7b-4b04-4416-7b2e-08de0fa0bbf5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?7umbClIiMOey9GPeXDU17ov4M+CJDpW6jzVoGWxktlj9MuS4Gh043lnpLM?=
 =?iso-8859-1?Q?EJ5f24r1YbNovlTi0MvNpuPw1gYYsk2jR0NL4BGpwG5JNdflbVzjexnU+3?=
 =?iso-8859-1?Q?ub93CdIhusiVrTr420XsNW+MFvmdvAChw5WtnBnJPyU3/nqxb52pRRhrzk?=
 =?iso-8859-1?Q?YYqgPu14tXtSHUWiGq6Py1twprcOCLPFgRFGFf9HpH0lFaGdi3h+OGtGDX?=
 =?iso-8859-1?Q?ez56RRQx7pZj63iBrF8NE89MCxQRSbCcMGDxT6f8DNjY3aTrcM6TSwMdOC?=
 =?iso-8859-1?Q?JzJe0XdOgmIAC6ki70Ff81M4herrBQSHRZL4SnISitexARrmG5bDyuexj0?=
 =?iso-8859-1?Q?/IkiR8Mu+B649Ha9J/TvYtmT2ldmQ0rg+t1h2Ie/TY38RdboguY0MPkfxa?=
 =?iso-8859-1?Q?ycwH7SC/s86fNTO/yutTN115432ndHdPAVtjk1gnyuO+a/QhGqHlU3RoHZ?=
 =?iso-8859-1?Q?7+SXdtXpt71G8f4L2arklUU+pSMyvM4QINpLGSpnIM6QhzbR7jP0BMwrKf?=
 =?iso-8859-1?Q?ceFJUD3BNze+8sI/Lmfb0VHXmQCjjGJrT9yqYHYKf0p+y19rONwJGSADIm?=
 =?iso-8859-1?Q?hQhUjw8EEvzgnP5JIGsJUwLiYnsQabq8Sj5QYwoCZpHxRkXSdEwmuyPDhQ?=
 =?iso-8859-1?Q?5g+5DHl/J0K5OSWyKohHNgsAYenA8Ihjd7YFDcxREL0dN92cQcigkHW4vP?=
 =?iso-8859-1?Q?6AzFejpe9FtTqKNWQifUKAynqPhtGu9a8+C1hpsjwG68zcJs4tPiJGYE1s?=
 =?iso-8859-1?Q?0c99aeUaZuKJSutGWn0tj2iigxory6VHHtConzgcYP/KhAzRLlkIBuKvmd?=
 =?iso-8859-1?Q?VnUOa4TJpL2oZR33ICN4LQIBoObZNb3v4K905jnODYEC785hDnCpz6cmrk?=
 =?iso-8859-1?Q?fJk90c4shKtknaRhWYH7G9xPvJEhEBtTkbj72kicuQHzPoJM7ZHRzuGjL7?=
 =?iso-8859-1?Q?Yqi8FHdehDj5UOTzckGJhpMwxc2IUmR7e37FuaGDhDI3RqNYJCe2O/6W4F?=
 =?iso-8859-1?Q?IM6e1BDwi4MqSmDhCMjcsF3IZITPmPzKx7T1pxrJt3IgPSQTzQMO5aSG4z?=
 =?iso-8859-1?Q?M2ivh5PbQGApbhmSYqYN1XFvcykGg1fpByHPvPvloDDm5qLagstzF8oGGH?=
 =?iso-8859-1?Q?T8uLtBBSMbzkgEbnMpERbG7eCo73KBLeuFn5YCxapvmeoszLa9yMaz5EsT?=
 =?iso-8859-1?Q?ap8oevuxDMh92sa3KTsyXf+LvxzmQqq1n3E/aNReSWqRZlvYPGLHQ2o9lX?=
 =?iso-8859-1?Q?nQcIhEjsEZ6CFUZzx9t8WNJgvd4f17lpe5IhOuj7z/xGvGZeE+x1xMCcT5?=
 =?iso-8859-1?Q?Ps+o0pEfz4ca0wdbNx9Hsa69vWjpvntB4AWp1sB4tbxqLU38lnSVwTIrTd?=
 =?iso-8859-1?Q?UlQSXhABX0uktSxRIHnHrRriP3vH6FtcrE2sqET8PlPW5TIDY7tf9QfgFH?=
 =?iso-8859-1?Q?wyfKkZ7eQOVJmvL+jGLLPOoTTuDp+G1+K3RNYjVrLMm3KwypGew5XsP88p?=
 =?iso-8859-1?Q?wGtzcDdkxraJsxwJC+9S0EXBNexkoU2Mr6b7Yph89w1g5X/EU+NwvOBzCQ?=
 =?iso-8859-1?Q?HnFWcMEW2V5aDtZqCeKoCLVbv8hc?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?QygA99B7B8fYIO8IUbOret6jtShnwB3VTesjAxlTs8vSpXyQ3Pd/OdXlHy?=
 =?iso-8859-1?Q?eQkCO9lZ6XlLjTWzdpH2s/HVfPccS8hffaskvvAv2S/l6lSkzXGcYNTqYw?=
 =?iso-8859-1?Q?pJfliCHfCs4aRnGXZ4WJHkAV1UQIdS/kR+nkJa9j86rnTl6AzvM3QMTHxY?=
 =?iso-8859-1?Q?GM0p/L2e3Z0Ue8Z+I28W2envEzTxVuPiTUDlgfHxgBCspwOx8zKnjENY/M?=
 =?iso-8859-1?Q?cFMioKCer2ofq2b8492qOrpF3ZDKDgksEABwN1/rZut/rC2/ikBfpiqu7T?=
 =?iso-8859-1?Q?eJqGSJsGDobC0JpFB/f1x14h4+U/K2D+0kzelvIrtsXLa7MJtDqK9tnWsO?=
 =?iso-8859-1?Q?9/S9ZZFj85G3J49w6ls+XlGIRoMyJPC48d3R/7k7gKaW8aSyo436QZ+cNU?=
 =?iso-8859-1?Q?zx2Nnek51kYpReM2rapxwaaqRBgBTHEEKbEwvtZYp6qtIM1u/CF0788T1c?=
 =?iso-8859-1?Q?v2dNVIFEkE0jHtrIrw/k1FlJGep/lcPh6IUYTyhD5SC76jzsK7fqtG/cwy?=
 =?iso-8859-1?Q?HVTXczjD1YJtxIW6eSb+fG9bUP4B/9wG0nuE/ZDTFTIFrLVohZQxQkob3/?=
 =?iso-8859-1?Q?IWAceogGP4d4/LAzV63lBsOYum1m841mJv96U/Ki0A7TAn9pGnVFc9drtf?=
 =?iso-8859-1?Q?p0wIyhd0LiE9HroTPiQN0y3q2V2VGVBRKIHTdQXcjTyxQt9HGsXF8X8dr9?=
 =?iso-8859-1?Q?QvJIhJkRrqtJmMf6ZbFedT56HIoppg6v8GUybNt2+lKDaYOM3/kPcstHYu?=
 =?iso-8859-1?Q?lPlPAVc8JbAsW9AJnw3I68FhjWSuHnLvQfBg5LDMeNUMeeL2FqXksO3zB1?=
 =?iso-8859-1?Q?boIUUdBQh8YEMmTGz/rLsYImqpx2puOui3zJ+kUrW6J+CQFifh6SZWlgbM?=
 =?iso-8859-1?Q?s0HzFm3MI8P7Hf60LEi8afqXFjcSyBlJOiSxegaLFa8Fg0wrQUoph/PUtA?=
 =?iso-8859-1?Q?QPEq4+ogpo7+NMfrYqg7zbWlwFkS65aqtWNmCBnlXA5w8uXNqgKQxu+xmd?=
 =?iso-8859-1?Q?xu3/6SLzsj0cFdVAEcIa8e4bPX+W4X0HirPYIj+OAKu1KJGWScrZe97fKI?=
 =?iso-8859-1?Q?EczmuOKKjbAhFW9XfduH45a1H6X4nkJxl456773AWYdWEWlZiHOVNZ141i?=
 =?iso-8859-1?Q?9DXA88JOeCqnbaVuEWaxsWajW6Ax0+j3NElMDOuIl95SNbgH7Ys8NqGFIz?=
 =?iso-8859-1?Q?v8xmB7xByYJJFsCWNO1dQ5N1tIFxGe0LXQUMliPBZ1YKgM5U9Fp9q/+JmK?=
 =?iso-8859-1?Q?hsh8GpUSQBP3vflVggnE14kAs8G5ZU1y3YF/aCn7U3dwB84oA8tN/HgvXS?=
 =?iso-8859-1?Q?PMhoJGdy/VOBguNlET2XWxcKQkKmaYs+7yrbuHtZS/hg2Idgi7Ug2oSlx6?=
 =?iso-8859-1?Q?FoY4KzSx+4NTXwz+5yyKlqAE81khExjZvo41fB7W0niyjGB3XYe3AwITzf?=
 =?iso-8859-1?Q?NI27lbeOo+VqDKyDju+Yy1EDTFGvNfvIZkRS7oxeGPyACb5mow0+LFT4+1?=
 =?iso-8859-1?Q?T4QX3Wrd4bXRsihPJpWQpWhUjUfxIu5C+1QwlnSt86B2Mza3rwJlvRpPQU?=
 =?iso-8859-1?Q?NB8gnQvAkrpTa4DgOFVnD/HQ09mK/sR1QSjm0UUuPJBc9I1tnUpweW/9uK?=
 =?iso-8859-1?Q?xdmjvOCsZ8lj0iVX5APWIJPrOiw9/Rhlqc?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f135c7b-4b04-4416-7b2e-08de0fa0bbf5
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2025 06:20:15.5717 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +LgeRKnE/gn4T40DdoR4uqlrLtw2Dn3/HAajb/OZqkPYbsSMOJS0MpslLAbN+zGt4VRnq+apbOS3BlF3ObsflWVUsd1MFSogF+SHQmEc594=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8566
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

Hi Thomas,

> Subject: Re: [RFC][PATCH] drm/virtgpu: Make vblank event dependent on the
> host resource
>=20
> Hi
>=20
> Am 17.10.25 um 08:03 schrieb Kasireddy, Vivek:
> > Hi Thomas,
> >
> >> Subject: [RFC][PATCH] drm/virtgpu: Make vblank event dependent on the
> host
> >> resource
> >>
> >> For each plane, store the buffer object's host backing in the state
> >> of the plane's respective CRTC. The host synchronizes output of buffer
> >> objects with a host resource to its own refresh cycle; thus avoiding
> >> tearing. During the CRTC's atomic flush, ignore the vblank timer if
> >> any of the CRTC's plane's buffer object has a host resource. Instead
> >> send the vblank event immdiatelly. Avoids corner cases where a vblank
> >> event happens too late for the next frame to be page flipped in time.
> >>
> >> The host synchronizes a plane's output to the host repaint cycle if
> >> the plane's buffer object has an associated host resource. An atomic
> >> commit blocks until the host cycle completes and then arms the vblank
> >> event. The guest compositor is thereby synchronized to the host's
> >> output rate.
> >>
> >> To avoid delays, send out the vblank event immediately instead of
> >> just arming it. Otherwise the event might be too late to page flip
> >> the compositor's next frame.
> >>
> >> The vblank timer is still active and fires in regular intervals
> >> according to the guest display refresh. This rate limits clients
> >> that only wait for the next vblank to occur, such as fbcon. These
> >> clients would otherwise produce a very high number of frames per
> >> second.
> >>
> >> For commits without host resource, the vblank timer rate-limits the
> >> guest output by generating vblank events at the guest display refresh
> >> rate as before.
> >>
> >> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >> ---
> >> There was a discussion about interference between vblank timers and
> >> the host repaint cycle at [1]. This patch address a possible corner
> >> case were the timing gets bad.
> >>
> >> [1] https://lore.kernel.org/dri-
> >>
> devel/IA0PR11MB7185D91EB0CD01FD63D21AA7F8EEA@IA0PR11MB7185.na
> >> mprd11.prod.outlook.com/
> >> ---
> >>   drivers/gpu/drm/virtio/virtgpu_display.c | 72 ++++++++++++++++++++++=
--
> >>   drivers/gpu/drm/virtio/virtgpu_drv.h     | 15 +++++
> >>   drivers/gpu/drm/virtio/virtgpu_plane.c   | 16 +++++-
> >>   3 files changed, 98 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c
> >> b/drivers/gpu/drm/virtio/virtgpu_display.c
> >> index e972d9b015a9..43df1fa7d629 100644
> >> --- a/drivers/gpu/drm/virtio/virtgpu_display.c
> >> +++ b/drivers/gpu/drm/virtio/virtgpu_display.c
> >> @@ -49,14 +49,76 @@
> >>   #define drm_connector_to_virtio_gpu_output(x) \
> >>   	container_of(x, struct virtio_gpu_output, conn)
> >>
> >> +static void virtio_gpu_crtc_state_destroy(struct virtio_gpu_crtc_stat=
e
> >> *vgcrtc_state)
> >> +{
> >> +	__drm_atomic_helper_crtc_destroy_state(&vgcrtc_state->base);
> >> +
> >> +	kfree(vgcrtc_state);
> >> +}
> >> +
> >> +static bool virtio_gpu_crtc_state_send_event_on_flush(struct
> >> virtio_gpu_crtc_state *vgcrtc_state)
> >> +{
> >> +	struct drm_crtc_state *crtc_state =3D &vgcrtc_state->base;
> >> +
> >> +	/*
> >> +	 * The CRTC's output is vsync'ed if at least one plane's output is
> >> +	 * sync'ed to the host refresh.
> >> +	 */
> >> +	return vgcrtc_state->send_event_on_flush & crtc_state->plane_mask;
> >> +}
> >> +
> >> +static void virtio_gpu_crtc_reset(struct drm_crtc *crtc)
> >> +{
> >> +	struct virtio_gpu_crtc_state *vgcrtc_state;
> >> +
> >> +	if (crtc->state)
> >> +		virtio_gpu_crtc_state_destroy(to_virtio_gpu_crtc_state(crtc-
> >>> state));
> >> +
> >> +	vgcrtc_state =3D kzalloc(sizeof(*vgcrtc_state), GFP_KERNEL);
> >> +	if (vgcrtc_state) {
> >> +		vgcrtc_state->send_event_on_flush =3D 0ul;
> >> +		__drm_atomic_helper_crtc_reset(crtc, &vgcrtc_state->base);
> >> +	} else {
> >> +		__drm_atomic_helper_crtc_reset(crtc, NULL);
> >> +	}
> >> +}
> >> +
> >> +static struct drm_crtc_state
> *virtio_gpu_crtc_atomic_duplicate_state(struct
> >> drm_crtc *crtc)
> >> +{
> >> +	struct drm_device *dev =3D crtc->dev;
> >> +	struct drm_crtc_state *crtc_state =3D crtc->state;
> >> +	struct virtio_gpu_crtc_state *new_vgcrtc_state;
> >> +	struct virtio_gpu_crtc_state *vgcrtc_state;
> >> +
> >> +	if (drm_WARN_ON(dev, !crtc_state))
> >> +		return NULL;
> >> +
> >> +	new_vgcrtc_state =3D kzalloc(sizeof(*new_vgcrtc_state), GFP_KERNEL);
> >> +	if (!new_vgcrtc_state)
> >> +		return NULL;
> >> +
> >> +	vgcrtc_state =3D to_virtio_gpu_crtc_state(crtc_state);
> >> +
> >> +	__drm_atomic_helper_crtc_duplicate_state(crtc, &new_vgcrtc_state-
> >>> base);
> >> +	vgcrtc_state->send_event_on_flush =3D vgcrtc_state-
> >>> send_event_on_flush;
> >> +
> >> +	return &new_vgcrtc_state->base;
> >> +}
> >> +
> >> +static void virtio_gpu_crtc_atomic_destroy_state(struct drm_crtc *crt=
c,
> >> +						 struct drm_crtc_state *crtc_state)
> >> +{
> >> +	virtio_gpu_crtc_state_destroy(to_virtio_gpu_crtc_state(crtc_state));
> >> +}
> >> +
> >>   static const struct drm_crtc_funcs virtio_gpu_crtc_funcs =3D {
> >>   	.set_config             =3D drm_atomic_helper_set_config,
> >>   	.destroy                =3D drm_crtc_cleanup,
> >>
> >>   	.page_flip              =3D drm_atomic_helper_page_flip,
> >> -	.reset                  =3D drm_atomic_helper_crtc_reset,
> >> -	.atomic_duplicate_state =3D drm_atomic_helper_crtc_duplicate_state,
> >> -	.atomic_destroy_state   =3D drm_atomic_helper_crtc_destroy_state,
> >> +	.reset                  =3D virtio_gpu_crtc_reset,
> >> +	.atomic_duplicate_state =3D virtio_gpu_crtc_atomic_duplicate_state,
> >> +	.atomic_destroy_state   =3D virtio_gpu_crtc_atomic_destroy_state,
> >>   	DRM_CRTC_VBLANK_TIMER_FUNCS,
> >>   };
> >>
> >> @@ -129,7 +191,9 @@ static void virtio_gpu_crtc_atomic_flush(struct
> >> drm_crtc *crtc,
> >>   {
> >>   	struct drm_device *dev =3D crtc->dev;
> >>   	struct drm_crtc_state *crtc_state =3D
> >> drm_atomic_get_new_crtc_state(state, crtc);
> >> +	struct virtio_gpu_crtc_state *vgcrtc_state =3D
> >> to_virtio_gpu_crtc_state(crtc_state);
> >>   	struct virtio_gpu_output *output =3D
> >> drm_crtc_to_virtio_gpu_output(crtc);
> >> +	bool send_event_on_flush =3D
> >> virtio_gpu_crtc_state_send_event_on_flush(vgcrtc_state);
> >>   	struct drm_pending_vblank_event *event;
> >>
> >>   	/*
> >> @@ -147,7 +211,7 @@ static void virtio_gpu_crtc_atomic_flush(struct
> >> drm_crtc *crtc,
> >>   	crtc_state->event =3D NULL;
> >>
> >>   	if (event) {
> >> -		if (drm_crtc_vblank_get(crtc) =3D=3D 0)
> >> +		if (!send_event_on_flush && drm_crtc_vblank_get(crtc) =3D=3D 0)
> >>   			drm_crtc_arm_vblank_event(crtc, event);
> >>   		else
> >>   			drm_crtc_send_vblank_event(crtc, event);
> > As suspected, before applying this patch, the frame rate was halved:
> > root@localhost:/weston_upstream/weston# ./build/clients/weston-simple-
> egl -o &
> > Using config: r8g8b8a0
> > has EGL_EXT_buffer_age and EGL_EXT_swap_buffers_with_damage
> > has EGL_EXT_surface_compression
> > 150 frames in 5 seconds: 30.000000 fps
> > 149 frames in 5 seconds: 29.799999 fps
> > 152 frames in 5 seconds: 30.400000 fps
> >
> > And, after applying this patch:
> > root@localhost:/weston_upstream/weston# ./build/clients/weston-simple-
> egl -o &
> > Using config: r8g8b8a0
> > has EGL_EXT_buffer_age and EGL_EXT_swap_buffers_with_damage
> > has EGL_EXT_surface_compression
> > 277 frames in 5 seconds: 55.400002 fps
> > 273 frames in 5 seconds: 54.599998 fps
> > 298 frames in 5 seconds: 59.599998 fps
> > 284 frames in 5 seconds: 56.799999 fps
> > 287 frames in 5 seconds: 57.400002 fps
> > 272 frames in 5 seconds: 54.400002 fps
> > 289 frames in 5 seconds: 57.799999 fps
> > 287 frames in 5 seconds: 57.400002 fps
> > 289 frames in 5 seconds: 57.799999 fps
> > 272 frames in 5 seconds: 54.400002 fps
> > 266 frames in 5 seconds: 53.200001 fps
> > 261 frames in 5 seconds: 52.200001 fps
> > 277 frames in 5 seconds: 55.400002 fps
> > 256 frames in 5 seconds: 51.200001 fps
> > 179 frames in 5 seconds: 35.799999 fps
> > 169 frames in 5 seconds: 33.799999 fps
> > 178 frames in 5 seconds: 35.599998 fps
> > 211 frames in 5 seconds: 42.200001 fps
> > 255 frames in 5 seconds: 51.000000 fps
> >
> > As you can see, the frame rate/performance improves but it occasionally
> > drops into the 30s and 40s, which is a bit concerning because if I reve=
rt
> > this patch and a036f5fceedb ("drm/virtgpu: Use vblank timer") and test
> > again, I do not see this drop.
> >
> > This suggests that the vblank event is still delayed in some other corn=
er
> > cases, which might be challenging to figure out.
>=20
> There's little difference between the current event handling and the one
> where no vblanks have been set up. I suspect that the vblank timer
> callback interferes with the locking in atomic_flush. That would also
> explain why the fps drop at no clear pattern.
>=20
> Could you please test the attached patch? It enables/disables the vblank
> timer depending on the buffer resources; as you suggested before.=A0 Does
> this make a difference?
Tested the attached patch and the frame rate/FPS is now consistent:
root@localhost:/weston_upstream/weston# ./build/clients/weston-simple-egl -=
o &
Using config: r8g8b8a0
has EGL_EXT_buffer_age and EGL_EXT_swap_buffers_with_damage
has EGL_EXT_surface_compression
283 frames in 5 seconds: 56.599998 fps
300 frames in 5 seconds: 60.000000 fps
301 frames in 5 seconds: 60.200001 fps
300 frames in 5 seconds: 60.000000 fps
299 frames in 5 seconds: 59.799999 fps
300 frames in 5 seconds: 60.000000 fps
300 frames in 5 seconds: 60.000000 fps
301 frames in 5 seconds: 60.200001 fps
300 frames in 5 seconds: 60.000000 fps
297 frames in 5 seconds: 59.400002 fps
301 frames in 5 seconds: 60.200001 fps
300 frames in 5 seconds: 60.000000 fps
301 frames in 5 seconds: 60.200001 fps
301 frames in 5 seconds: 60.200001 fps
300 frames in 5 seconds: 60.000000 fps
301 frames in 5 seconds: 60.200001 fps

Thanks,
Vivek

>=20
> Best regards
> Thomas
>=20
> >
> > Tested by running Gnome Wayland after launching Qemu with following
> > (relevant) parameters:
> > qemu-system-x86_64 -m 4096m -enable-kvm .........
> > -device vfio-pci,host=3D0000:03:00.1
> > -device virtio-gpu,max_outputs=3D1,xres=3D1920,yres=3D1080,blob=3Dtrue
> > -display gtk,gl=3Don
> > -object memory-backend-memfd,id=3Dmem1,size=3D4096M
> > -machine q35,accel=3Dkvm,memory-backend=3Dmem1
> >
> > Thanks,
> > Vivek
> >
> >> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h
> >> b/drivers/gpu/drm/virtio/virtgpu_drv.h
> >> index f17660a71a3e..671fc3b61bc6 100644
> >> --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> >> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> >> @@ -195,6 +195,21 @@ struct virtio_gpu_framebuffer {
> >>   #define to_virtio_gpu_framebuffer(x) \
> >>   	container_of(x, struct virtio_gpu_framebuffer, base)
> >>
> >> +struct virtio_gpu_crtc_state {
> >> +	struct drm_crtc_state base;
> >> +
> >> +	/*
> >> +	 * Send vblank event immediately from atomic_flush. Set from each
> >> +	 * plane's atomic check and depends on the buffer object. Buffers
> >> +	 * with host backing are vsync'd already and should send immediately=
;
> >> +	 * others should wait for the VBLANK timer.
> >> +	 */
> >> +	u32 send_event_on_flush;
> >> +};
> >> +
> >> +#define to_virtio_gpu_crtc_state(x) \
> >> +	container_of(x, struct virtio_gpu_crtc_state, base)
> >> +
> >>   struct virtio_gpu_plane_state {
> >>   	struct drm_plane_state base;
> >>   	struct virtio_gpu_fence *fence;
> >> diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c
> >> b/drivers/gpu/drm/virtio/virtgpu_plane.c
> >> index 29e4b458ae57..d04721c5d505 100644
> >> --- a/drivers/gpu/drm/virtio/virtgpu_plane.c
> >> +++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
> >> @@ -104,7 +104,8 @@ static int virtio_gpu_plane_atomic_check(struct
> >> drm_plane *plane,
> >>
> >> plane);
> >>   	bool is_cursor =3D plane->type =3D=3D DRM_PLANE_TYPE_CURSOR;
> >>   	struct drm_crtc_state *crtc_state;
> >> -	int ret;
> >> +	struct virtio_gpu_crtc_state *vgcrtc_state;
> >> +	int ret, i;
> >>
> >>   	if (!new_plane_state->fb || WARN_ON(!new_plane_state->crtc))
> >>   		return 0;
> >> @@ -126,6 +127,19 @@ static int virtio_gpu_plane_atomic_check(struct
> >> drm_plane *plane,
> >>   						  DRM_PLANE_NO_SCALING,
> >>   						  DRM_PLANE_NO_SCALING,
> >>   						  is_cursor, true);
> >> +
> >> +	vgcrtc_state =3D to_virtio_gpu_crtc_state(crtc_state);
> >> +	vgcrtc_state->send_event_on_flush &=3D ~drm_plane_mask(plane);
> >> +
> >> +	for (i =3D 0; i < new_plane_state->fb->format->num_planes; ++i) {
> >> +		struct virtio_gpu_object *bo =3D
> >> gem_to_virtio_gpu_obj(new_plane_state->fb->obj[i]);
> >> +
> >> +		if (bo->host3d_blob || bo->guest_blob) {
> >> +			vgcrtc_state->send_event_on_flush |=3D
> >> drm_plane_mask(plane);
> >> +			break; /* only need to find one */
> >> +		}
> >> +	}
> >> +
> >>   	return ret;
> >>   }
> >>
> >> --
> >> 2.51.0
>=20
> --
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)

