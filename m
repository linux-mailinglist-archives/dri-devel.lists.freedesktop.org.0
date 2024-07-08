Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 953B392AC0A
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 00:27:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1918B10E184;
	Mon,  8 Jul 2024 22:27:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CRypD7gb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ADF810E184
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2024 22:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720477629; x=1752013629;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=lOxkCqWJGk1nsz8oLDSpXHYlmn9bz6Xi0d7Qm6c6Q+o=;
 b=CRypD7gbXkmi4TgSeGd0bDbVSRa4WcRMnlGBB18pCBiMskqKpQyECX/8
 x7OVqOT0r5cNJ6XQ3cazpbbCNnvjJzYt7J21GK3KckPqVyTtw79M4w/al
 199TLmvBVKvp5UIIYBijqVA8sYEWupu0u8/Qfr0aBN4+pX/OhBdupNhXx
 pqgJO28wvV4vGZRxFjlE+E7JosRA27eN48TQ4tzBfwRl/3iZkSar8sGdr
 Qy+hGmzqIrbVxSP5WE+Z/iEqCIsTn0SVQb5+Wh/KHnwKvPXktCtoVDjfl
 elMDnCbuXjLtjeWJmKpAzFgCNiSIoqauDDpp5slGfUL6kr2uctZxU9uKS g==;
X-CSE-ConnectionGUID: Dk5lr11XTTqcOjJiWN4rgQ==
X-CSE-MsgGUID: gVdzxcDpQDagUrXsrau9OA==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="28372946"
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; d="scan'208";a="28372946"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 15:27:09 -0700
X-CSE-ConnectionGUID: sGGHYuoXR9qyvQbWK+2Now==
X-CSE-MsgGUID: eEkHlkn8QK+BxhhSjbkg8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; d="scan'208";a="47530323"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Jul 2024 15:27:09 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 8 Jul 2024 15:27:08 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 8 Jul 2024 15:27:08 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 8 Jul 2024 15:27:08 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 8 Jul 2024 15:27:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S2Au1oWjP5P8sLW8lQAZcUiYXxRlBh+Q1nL4xOb/9we2pbatfDuj5SVWUiPvo/ZsNgRd7y4aY3RiIIXc70hA9a/65vCPh2HczECJhS5wZBz/PB0+Uyr/W9bkEsGAAjvV9rOSxywqoXcHo3bjqBzC2i9npQo0OlSQdhVYuQdxKVLzQtrP4IoNHB24r27p7LP/CtodOfI7XzrA1vzrr34T1yj0tbAZR/Lsx82ZhWWv+WMq+4zdS1OeQ9gQMxBr7MylYCYwky4+P26mhjtUl3/Cxm2E76gPwYeJ7uTTFwR5jyKMKmptt4nS+yQuFkYKk8kZ2ksOHfZ92EGxk8vWKsW5dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2lJs15iA1lGrAVyZ78jt3YUjsBvDfjH7Iwl9rimm8HQ=;
 b=eJPabKSvOeVzubLvAOf50DgnNTTZ1f/6i5rXPAJ/immXcGq3hyUy7VVtjsJHKUp4zeCJFj2IZkwW2SjQQsXOFWLb9weiu/LbLdH1Hq/kAwfaQC9t4iG4E3wvgV7ZWlh4OVmmwhK7w2DEpWJeNzQ7bzMwV3BctgujOmXlCifDp63MEYVOTnRsf9/3kESfmbEx/OTeBbV0HZBG+sF9WXoZ0V2Wz+PptJAoFoYnNJAsvA1dBT0bWFLGhpiS2NGRrO+U05wdGQ/e3EXCXIl+xk9etzzUp6F/Cca9s1mhqOOtPg/KbUQzqFWebNSl57UByd0EHCKVnu57w8HeImL7KMJiPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by SJ0PR11MB5070.namprd11.prod.outlook.com (2603:10b6:a03:2d5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Mon, 8 Jul
 2024 22:27:06 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%6]) with mapi id 15.20.7741.033; Mon, 8 Jul 2024
 22:27:06 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Josh Simonot <JSimonot@live.ca>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: virtio_gpu_cmd_resource_flush
