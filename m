Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD51F965C19
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 10:52:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD52310E919;
	Fri, 30 Aug 2024 08:52:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bEyESFI7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C95AB10E911;
 Fri, 30 Aug 2024 08:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725007928; x=1756543928;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=Cks3gm7Fcz0MhtE91jAqVB2mBg05AKXFRd4xMlWFEp4=;
 b=bEyESFI7J9+5WEttN6LCft/hn8PtOsx4/D/t4zOw3LGU23X9U3Lxc79+
 ywUTcUCzmblDVpQ6AZuSbPahyH1HBwe1QwyQnrYls2RONKS5eAa3vicYi
 Fjg34ThXDPJEC6bonxuzsOmddmWA/M+WVoq7NkDfwqBusEjo+iswEP7Ze
 Mw2kYqi7P2RV70LSg8DlvZ7xoVzsmdI7L/ZYIdYJbeiqQYKYSAEp75C9N
 yZgTGJPQmMBcymenWWg2570WXOSaGPvkRlUnwZHpwGlI2JQ0YVVltlhTh
 hdRSoQa2+m8Oy/pBwAFG9IvC2BvSm8dLubqu0Q/JRes4lsH8LYx6UQ11f w==;
X-CSE-ConnectionGUID: s56LGxp7RKqhYwjzDKqtww==
X-CSE-MsgGUID: BknZBpxdTdqH/KyMtKUDbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="23156516"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; d="scan'208";a="23156516"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 01:52:07 -0700
X-CSE-ConnectionGUID: AdTE+flSRHyDJm/3B1Y4Hw==
X-CSE-MsgGUID: 4FKoybXqTDOJnmnDWhrFOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; d="scan'208";a="64334525"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Aug 2024 01:52:07 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 30 Aug 2024 01:52:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 30 Aug 2024 01:52:06 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 30 Aug 2024 01:52:06 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 30 Aug 2024 01:52:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uTelZA8IXEAOS6YhXIPVsV7GzpvaIau1yyY72/D4wyfcBSktm1QTQ+AhCmtbKe9sdcyh6maZ9Bx//ynquut0jD6E7Yh5snnea8OKQf2SIsru5S69YRyWR4A4Xp/NMwZMNZuZLJg1dOQZEYZo/raNhudrzaX6xjdSt/Re3VT+R0QgnLQdVN11q+4HAamFgFKhB6/Kl8JiLrCmRdzCpt2euBlIsDS3j87Tr/20IMfGUEpuYQBYINDaUF7nrzrvuJ9gtZRiYSpRijHQBy37qkmT8UjFCwooN5JDWmsMAuo1P2BURbeOJRUgi/Hu98F8VsE7/RSug2YcJmF8xBjaPQL+2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SPSuj8Dkbz8Irf0sU+eEOl/OZg2jcSuN82aHvXTUFDc=;
 b=POrAiT1u3V5vD+SWHB4pOzzd1JGB6FIvgoLEBqp4xLwHzhOZYmmzVqano0e1A/npvgTKxI6HQCzrz4/1xuMz89E7NFTEfUtV2uu4FgFGHbvOyBkyu8ZM5EbMKr4e2r6+id47I9jtHjk95JqdADXzxUJrQ0et1C/s4meVUMQStCA5SIR7yhpmoPy3B8PXtv8ypgsaJkNTR4GvsGhQp5BROtIerqkqfQp1imPByBKK/03KT/rPp/RILo7jSN+gdjDMKU/MEEvPBpnoqJwepm0F2TXLJS/lroFJewiNZcJmliawLKkQjwwkWfcMubvudx2s3mMr2sl0McmkvmGsSAhg4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by CH3PR11MB8153.namprd11.prod.outlook.com (2603:10b6:610:163::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Fri, 30 Aug
 2024 08:51:59 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%7]) with mapi id 15.20.7918.019; Fri, 30 Aug 2024
 08:51:59 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "linux@weissschuh.net" <linux@weissschuh.net>
CC: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Kurmi,
 Suresh Kumar" <suresh.kumar.kurmi@intel.com>, "Saarinen, Jani"
 <jani.saarinen@intel.com>
