Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E78B9D5EC
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 06:12:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA6F810E834;
	Thu, 25 Sep 2025 04:12:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZbPYUDNG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13EB610E834;
 Thu, 25 Sep 2025 04:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758773523; x=1790309523;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=q9nuICAx2dT+kqFPkuu6cnLKn964lZVQKvp6lTDKEYo=;
 b=ZbPYUDNGDOL1c5T67tXGjNSYlnDXkDrExRRkft0cpPLVjy2WqVHSYSkJ
 q6WyOmvF7VyZ2Set/NN+WolEq1bPTGk9GEl/A4k+dFmvWD4ybvuta0r3n
 ceUTwV0ZiZ6bBQGJR3Ll4qYEC1qLH0ZZlZwk0OJndbzcer8KBgSM4WPvk
 Kx8dn724gNXAYIRgilvljgf2D9UAXxbW1L3A8P+Nb4iOMti8MN3RtGNsl
 NSY5PGbDfa683Ix4TNhh2LL91asTzJrb3L0iauo0gJhhkoAj8qdeb6UF4
 308dPMJ6d3/CiMN1B4hah1JbSB6nNbjA+OYFMk0neAIIbo4qxWoQufbM5 w==;
X-CSE-ConnectionGUID: 6OPfmDBnQB+ixxWTB1lB+w==
X-CSE-MsgGUID: yfh4TJzhT4iHoZ9rWEPVPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="60784367"
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; d="scan'208";a="60784367"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 21:11:46 -0700
X-CSE-ConnectionGUID: awseeIH9T2GyrCZMx1UkgQ==
X-CSE-MsgGUID: h60I7c3DQRmYq0bqd2bqsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; d="scan'208";a="182376417"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 21:11:45 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 24 Sep 2025 21:11:44 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 24 Sep 2025 21:11:44 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.45) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 24 Sep 2025 21:11:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yTgoKo4hDBSoUUQFSVppqPd8QFKuvIdMZKjMq2MSLBuyRH7mAR46PwMl/pqhmwe8UR2UvSDjVBuf8/+BYrPBovvTikfSFCXSzctBAMSEUeg34I5jCXn07Rw8wkX0IjS8zE7gAhRwi9/EMfDQnQuGgjf2iD0GeZ5Ne3FJHrv2BjeT9Z7vewqgYZUfVMN/2rcPqIYca+PZwdBn+9YZ8HjhkrPgmbPRPojjjWdz611rhVzAyIiZjkZADH8F0FhzHfrelNgCPObD4Vs3ZH7bUU8jcrV+rlyf1I9kheOYuFcDFy698bBNrlV4Tjz3rM7+dEyiAen5hS5P8xOHvouEZeMmhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q9nuICAx2dT+kqFPkuu6cnLKn964lZVQKvp6lTDKEYo=;
 b=M3bfLqjw16646Qldu/CAqOCVhSRKQRuxDvZjS0MLGYY8B5WOAoHaIf0ZSxV8eUr7GtAEEOc8ds/TCboaFQ26TLHoZRzaA2hKiuILcL+wz1vLSCaWAq4JuxW20V5qNuX9hoxzdwPx+C44lOBcbnYMgYujwWRRYANs54yfrf2vvHu0pa/yLj2ThvIz6ZGYj05UiqKAx13f9g1D4f6R7MptGWknwRAuTr+rAqWVEv3mrZM9q1zXo6UUK0bOBe6BB/X82OSfLvngIrgcuRreirrAjd02km3KgmjU3KbScXS2lf22vgFgy9HXxZtnETpTZUpMKgR3AefBdN0tFbfj75pH1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by SJ2PR11MB8540.namprd11.prod.outlook.com (2603:10b6:a03:574::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Thu, 25 Sep
 2025 03:56:03 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%4]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 03:56:03 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: =?iso-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>, "Jason
 Gunthorpe" <jgg@nvidia.com>
CC: "Brost, Matthew" <matthew.brost@intel.com>, Simona Vetter
 <simona.vetter@ffwll.ch>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, Bjorn Helgaas <bhelgaas@google.com>, "Logan
 Gunthorpe" <logang@deltatee.com>, "linux-pci@vger.kernel.org"
 <linux-pci@vger.kernel.org>, =?iso-8859-1?Q?Thomas_Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: RE: [PATCH v4 1/5] PCI/P2PDMA: Don't enforce ACS check for device
 functions of Intel GPUs