Thread-Topic: virtio_gpu_cmd_resource_flush
Thread-Index: AQHazMZcnNAp4heC1U+vtLtmW636ALHlCRMtgAOwx/CAAbKPAIADAvcQ
Date: Mon, 8 Jul 2024 22:27:06 +0000
Message-ID: <IA0PR11MB7185976EED1AC983CDEFCCD8F8DA2@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <DM6PR02MB4283EC97FB486C9E9357D3F0C7DC2@DM6PR02MB4283.namprd02.prod.outlook.com>
 <DM6PR02MB4283010B4A4CE521B1050042C7DD2@DM6PR02MB4283.namprd02.prod.outlook.com>
 <IA0PR11MB71856F2BCA9AD5EB8E01A129F8D82@IA0PR11MB7185.namprd11.prod.outlook.com>
 <DM6PR02MB428310A506FC551E3B6078CFC7D92@DM6PR02MB4283.namprd02.prod.outlook.com>
In-Reply-To: <DM6PR02MB428310A506FC551E3B6078CFC7D92@DM6PR02MB4283.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|SJ0PR11MB5070:EE_
x-ms-office365-filtering-correlation-id: 9db25c0f-78c8-4847-aa13-08dc9f9d1966
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?zfHhJI065AiG1r4hOLW1OimMHmQbZAPPlGtCeclVxWbgBqffQOIdUTompbqk?=
 =?us-ascii?Q?0HTPgMmBpMC2rxLop2GxqKF+UyxrrRmW69xS1BT2S74wLpUXiJ9oyY6I6eRC?=
 =?us-ascii?Q?Y71OInBkIEyMNpfeZ3JrZB/huSYReI3eRGAkk+3e0i+z7YkJghCzFB9lSN4Z?=
 =?us-ascii?Q?Rqusi9QHQCuwh/flcRk2HXKhAeLh5A8V4yywvCy5tdoJj9UpQl1BoAfAlRjf?=
 =?us-ascii?Q?g1OsmSETaUfmP5zbH0K9mfyCUCpj7vhqeB9tj30m7jtVzv4+Z3Bz58K2UUUn?=
 =?us-ascii?Q?iYsGtUFzqrqhl883QxYJ+TAKrdX99rV9RoK6dqOIIxe22RCY0y0ZCnmgELtG?=
 =?us-ascii?Q?PaETJMbCuJYdWHLAmZXMsXs6FWJVGd6Cs1nbDqfO+BTdbEDm5dbPpa5JRZgZ?=
 =?us-ascii?Q?XP9DXQ+mMFyOTQoJ8zqpNqwytgIRRaaA2aRgCCeMFhdTgfllQd7TPKhLAv4y?=
 =?us-ascii?Q?MYb0JL+60oqsoMS/i5djbo3cKlE/j+O4xw8wMpJFoAc9IUhwL5V3VVslqrRq?=
 =?us-ascii?Q?csbFJcS/Fb33KrWXJ8D76gPA1ZX5tRr/MDL1WJHbEgqrijMbzp6Naf5sKNxq?=
 =?us-ascii?Q?Me/zq8IWXaA6MEn/7FA8Eb7OsE3i7XVoY7KGb+DEOJEw9lenk/Ert2MDNI/7?=
 =?us-ascii?Q?76emg+1UX+Jg29a2xwyEkxggoriKuVlXxHSMS+Bli2CmHgiEX1sTaId3c0UH?=
 =?us-ascii?Q?lX7qy9+rBA+Sncgg05wwjcFDALkybqzh+tWJer4x03gCK0Zy1+R7ug2MI0nb?=
 =?us-ascii?Q?n9U46ORcP3Wq288/LAyUNI+EreDQZEtmR5l7gWXBsGpkgnFRSMvT889h1rNQ?=
 =?us-ascii?Q?QgYY0ES13ffLNUvq5cdbLBjEQDQjQPWz+3YejLwMle4xzvwgRcKNPTd/kLEI?=
 =?us-ascii?Q?Wwtvc3Qq7ZzLUtTuZd5FfkDeWmDPgROHkF8NUtK8p+aCkGaCfEGA+xN8nveS?=
 =?us-ascii?Q?c6C+ocwnRckSJ66megAUNxSyqT3my53W/4fJ+Qr4br9mqCcwG8bHLM3cUMLs?=
 =?us-ascii?Q?mx6oWkl2hYqdbroFVqjS2i7xIjnpPfd21bSkY7K4jN+s94iDFK66Tu1v43iq?=
 =?us-ascii?Q?CrcSB9EMHE7LMB0IX4lNlY925hcNhfAg3rZXRnN6WVrUDuFz3OAFyrrBzr6J?=
 =?us-ascii?Q?9Sm5SZS/F7F1E8PEpy154heFhRZ+PAyec5VDlxwdCJ76cEnp6ZjAB6gZuB8y?=
 =?us-ascii?Q?rhOcxYdkpsbb3mz8J5excXHfl4pxhyTlLck78q2oX9i2eE4tOUgohxKSgTp8?=
 =?us-ascii?Q?TOF3Lf/1IREy/HB89S6UMsZQP1TGbg0wIffNdt5W9DZ3iRNjC3Z7Pk3lBsDu?=
 =?us-ascii?Q?7gM5wPcZCCuw4howzq3oABWlqO7+MxXRY7AlOC4zH6HTMvOKz2OmtbPZih3r?=
 =?us-ascii?Q?pqbSimASTyUmwjhC9OM0zM/SJiOa+t1sKhgp+BqK4ecu18JOmA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?oDTVMybkdt4BB4Byipl1IqrcAx+fFhnUnSiVxtXH2iyHZG5cNbDVrOdpqEcO?=
 =?us-ascii?Q?+CSE4oodo+L4QxBQodt4rGQAc+T/XXYO9A0tf0ulwi1QPgC5gwfGNiV4h7v1?=
 =?us-ascii?Q?GzregC+qsjLnok29v8HIVeAxGaHOQQAXeuE+Hpp6rMtYMQA38coKY3iH8AzT?=
 =?us-ascii?Q?DrWG42FuCKXFF2yHpx+FAvuXKMmcZgG0tqES/J8ZXixJ5/vWnp1sd55GVj53?=
 =?us-ascii?Q?ITZYxpt676h/QTsGSz7Pw3z6QJvYaajk4O5WXiCp/VtnkP2iQIUPrKe6tPKC?=
 =?us-ascii?Q?HsagmNktbrik/z/z/+Pwwv0t3yZk9DenH4cHmGCwHIAzN2pfIwGJToxDgZSW?=
 =?us-ascii?Q?0t071QqJhNomH6CHIU7BUpym1YLWcZRIgGZmbUZrGxcsqB0JJfEgJ/nA3AE6?=
 =?us-ascii?Q?xcMf/UpI4s+oZaDPaxRkgDgN3iGJgN0PdbyIkd5huj4HqvG5RxYQqhORM1fL?=
 =?us-ascii?Q?+Sf/bXDz6Z0hMS3qwZEmHrK4eapM4zr5ZPy8osOqtiIvy2d9dGXcRYBnBibS?=
 =?us-ascii?Q?ViPlIfJmn9Q2MiPu03q3oWIolba90xLuXdbVaKYTVQ3jm7dTtM/HKyj1sLHv?=
 =?us-ascii?Q?4hTP0VEZJokBUl+nqyq05u6haRMBaUhe5QmALJkebZ1M+zgn1zHpg89nkaNN?=
 =?us-ascii?Q?poCwrm9NRgXiyFb327hXW+mSfQY9sOrvui0Wo5SQM+BvDXSuv9lO8c9lf0vh?=
 =?us-ascii?Q?EhbMPYN4peVC9xW8Et8Ger3j06D+xKDonoSKJeLDlhEXVGTX+yOSoeeei1OP?=
 =?us-ascii?Q?k35cuH2W2sFLs6MjAx2FxCX76Xw+CtVdnjUntO4GJVd2ezcUwDotgucC5Rsj?=
 =?us-ascii?Q?LoXmg6OYj1aRUKD/3LI/bwf8o1dCXJSK15OlomEXRhpZFJAMwo3H1JUixPxp?=
 =?us-ascii?Q?uxqOxq3TvxDn/Z9FzpGwJE/N8nvTYYP892jo0h5tYRA4WIaL4FdsoLPfzfMv?=
 =?us-ascii?Q?fr3IjiaKHNvKNsILTuyUwdlRlfg22Z8L3+jlZpAvAw2DnJxJVMoDbNvE3AZg?=
 =?us-ascii?Q?0wvVb8sU2a68iYCimwH4l1Qldb+sJ3K9FtDJbQH8kcNY1Ind6uXLfeQLQrGd?=
 =?us-ascii?Q?+HlLjRMXuhyLx/+DwzheZXJfjdLa8oic0DEt5Eg8z57e/zWuFYRJTNxH/18q?=
 =?us-ascii?Q?xZALCBOMun2K4WFKhwVhlV48WqvrJajPH6IXWZ2EI1hHty93JVL+sAItvxt6?=
 =?us-ascii?Q?o3q9VpI3zmd23iGwha83P9wK/8Dolq5FltcrXoynvvXT236fhODYm5SjqmG9?=
 =?us-ascii?Q?9BidB0t+wnki6KzJWFEBKO38kNqRgQOKG0j3Q+VnpK5hIqdYZ+EJoevwHsSy?=
 =?us-ascii?Q?MNkciqAEZb3d1If0PuKRGd+VvNgaOkCRxnzmRni7Tyc0dI0C+fS2JLi5MwmV?=
 =?us-ascii?Q?R6+1ctwnhIjeqV5hTch1jGBcuZP9M1g/rNTgvQTMRnw7nIKzU9kKJA7CjWF4?=
 =?us-ascii?Q?3mLcUUq+JqFLYQJ2zP1/BXh6w2mAIquLKWoxlRrk0E1sbssU9RHoOfJMcdrr?=
 =?us-ascii?Q?PWjrWMZuWCK2qSVSCNNxU03kOEklzEd9PmSnu1BJswUjeIsGSgcraQNDSEi7?=
 =?us-ascii?Q?AnvBv+EF9THpVdSUnFhMNdN+rRWZxKaJ0rv1KEjb?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9db25c0f-78c8-4847-aa13-08dc9f9d1966
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2024 22:27:06.3988 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OINix4600BTakKd1C7sdBGpCOzQR9ENmdKMSR4NW2FHNw61qmpU6Ev4Du7oE4wSgP8N6sMi9HKVWQw/GStqj66EEHqd0FXQSiMbDIAuWIao=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5070
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