Subject: Regression on linux-next (next-20240829)
Thread-Topic: Regression on linux-next (next-20240829)
Thread-Index: Adr6t/1yKND9GWP8R8qrwzhk2p2b7w==
Date: Fri, 30 Aug 2024 08:51:58 +0000
Message-ID: <SJ1PR11MB612925C1C533C09F8F62F7CBB9972@SJ1PR11MB6129.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|CH3PR11MB8153:EE_
x-ms-office365-filtering-correlation-id: 146bf1bf-cb2c-4dbf-42c4-08dcc8d10228
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?PA/pIrfd/VI3Q5oIgAE3UCdaFX0OWRNaG0MyDeI/rfhaug54g957zMyBoE?=
 =?iso-8859-1?Q?vdw/en8RMCsYDxCMTq9BBngTsWflm87l1vs5VMI5xRj3Dqb/klkVTe3sgs?=
 =?iso-8859-1?Q?zac/MO0dAN8iNydIClZ501iFn1fEEvJGcMRhljK0RBgswaQR6K3/dhZm05?=
 =?iso-8859-1?Q?Xvg0PHzhLPEwPvsOkyCMdnVNt/jW3vorMizKB/jkzVcR+S4FQJvBqhA2Ke?=
 =?iso-8859-1?Q?CC/R8+xpxyaclzuv08rMgleTeWxBkQ+EgOpbVcIIAHs5y2E1apGG4ZeBQ1?=
 =?iso-8859-1?Q?0ESyCMP2Xg1fUzZlpLuVZgwegjvLrrCvDQb1mdoYy8xp7vrddclpDq9u1a?=
 =?iso-8859-1?Q?CaUMobqN4azaRJPK0YnCIDpOojjh69frqKYggYJeNMyVKdqnFiZbeSsQkT?=
 =?iso-8859-1?Q?fBD76pRO2GyTwJO0FBCNw9LrxRP0ySefWbhY9DTDVjxxbSpr3q9DV0NlgJ?=
 =?iso-8859-1?Q?rGNIA1O06UTaO0/eiIIF4pj00AJTfM0uy6ASdMPSwhuiEwrwzIh76LT9oE?=
 =?iso-8859-1?Q?YhoMNw8fYeWdAUwOIv5I0eOgnVreOVR5K/USv4SMUYvtynjx8cpy8EoDRX?=
 =?iso-8859-1?Q?jeG6ipWlpy3HwJwemjgNYwTyOPEV0cNKkVwiw+Pb3zZlSpn9EOAbI3fm/L?=
 =?iso-8859-1?Q?qqna9dKdlHA81F6rEl1Cx/1+vNNGKoiMBOgPNpmvD6/+hFa5LMrSh6jkQ1?=
 =?iso-8859-1?Q?ss9bxNjvUussnaU6A4cA/q3lHDhWGXGzlRtNQmHSsem9O81P/CsstqCVwC?=
 =?iso-8859-1?Q?c0GJY8MqNt7BSFQQlmRg2fCol/K1cMvTQOsULOnADnB6qCiBcLOOvx12f8?=
 =?iso-8859-1?Q?KyImEy86CBCPBwkYgrNWVmqM30hEMuxcHZbTL5y5ic3ieQ3z3UEvu0RkAQ?=
 =?iso-8859-1?Q?IzauGnCv9O2BlcuIoGyyHnBSllaQ1BVK95JNPUInwIxbz9N19Fou8efbOp?=
 =?iso-8859-1?Q?UKtic6ztxRNehPZxBHF5ea5AOdAK2mh+sDtmlpbrEJ4AS36xr3hWD7Sll+?=
 =?iso-8859-1?Q?FtXtS0BGjOJs5Lo+oeB237cg9DLaMvNYdVd1nwuXxQBFPHmq/VZj6QzwzJ?=
 =?iso-8859-1?Q?gFWSljK2WdqbYL6K+VHzIsi3GEiS1tHSP5T0Ixauh/o5Cy5X08qNluIfvx?=
 =?iso-8859-1?Q?OR06rws5wUT+v/cBx0iVduW9ZdGxADnCpEDeswSCeYKiRs2ZOSHnepP2mf?=
 =?iso-8859-1?Q?DJXoi/PyDy6Fe4/fBUyfizSreZjBF56UhrqKL8chME5lozFbD0uWgk12MA?=
 =?iso-8859-1?Q?QkpfSwIoQJJuy4i9JN7VMtM1L8i/zJZDC1JZV2R2XRffbsa2tGgRJ9i4q7?=
 =?iso-8859-1?Q?aUV9xd7N55lN4ifjX66MntL0D8oWnAiy6/YLZqVmeWF8YnkfI3HPxco+pC?=
 =?iso-8859-1?Q?TPETDq4c3D7SX0M3ySliyuJJCvrJWaxOJrvFu6Tl42CpCgKwhwqLY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?0vujmC7czsfgYfXPFWXXMrmtIhe3lSbfO+ymLUSjD1mxKA65Tp+7JDrTCP?=
 =?iso-8859-1?Q?yRByZzvZvvM9DfOjAJWw85X0Hgtz+aJVZ3V2CkMsZpZPuFONk6nI14hcwd?=
 =?iso-8859-1?Q?lNUFhCGRPuk42LRlB0FSuKw82TYAMDMRATSazkxUPt7aKvvE+FSCt2BQrU?=
 =?iso-8859-1?Q?i0OdcDKTjStjlMfD6u0G71bNpWRbisobIj2Bf7eGZLIIkeb7sDRU4XINcq?=
 =?iso-8859-1?Q?kJpMrYfaH/GapQ+7Q/0PWhitNkE7YsI8tvPho3EcZEfPbG0yP0xbWq/dPI?=
 =?iso-8859-1?Q?DOwryfjBOR8wyMoIhM5fxRczB77Ig2IIDvE6CXogv5XX0fyvC9lYEgNYKZ?=
 =?iso-8859-1?Q?AqhDXHJD2RdGKtmbjhSptvz83QEqDZVKY6mZOs2aAxoP1z8hnslN8G/qUc?=
 =?iso-8859-1?Q?aYH0zxHNr4TKgkMptGl7uuqafwwy8Fgem0FevUCaDBpMZfeVum9oh1LePx?=
 =?iso-8859-1?Q?AMu/CDahCjjwWtQEmT2H5MJykRhVER2XWWyuYfYatNLgxusdxfCed/p+Nu?=
 =?iso-8859-1?Q?dYf9iaWo+g5yiMmzNXgeLcAFPzKZiD38eIGLG3MUkANltx6IKmodO/JXH7?=
 =?iso-8859-1?Q?sx5VsQB234fpqVqY1+OxrkZbX23JLKQ7fy7tlvveqD4D1U1lzM62qVch7Q?=
 =?iso-8859-1?Q?aQXS+FHEbNi9JS+RMg1IvB2Wx+dz9bwxrlmr7sjBw8t15Z7KolPSCV1Iom?=
 =?iso-8859-1?Q?zyhrQTZZKGY8OfL106NQBI1cSlOgDQ6QrQ2XwWIBuFpzXWlqNalU/yAVAI?=
 =?iso-8859-1?Q?7RlXg+gvV5mPVMbB2Pn38YHAkuf5Kg5g1OKGMPbGkD8E2Aaczr8eIBTPBQ?=
 =?iso-8859-1?Q?Mbs5sEEGphUy8oo1RRCx7OMd84AMGs9Uxmt35S18SSjnTydhQqCVSR1rwY?=
 =?iso-8859-1?Q?48kP1IhLIhRcypR2CBsyYqZCkyXdDrtiiVVZpN5bq/Ynt/s7pIQIA6K5K5?=
 =?iso-8859-1?Q?n/ZgXuW+fppyeEe270hXPFII2SyRA+Uwem2M5CJ2MQsVtSJRSiKzua6RdH?=
 =?iso-8859-1?Q?n6/Hs96cBOJ1jLEVUhLDFIaWzU5/6Ox5jKnh90qYs+s3f9TsQCNISZaA3e?=
 =?iso-8859-1?Q?tVe7BZmTJDI/XZ+DT2+PMIVf6xNanaXNdjLa9zsReixzXxIbQVTYlcFs2W?=
 =?iso-8859-1?Q?o0XiefGkYPeaSY8ukzp8WvS7Hdn9lywpzos6/p9nryzEfmYIvcoYAgcRx/?=
 =?iso-8859-1?Q?MHxYChZYryZXapOGZe9km1DHKd9z0EkiPyxAvYbnqnoQ17WitXnUf3eaCr?=
 =?iso-8859-1?Q?k3VNObsX38JUQxl5nI4/BUN61S2l/W68+/Ifs++D4FLZbqLG5OYkLeuD1o?=
 =?iso-8859-1?Q?S1J/AvnKRgsJRQfbpA4d81qt3XO5TVmqI3pviViupFQoywKhfiEJdSIpda?=
 =?iso-8859-1?Q?40COFscuvV/0jF92JP6hG3ypcf/lsZ8+CubWHt776RnyAeHdA4snKFzisk?=
 =?iso-8859-1?Q?EecaT3A5V2pnXiGiKEC/79bsmyyk8kBDqkIRM5IIT3u3e8HwUABXakWRMM?=
 =?iso-8859-1?Q?lce46BskpvuWu9azsULLArmy3s79E9hdLJjwlyyQoZRXTkUGm5/cNW+Yo0?=
 =?iso-8859-1?Q?1/sQ8fX3eTONvWl3ifDNXzsjgvmhKGMVlWz0zljTGbBrJwL2fgs2DJwlpv?=
 =?iso-8859-1?Q?skvt6fIQBqUGR4BMn9DY5SqI2SnYK0IedaaJxtb1maAvivl/oRraEr1Q?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 146bf1bf-cb2c-4dbf-42c4-08dcc8d10228
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2024 08:51:58.9363 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gE9zBogjB5ZbubbT6F3goh+oN0zcMWyoIuoRnzZrYqXvqNcr2FQZXhO5nMzPQ3QOuR9sAeOauwzG7yGHETrKCzq6uwBXfYltloZLCSxI61w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8153
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