Thread-Topic: [PATCH v4 1/5] PCI/P2PDMA: Don't enforce ACS check for device
 functions of Intel GPUs
Thread-Index: AQHcJhH5Hi/XzGn7NEC5e+4cxcvJFLSWGoCAgAIWItCAAKwBgIAASuAwgAFOcYCAAGQ08IAEQCiAgAAQEACAAJXxIIAAmVaAgAAFRQCAABLXAIAASZgAgAAITACAAAe3gIAABICAgAACuoCAAALjgIAAnAEggACKBICAAR26cA==
Date: Thu, 25 Sep 2025 03:56:02 +0000
Message-ID: <IA0PR11MB7185239DB2331A899561AA7DF81FA@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <045c6892-9b15-4f31-aa6a-1f45528500f1@amd.com>
 <20250922122018.GU1391379@nvidia.com>
 <IA0PR11MB718580B723FA2BEDCFAB71E9F81DA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <aNI9a6o0RtQmDYPp@lstrano-desk.jf.intel.com>
 <aNJB1r51eC2v2rXh@lstrano-desk.jf.intel.com>
 <80d2d0d1-db44-4f0a-8481-c81058d47196@amd.com>
 <20250923121528.GH1391379@nvidia.com>
 <522d3d83-78b5-4682-bb02-d2ae2468d30a@amd.com>
 <20250923131247.GK1391379@nvidia.com>
 <8da25244-be1e-4d88-86bc-5a6f377bdbc1@amd.com>
 <20250923133839.GL1391379@nvidia.com>
 <5f9f8cb6-2279-4692-b83d-570cf81886ab@amd.com>
 <IA0PR11MB71855457D1061D0A2344A5CFF81CA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <1d9065f3-8784-4497-b92c-001ae0e78b63@amd.com>