Hi Josh,

>=20
> > If virgl=3Dtrue (which means blob=3Dfalse at the moment), then things w=
ork
> > very differently.
> Yes, we're using virglrenderer. The flushed resources are backed by host
Virgl is not my forte. Someone working on virgl should be able to help you.

Thanks,
Vivek

> allocated buffers.  We tried posting the flushed resource directly to the
> display and replied to the flush immediately (since not fenced), but I se=
e
> artifacts - I assume the guest is reusing the resource as its being poste=
d.
>=20
> So now I'm doing a gpu-blit from the flushed resource into a separate set=
 of
> backbuffers for display.  The blit is done in another thread and I have i=
t
> synchronized so that a second flush can't return until the first flush's
> resource has been copied, making it safe for the guest to reuse.
>=20
> This is working ok with a double buffered guest compositor, but its not i=
deal
> as it can still hold up processing the virtio controlq.  I really need th=
ese
> flushes to be fenced so I can defer their response...
>=20
> So in my case, what's the best way to handle the flush?
>=20
> In case its relevant, at the moment I'm supporting an older virglrenderer=
 that
> doesn't make use of the virtio-v1.2 VIRTIO_GPU_F_RESOURCE_BLOB or
> VIRTIO_GPU_F_CONTEXT_INIT features.
>=20
> Thanks,
> Josh