Hello Thomas,

Hope you are doing well. I am Chaitanya from the linux graphics team in Int=
el.

This mail is regarding a regression we are seeing in our CI runs[1] on linu=
x-next repository.

Since the version next-20240829 [2], we are seeing the following regression

```````````````````````````````````````````````````````````````````````````=
``````
<4> [28.903830] ------------[ cut here ]------------
<4> [28.903835] WARNING: CPU: 10 PID: 855 at drivers/video/fbdev/core/fbmem=
.c:467 unregister_framebuffer+0x1f/0xd0
<4> [28.903840] Modules linked in: i915(+) prime_numbers i2c_algo_bit ttm d=
rm_display_helper drm_buddy cdc_ncm cdc_ether usbnet btusb btrtl btintel bt=
bcm bluetooth x86_pkg_temp_thermal mei_hdcp coretemp mei_pxp wmi_bmof kvm_i=
ntel r8152 mii r8169 kvm video crct10dif_pclmul i2c_i801 crc32_pclmul ghash=
_clmulni_intel realtek i2c_mux mei_me i2c_smbus mei intel_lpss_pci wmi
<4> [28.903870] CPU: 10 UID: 0 PID: 855 Comm: i915_module_loa Not tainted 6=
.11.0-rc5-next-20240829-next-20240829-gb18bbfc14a38+ #1
<4> [28.903872] Hardware name: ASUS System Product Name/PRIME Z790-P WIFI, =
BIOS 0812 02/24/2023
<4> [28.903873] RIP: 0010:unregister_framebuffer+0x1f/0xd0
<4> [28.903875] Code: 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 55 31 f6=
 48 89 fd 48 c7 c7 60 2d 7c 82 e8 da aa 5d 00 48 63 45 04 83 f8 1f 76 69 <0=
f> 0b 48 8b bd b0 02 00 00 48 85 ff 74 09 f6 85 cc 02 00 00 01 75
<4> [28.903876] RSP: 0018:ffffc9000250f840 EFLAGS: 00010286
<4> [28.903878] RAX: 0000000000000000 RBX: ffff8881066c4740 RCX: 0000000000=
000000
<4> [28.903880] RDX: 0000000000000001 RSI: ffffffff82440d5a RDI: 0000000000=
000000
<4> [28.903881] RBP: ffff8881066a8800 R08: 0000000000000000 R09: 0000000000=
000000
<4> [28.903881] R10: ffffc9000250f840 R11: ffff888114940040 R12: ffffc90002=
50f878
<4> [28.903883] R13: ffff8881066a6810 R14: ffff8881066a6c20 R15: ffff888106=
6a6be0
<4> [28.903884] FS:  00007f8a936adc40(0000) GS:ffff88885f280000(0000) knlGS=
:0000000000000000
<4> [28.903885] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
<4> [28.903886] CR2: 00007f8a95eb3f70 CR3: 0000000117808000 CR4: 0000000000=
f50ef0
<4> [28.903887] PKRU: 55555554
<4> [28.903888] Call Trace:
<4> [28.903889]  <TASK>
<4> [28.903890]  ? __warn+0x91/0x1a0
<4> [28.903894]  ? unregister_framebuffer+0x1f/0xd0
<4> [28.903896]  ? report_bug+0x1f8/0x200
<4> [28.903899]  ? handle_bug+0x53/0x90
<4> [28.903902]  ? exc_invalid_op+0x18/0x70
<4> [28.903903]  ? asm_exc_invalid_op+0x1a/0x20
<4> [28.903907]  ? unregister_framebuffer+0x1f/0xd0
<4> [28.903909]  release_nodes+0x2e/0xf0
<4> [28.903912]  devres_release_all+0x8a/0xc0
<4> [28.903915]  device_unbind_cleanup+0x9/0x70
<4> [28.903917]  device_release_driver_internal+0xce/0x140
<4> [28.903920]  bus_remove_device+0xcf/0x140
<4> [28.903922]  device_del+0x179/0x3e0
<4> [28.903925]  ? pci_conf1_read+0xa3/0x100
<4> [28.903928]  platform_device_del.part.0+0xe/0x70
<4> [28.903930]  platform_device_unregister+0x1b/0x30
<4> [28.903932]  sysfb_disable+0x4c/0x90
<4> [28.903934]  aperture_remove_conflicting_pci_devices+0x25/0x80
<4> [28.903937]  i915_driver_probe+0x6f3/0xdc0 [i915]
<4> [28.904017]  ? lockdep_hardirqs_on+0x7b/0x100
<4> [28.904019]  ? _raw_spin_unlock_irqrestore+0x41/0x70
<4> [28.904022]  ? device_id_in_list+0xaf/0x120 [i915]
<4> [28.904098]  i915_pci_probe+0xd5/0x200 [i915]
<4> [28.904171]  pci_device_probe+0x95/0x120
<4> [28.904174]  really_probe+0xd9/0x370
<4> [28.904177]  ? __pfx___driver_attach+0x10/0x10
<4> [28.904179]  __driver_probe_device+0x73/0x150
<4> [28.904181]  driver_probe_device+0x19/0xa0
<4> [28.904184]  __driver_attach+0xb6/0x180
<4> [28.904186]  ? __pfx___driver_attach+0x10/0x10
<4> [28.904188]  bus_for_each_dev+0x77/0xd0
<4> [28.904191]  bus_add_driver+0x110/0x240
<4> [28.904193]  driver_register+0x5b/0x110
<4> [28.904195]  i915_init+0x23/0xc0 [i915]
<4> [28.904268]  ? __pfx_i915_init+0x10/0x10 [i915]
<4> [28.904338]  do_one_initcall+0x5c/0x2b0
<4> [28.904341]  ? __kmalloc_cache_noprof+0x21e/0x270
<4> [28.904344]  ? do_init_module+0x1e/0x210
<4> [28.904348]  do_init_module+0x5f/0x210
<4> [28.904350]  load_module+0x1d4e/0x1fd0
<4> [28.904356]  ? init_module_from_file+0x86/0xd0
<4> [28.904358]  init_module_from_file+0x86/0xd0
<4> [28.904362]  idempotent_init_module+0x181/0x280
<4> [28.904366]  __x64_sys_finit_module+0x56/0xb0
<4> [28.904369]  do_syscall_64+0x66/0x140
<4> [28.904371]  entry_SYSCALL_64_after_hwframe+0x76/0x7e=20
```````````````````````````````````````````````````````````````````````````=
``````
Details log can be found in [3].