In-Reply-To: <1d9065f3-8784-4497-b92c-001ae0e78b63@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|SJ2PR11MB8540:EE_
x-ms-office365-filtering-correlation-id: f2165e0f-1b2f-4933-8637-08ddfbe77252
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?RgHw0C4Ev4RuICjk3pOqigxmPBcmZGCRvoeUTYOojY4aurDjzi5dBTMTJP?=
 =?iso-8859-1?Q?/GA0Gc9tjzciVcJjESxXJtZLUEtFA+W+qMCdYP/g7yT6jf74MjXEhUV/UM?=
 =?iso-8859-1?Q?W6XoTUnBHoXJbuIDLoGyA/QFqtJ/OxK+syk58gTxsuNezgHDlPi5BwRmAb?=
 =?iso-8859-1?Q?pGRp2XpgaaYQ7bBOmCWJC0q/F6kUGUjdi/n6q+/tK8SFJa4cGeQTUSRw/j?=
 =?iso-8859-1?Q?AMTontIgsEl4UjS+cdyVn1CcM32oi/41DSL99F7fqYW8Di0IVcZ4IfQBDs?=
 =?iso-8859-1?Q?AljV8tApYJpr69oWJa9BYvAxMN5/a6kwV4N5SXgTtEJ/s/w9TNc3o+AyAX?=
 =?iso-8859-1?Q?01jJmDR0EfunogGxwjK2fIdT9h3zdvCRCqkJ86O4RWm8yxzeSFK9C++h7c?=
 =?iso-8859-1?Q?zkj69RUIVNVLdqD+lcqnwwedCNoYXMsw44VT7BV5BS9yb421/n6PkDowO2?=
 =?iso-8859-1?Q?2Ab/4CNFuQ0JOcQXNBcNciNzh6qiUn4YRw6c0c+erVurkbBxi1UeB1CFXZ?=
 =?iso-8859-1?Q?yuUQ2ywsNsS0vc8TCfdsVkzujMJmgbftNhkt4JWSD3/9OH5KDwJVaDSRkg?=
 =?iso-8859-1?Q?dAVol2qFmYG0xH7Ybhw4h+Fih7lkp0fwv9aJOsmiNiBdTaztZkcOUeZdg7?=
 =?iso-8859-1?Q?kmyO4jmYKBHq+3VrmXdoIUXXpwQ2CynneGtdRYH7PSnTEGlvx3XbIT+fA4?=
 =?iso-8859-1?Q?duvp7gdKprDCaaofOEGHMxEQP8uDdby4RAnSH+CHy55mPXzCSUUlxWzdjF?=
 =?iso-8859-1?Q?d72zqy4GxE8fdq7lHKWGdtwqOeKdpRTl/88wx2kZJ+Ie8EJeljeTWpYvdp?=
 =?iso-8859-1?Q?KwTf6yJRacC+uriMd8QSFEqGakqd7gCv3SOlcfcdSL4SklVrsB35TD8Fux?=
 =?iso-8859-1?Q?SyapdkGc8S1rxgPlgTzagSZtw0jgQJ//n9aWnLFHGmjBz8ZMB0+rfdDqPf?=
 =?iso-8859-1?Q?+msbjdUl+nDfqbdx7sN0w82NlNT9VsuMS7MQWaLoat2aC33W1CSc5/LKNr?=
 =?iso-8859-1?Q?TX/V5CckHpvkV+y3cMT371f491ln1K5hN7JLlcqgI0tpzVCEi3aNS0TU5t?=
 =?iso-8859-1?Q?vA2Yqal0jge3lVgODXf/4bUmTlaJijaZ+Jrap6vW8WMDluBu9O02oIri+U?=
 =?iso-8859-1?Q?Vzbaz3gWXgbw916eWb4HeD2DRpY4E6v5K0RVd/sporq7lCZKCDx1qq7nx9?=
 =?iso-8859-1?Q?VOh+oU9kzfhrzPBHzE1viQVlEtqkbve3w6FwMLzXOKyP0mxH3idH/MPGGf?=
 =?iso-8859-1?Q?0MH5JGx2zln7QFr7GG0nUp7VEJuQkgP77cUmj3mnBcAWAhBnG3Ql17ufEC?=
 =?iso-8859-1?Q?I67ER50Vnlggtq6bjldLLkJJG7DiRvYShOpA6tFFfOxAunCgXhHkwtOKc9?=
 =?iso-8859-1?Q?cevkcqyHSLMGnP/DuXkWDxJVTdFmRybxx4DjSomdVSrXc6C2Ta9B5N7M+e?=
 =?iso-8859-1?Q?SenbCao9pVhvpKjhWEnxCpMuK84rAK9oQCN250tHxGmxePQspNmbDTo4rq?=
 =?iso-8859-1?Q?oi+ks3fG3z+sh5ADBhKPMBpC1y8jdA4aAlxYRsHtabrT1LGLrbJ8heKlQJ?=
 =?iso-8859-1?Q?w+ccMOU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?1QEWxQqpkTbk0gREc0Bqhd61oJ2SzwTv9tteDOchrXBg3s5tWbFyfL0sqi?=
 =?iso-8859-1?Q?vmEIvlDk9WzxUJ25SlsFRKH0Ax/RPIzi9xwGLAm0wh1kqaBzCQaT5WCBbI?=
 =?iso-8859-1?Q?ak+lomM//HaiUUlxGjAxdEy/SgaHOO7XdkWI4UbBtRbDqcYyTdglBqq7Oj?=
 =?iso-8859-1?Q?Sq+8Of1xz5TGl9Gnt92f2qQMDbm3A1PdAlE/6k7s/yCspzk6BPP1yF/w2R?=
 =?iso-8859-1?Q?OYmwAZYX8qGBSQyIqjkXmDlu7JhYfnx4p2R+N7s4rKgtoINYIAyJ+9icHI?=
 =?iso-8859-1?Q?slwKtQmX4fiROiG9m901Fx+6Qa9+05RoN6SCDN3P/6AAYJEXKC70143dux?=
 =?iso-8859-1?Q?dpWGcqkjfpwDc+uJrPME3TeYazHtxE4NuvF9OMWcBXLAAgjGw/5O5lDBK1?=
 =?iso-8859-1?Q?soAfGumAhQDXPddUl17iszhofHKT5b4T7kTXhlsZjTVd50nWUBLXAf8GaY?=
 =?iso-8859-1?Q?IMJkzoqX8Ng7Tb5DTRO87raVS89tahQGbP7I7EwTf1vv4Ts+fJI5FRPXRL?=
 =?iso-8859-1?Q?9BThycKzZ0t5GJWcTsdq+3k5uZ8ZtNIye5yQWiGamA5IylNhAqnl3fm5Uf?=
 =?iso-8859-1?Q?nyVkjecfr5PvlqM8YSFinNfhTXxHQmD1wnPIfaEM2Jg52VTHwoITWdf7Hd?=
 =?iso-8859-1?Q?zlDejhZwBapAFmctoRH+J/MSUVtGBoJeEOAtUCQAQ9PjuTv22HuY+pFVQP?=
 =?iso-8859-1?Q?HAyOrDY22uCAxezk3jI9x3pN7E5l9EMQYWvWUe9fqZSB6jjHNDFCItUDHs?=
 =?iso-8859-1?Q?6RBQy9R+a5JmZhaqvau8GbEYhN9L0852rcfDwxpXfxU/oRlV6Tf0tTm4ps?=
 =?iso-8859-1?Q?vXyXWr/FAH94NdSlA9SIrMHYpTMZCm0BER2VPyCxkz3W8LqUiLgaZiykGh?=
 =?iso-8859-1?Q?zJ4i2b0AFbqOsAupu+TH/KeWMGti5/aVvh33j5jEgvSn68cgc3NM8V4nyj?=
 =?iso-8859-1?Q?a0D9ewMsU5sU8+z1Lxfr7rXh7Z7CRPcQEM674fVdlDN0cNjS1TcVPYf+EA?=
 =?iso-8859-1?Q?cA48T4++dqSvq3/Y1y3FUil38MFFuiYg0b/VcIp/srSFtuLdA2jWgQmDq+?=
 =?iso-8859-1?Q?S1Lvv+z5Zsjk/u3Ge1d+s0Qc6o59XbTSbXSLio9ZEbyl9lquTUklu7vzae?=
 =?iso-8859-1?Q?zAdSFVB7LaVYNhNfKLo9kP/D0v6NeSRy5OlcxLGWo4ZR37fWxY2InF/hGF?=
 =?iso-8859-1?Q?tpQJ6IEe/vAwPbXEdw/1C0HAS9eQoB+BfqPmLX7FNTurNNBE+UxZi25WWI?=
 =?iso-8859-1?Q?dJjzx2y2X6/lJ+Saa00FWgw/i3z/ygtNoVJPUx89U9uOwE8lVON07/2nWG?=
 =?iso-8859-1?Q?eWnyG0wPn5JWF1H1yrig4UnjvFKdPYCoCcXcvucp9PxDj3MllceO+ZJWJL?=
 =?iso-8859-1?Q?g2lo6kzB/y0vlxeoHXz9BtNkVlYq4A3wn+k03a+pLY2m84IHQLOHXXGByu?=
 =?iso-8859-1?Q?4CG8rA7SB0uBf5zbX1wNsjw6XAGA4fT5W8Aw8AAlsZ+O0Q7scBAG3HTxhf?=
 =?iso-8859-1?Q?4HWZluWdBgaEOT5LRFUng3ij6pzUOlRjAP1lZo5xC0QZCUb8tLuG4/yGnX?=
 =?iso-8859-1?Q?3LJNfvuf3zlZ2CCPKl3O89ZlWJ5z6lzmlUoJLWEr4XNuSWdRQcBHbA5XCV?=
 =?iso-8859-1?Q?OIG/jTIIqis8v/ckTNjjHwmCViCvB+Y7Kf?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2165e0f-1b2f-4933-8637-08ddfbe77252
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2025 03:56:02.9913 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ML7WzhMXKk5xmKfjDEjsVRC9T32mDfyxf+KhR+Tn1vlvL6LECn4VFUW/Fzp/a1Rd4VndwnUw/pKC/jWyTVpiTP+ujBr6n+q+M3PhIxgzZYk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8540
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

Hi Christian,

> Subject: Re: [PATCH v4 1/5] PCI/P2PDMA: Don't enforce ACS check for devic=
e
> functions of Intel GPUs
>=20
> >>
> >> On 23.09.25 15:38, Jason Gunthorpe wrote:
> >>> On Tue, Sep 23, 2025 at 03:28:53PM +0200, Christian K=F6nig wrote:
> >>>> On 23.09.25 15:12, Jason Gunthorpe wrote:
> >>>>>> When you want to communicate addresses in a device specific
> address
> >>>>>> space you need a device specific type for that and not abuse
> >>>>>> phys_addr_t.
> >>>>>
> >>>>> I'm not talking about abusing phys_addr_t, I'm talking about puttin=
g a
> >>>>> legitimate CPU address in there.
> >>>>>
> >>>>> You can argue it is hack in Xe to reverse engineer the VRAM offset
> >>>>> from a CPU physical, and I would be sympathetic, but it does allow
> >>>>> VFIO to be general not specialized to Xe.
> >>>>
> >>>> No, exactly that doesn't work for all use cases. That's why I'm
> >>>> pushing back so hard on using phys_addr_t or CPU addresses.
> >>>>
> >>>> See the CPU address is only valid temporary because the VF BAR is
> >>>> only a window into the device memory.
> >>>
> >>> I know, generally yes.
> >>>
> >>> But there should be no way that a VFIO VF driver in the hypervisor
> >>> knows what is currently mapped to the VF's BAR. The only way I can
> >>> make sense of what Xe is doing here is if the VF BAR is a static
> >>> aperture of the VRAM..
> >>>
> >>> Would be nice to know the details.
> >>
> >> Yeah, that's why i asked how VFIO gets the information which parts of =
the
> >> it's BAR should be part of the DMA-buf?
> >>
> >> That would be really interesting to know.
> > As Jason guessed, we are relying on the GPU VF being a Large BAR
> > device here. In other words, as you suggested, this will not work if th=
e
> > VF BAR size is not as big as its actual VRAM portion. We can certainly =
add
> > this check but we have not seen either the GPU PF or VF getting detecte=
d
> > as Small BAR devices in various test environments.
> >
> > So, given the above, once a VF device is bound to vfio-pci driver and
> > assigned to a Guest VM (launched via Qemu), Qemu's vfio layer maps
> > all the VF's resources including the BARs. This mapping info (specifica=
lly
> HVA)
> > is leveraged (by Qemu) to identity the offset at which the Guest VM's b=
uffer
> > is located (in the BAR) and this info is then provided to vfio-pci kern=
el driver
> > which finally creates the dmabuf (with BAR Addresses).
>=20
> In that case I strongly suggest to add a private DMA-buf interface for th=
e DMA-
> bufs exported by vfio-pci which returns which BAR and offset the DMA-buf
> represents.
Does this private dmabuf interface already exist or does it need to be crea=
ted
from the ground up?