After bisecting the tree, the following patch [4] seems to be the first "ba=
d"
commit

```````````````````````````````````````````````````````````````````````````=
``````````````````````````````
commit c2fe0480cd77526411707da46d72a44d9671c9ad
Author: Thomas Wei=DFschuh mailto:linux@weissschuh.net
Date:=A0=A0 Tue Aug 27 17:25:15 2024 +0200

=A0=A0=A0 fbdev/efifb: Use devm_register_framebuffer()

=A0=A0=A0 This simplifies the error handling.
=A0=A0=A0 Also the drvdata slot is now unused and can be used for other use=
cases.

=A0=A0=A0 Signed-off-by: Thomas Wei=DFschuh mailto:linux@weissschuh.net
=A0=A0=A0 Signed-off-by: Helge Deller mailto:deller@gmx.de
```````````````````````````````````````````````````````````````````````````=
``````````````````````````````

We also verified that if we revert the patch the issue is not seen.

Could you please check why the patch causes this regression and provide a f=
ix if necessary?

Thank you.

Regards

Chaitanya

[1] https://intel-gfx-ci.01.org/tree/linux-next/combined-alt.html?
[2] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/com=
mit/?h=3Dnext-20240829=09
[3] https://gfx-ci.igk.intel.com/tree/linux-next/next-20240829/bat-rpls-4/i=
gt@i915_module_load@load.html
[4] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/com=
mit/?h=3Dnext-20240829&id=3Dc2fe0480cd77526411707da46d72a44d9671c9ad=20