If it already exists, could you please share an example/reference of how yo=
u
have used it with amdgpu or other drivers?

If it doesn't exist, I was wondering if it should be based on any particula=
r best
practices/ideas (or design patterns) that already exist in other drivers?

>=20
> Ideally using the same structure Qemu used to provide the offset to the v=
fio-
> pci driver, but not a must have.
>=20
> This way the driver for the GPU PF (XE) can leverage this interface, vali=
dates
> that the DMA-buf comes from a VF it feels responsible for and do the math=
 to
> figure out in which parts of the VRAM needs to be accessed to scanout the
> picture.
Sounds good. This is definitely a viable path forward and it looks like we =
are all
in agreement with this idea.

I guess we can start exploring how to implement the private dmabuf interfac=
e
mechanism right away.

Thanks,
Vivek

>=20
> This way this private vfio-pci interface can also be used by iommufd for
> example.
>=20
> Regards,
> Christian.
>=20
> >
> > Thanks,
> > Vivek
> >
> >>
> >> Regards,
> >> Christian.
> >>
> >>>
> >>>> What Simona agreed on is exactly what I proposed as well, that you
> >>>> get a private interface for exactly that use case.
> >>>
> >>> A "private" interface to exchange phys_addr_t between at least
> >>> VFIO/KVM/iommufd - sure no complaint with that.
> >>>
> >>> Jason
> >

