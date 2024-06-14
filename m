Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 840FA909354
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 22:22:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6A3110E2AB;
	Fri, 14 Jun 2024 20:22:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L6sLxe8G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35FEB89A94;
 Fri, 14 Jun 2024 20:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718396518; x=1749932518;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=I2IqaxcU/YWipFWUA2hA8U9Ho37ALiRsJ+aQ1vTXyjM=;
 b=L6sLxe8GG1j2mB+oE7PZgJrxL9pE1YI8NPpFPTGLWSxweZ7/jFbpDg4p
 T4Z4aEC2JQYtugWriCHZoavUswlAULTcrNaE3PrHBY3bn72xFIAVExVz0
 Dze/gw4QM07McEUXF0F5Qv+4Fw1guSjSKNWP2FFXfOqGekSRf8vZsnvnF
 fOXzk7/rbx41H4KhLwZ80ovf0Ad5JQgQ+DNRMc8PBMxIVRkT0Ue/Nk/TA
 aKXrcW1XjgvdH/eI89pKb5geZyJ+2H5m9GCWfz7x9Lgss7BnfYzIQUJS1
 7MUy74FKuo+cH7KPZWKUYGi9v7NhzC2a7Dltv43Er5LnLRDucvegyQqdf w==;
X-CSE-ConnectionGUID: 2ewLoKt3RUaouBADjbVBHw==
X-CSE-MsgGUID: pY+NuQ3ATJKkggpNUVaKcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="15270340"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="15270340"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 13:21:57 -0700
X-CSE-ConnectionGUID: kA2GvyzKQkWfufWhRwK8tA==
X-CSE-MsgGUID: 3YOajmC7Q+6Gaf5ux01YlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="40564048"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Jun 2024 13:21:58 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 14 Jun 2024 13:21:57 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 14 Jun 2024 13:21:57 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 14 Jun 2024 13:21:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z3Q+lurXLr5Ku7SSsYiPjiwWQnkyW6Y9nqILaZYcS0MXUanXeyxkdDDGTLta+y+oRLvqUTMzYZsKTG+2GA8EbBDTFDTutTC7FlMo2ux+D6JT7w3FZ9pFB0YODZg0gjFPwMG4pSO/sESnvsIsQWT8wNl+hfY8LeTiuClMXsoEY5279l4SI1Nfkl9tCWk1o+ZAcgMnkHQId0irBC8AXeXKv4ToL3VT68M78s7bEhafi9YmLdZG6nL/l0Jfe2kzNnYxqOyqhM5LrhJ8CI9GR3dGIA07Q/wKfHt6wS1t5sAPoa4ccTwNXq0FJaW1SFrfeEYXoXwxw0ki3COyi4QZd+nHGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CGWqVnUyxnN89MjPG4jAa/LlJLGqTJ29TIBGyTtB1CU=;
 b=kHzJvX6IdhquhugbiE7oDY42mnf4wtojTydOfVrTsYnpH8EbBgQ/QQwOwasFJ+60uD1tkHqy2XRhefLzSF8wSHUrcjei9LdGcTx70b7Px/9glDR3UwSbpmZN4Sbnn4qDF3dFwvQU0JhofLo5SwScru4GxsvLPnp8KCR+FHc2sOxfe6XrRAiwzAL5TDWYpnmNSVxX+BQJykYd3qvs/X5HwLDQZu9tYAwlI2w5nnoODtfg0tC3cgdQwLp66nNEhC8Yty7lQYSzXvB+ELPCtf3zG0tBr1BFqHVgULwN9ttsgjP23bV3VqbqdW5T31IbLXTcBqJMcIoRfP6p/RFTMqsOXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SA3PR11MB7435.namprd11.prod.outlook.com (2603:10b6:806:305::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Fri, 14 Jun
 2024 20:21:46 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.7677.026; Fri, 14 Jun 2024
 20:21:44 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
CC: Andi Shyti <andi.shyti@linux.intel.com>, intel-gfx
 <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, "Harrison, John C"
 <john.c.harrison@intel.com>
Subject: RE: [PATCH] drm/i915/gt/uc: Fix typo in comment
Thread-Topic: [PATCH] drm/i915/gt/uc: Fix typo in comment
Thread-Index: AQHavm6e/jycwN/fd0WB4vYJ6UVqzLHHYHBAgABJkQCAAAnPoA==
Date: Fri, 14 Jun 2024 20:21:44 +0000
Message-ID: <CH0PR11MB5444D500A9869FF77ADB0CC3E5C22@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240613222837.552277-1-andi.shyti@linux.intel.com>
 <ZmxgEZe5ztpBzUYb@ashyti-mobl2.lan>
 <CH0PR11MB54440CF4CB01809F00A1B0D4E5C22@CH0PR11MB5444.namprd11.prod.outlook.com>
 <Zmyd5O5LJU-RvcUD@intel.com>
In-Reply-To: <Zmyd5O5LJU-RvcUD@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SA3PR11MB7435:EE_
x-ms-office365-filtering-correlation-id: 174af208-2218-4390-9cf6-08dc8caf9bc8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230037|366013|376011|1800799021|38070700015;
x-microsoft-antispam-message-info: =?us-ascii?Q?nF2tfpNdAUGfmBaYEQcfdCy0bjt4JgeXaJPq/UYY41tqqJT7d4cwQRaE/Cic?=
 =?us-ascii?Q?hCv/WFjiTBbTyfDM05OQ7OROcSe3IRn8An3oyvLsAAQAG4ul8wWuu3msxBN2?=
 =?us-ascii?Q?TNP1TFNaMh9ZMINibn2rBitnHopAJ76zXxT34tfb4MUCEco0k2kwJaDAlQcN?=
 =?us-ascii?Q?cXWIOcwJfOocta/0IS0Maw5w/MLyTUT87VMQy3pEnrer5mrnTw2CgGRxSt6J?=
 =?us-ascii?Q?Lo4zdZsst/zPtT1R99yD+r8I6pvGlxpQDIJnTy43pUi5eshycFATkyAgSzUJ?=
 =?us-ascii?Q?6iY0FOImIwGQuH73bPhWPEMS5pZxYBEPf5v8SP7RhBlOOCjBWZ2VRaGtpWKE?=
 =?us-ascii?Q?CZpg0oqektrTEIZa5M7hkFjUxFd/5ts6zCIZrdgV7HIa7Y1hiReNxYiHb6EA?=
 =?us-ascii?Q?qwBqK1RTVfZcSmln5cIyG0gwVBvsh9xLr7sNkKgQjxKVkePvSpSLRWUjoCqf?=
 =?us-ascii?Q?Db9auf6DgH60FLNRMg7OMbIdBAM2Q1cbpu8yTiGD7BjZPGUNMivuh4h6bHlW?=
 =?us-ascii?Q?37WczKxnaq1ah9ROD8Qo9kPPJPtu9EHuV9MHED14AGLL1VafvEd9Jwv4CRzs?=
 =?us-ascii?Q?GXATvE23SIo8VF+FdPGlgqBO//rr/AJXpNRqPavXJTZE1XfQN12H12tdDigD?=
 =?us-ascii?Q?48zY1p0OIfh2F9AfdtBD9DLfpyex4rM8oZgG9ZZopbv+MqjenSwyj0xxD6QH?=
 =?us-ascii?Q?qN0KRryWWulvS9FaNxcp1jdzUBjjA+VYF3/3z+L5Us7E2A+QxFUXOP6BiB8K?=
 =?us-ascii?Q?f147E2FO3IJCNctIbQBrn4IkudsFG0lQN1dbkWPxRfblJ8hg2BonLUsax09h?=
 =?us-ascii?Q?8z+7CfvxqMPzmqDgomHMgz/2uKfEYvWcqiO48Rn9d1gRAs6l+Z4/QVXq5PTZ?=
 =?us-ascii?Q?eYQW9kv7lgskkpIl4Y4b5jzMACedStti1SvFsKIWoSFJg1HF2yXVh9oNVS16?=
 =?us-ascii?Q?RAmULiEdkbW1ArbAHdqA6RQ5jwieLsOozA31uti1FxCjGx5GnJ+gR7XDCU2Q?=
 =?us-ascii?Q?I6mLlREXGJtMVXwloFAA1raZpOb280VC9N4iPacQTQiSmcyPpu1J7ozha/KV?=
 =?us-ascii?Q?+OSylAhNFc3sY8pxP74P3ADNygW0yZ+Pql99pVi8PWKs/xkFiyfJBlYccqlY?=
 =?us-ascii?Q?76fn1PpPXzgd+2y5jOBzZkrZolhNzJ/VILHz2/MATBHq+wZimALpyKwecQmp?=
 =?us-ascii?Q?ohpftWBvSKq8PZW8sSNamuQ0Pq2qalhMjhtMp2KCmkcw77YvTejZZ2QNq23s?=
 =?us-ascii?Q?TVQWB81/er23SN6KfV/uYdGdjoguqUISUkQ6DxQqlH1mJ1iyE5QBIDqN5oeG?=
 =?us-ascii?Q?cbPLsYYoDZgVQr9T2hAmySQK7dvsGOJbarfyQK1QxfFP0NEmB1LZqBOfb5fw?=
 =?us-ascii?Q?cG03WF0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(1800799021)(38070700015); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6LET1WN1YfburfxBaPcaBvabgrYey1yTXAmraYVZlX0+a7XsbadVktpS6VWg?=
 =?us-ascii?Q?DjROjzOmmrys14ztTmO95IlEW0aqBsBXcsktNFJLrLYMhVeXrTQjx22i+SoH?=
 =?us-ascii?Q?2YKPtbKvN7VsW44KfRXYZJXAVMRsso+ClvA7UgAAkiBPAYYiL1/avM8s24RK?=
 =?us-ascii?Q?GBIf4hWSVLkk47JPFi3gYZH315auRLuhMYiFR0l08IKF020/FVQ3c4DeiRIg?=
 =?us-ascii?Q?UDrFber1vUChQfAghwlnHA6g+bum1Y95pzPIYmFmAYKzmK024e9GOkmLz9xl?=
 =?us-ascii?Q?xGtqA0gdgWKx6tmBOGPuKsY7ew3quklN7/aunNFAUd3sRlrn+xEQA+DhGXJj?=
 =?us-ascii?Q?80+CpfbLuscB7o0DSyG4IXLZfEqPQ/MRq+BjJA5QRRkt/Td4ipjj7O79ao2R?=
 =?us-ascii?Q?JK+NQ11M5vc3w7W+PMYHllu9xdEGm8PVpjUC92JHPE6nYM/pkFobXq6p1Aqm?=
 =?us-ascii?Q?nwup4bz+xzKTnXzVbNhO/s8YihOwFl5+rFuwoJnG5ueSigbigl2+bX8oTaMx?=
 =?us-ascii?Q?frW6n8R/CTQ26cgsnb0mDaMgSj4wpQys6X9wZITmxdaPgd3NAxLNbYIrFesu?=
 =?us-ascii?Q?RRQ2KtXv+q1eV5meDvFgAAdiSYu4r4WzLv50Z1ksFIadDCb2KRPh6v1oLgEg?=
 =?us-ascii?Q?CZUFVtny2Swj9GbSZKtjHFFwN+ISjmnQrV2A0FZk2gyShdW1GLeFhmskMOW2?=
 =?us-ascii?Q?mjDlbbPMQnRBgqMp/xFixTLPklYjjmit5p5IWEnTjStxW4qJ/KIpFGsMn0wS?=
 =?us-ascii?Q?//8/byAgueyqkg40GFdMenQRCFNDdCf8FnciUkNvIJZUIwFcKpDCE1f98ccU?=
 =?us-ascii?Q?YkuTpB0op2XnmkVLWcSQI+060Eui+JwMimZvAk227G28VR7gNuYiy8ZnKOJK?=
 =?us-ascii?Q?IvpyPviPx76qrmLcUHAgNsN9pEBjPzWwGqqh0mTZXnS58CjqbmzuIYOIOf2Q?=
 =?us-ascii?Q?nUIYMdFtA0TQI7JrGlJq9j6lSiyWsbkuTM0f453k+asSqpe1ZYyyFlrapgou?=
 =?us-ascii?Q?sjP1Tgy8FHts00OmxPLIrSYmO/K9/+QOLAW1wqt6LE2/sXFI0VbNYskS8cos?=
 =?us-ascii?Q?xpb8IsbyiC4RT/m06siejRhyv8LuTe90he37ValEM6XtDNDYrzVIvhHpoW1b?=
 =?us-ascii?Q?c/reOaboFkCER/Etk4ZuS/KGbF9w+IJ96mdu4ae25y6tCAxHovc5WELlRzO0?=
 =?us-ascii?Q?AXBi2aMaDNwIibTwp3mPnI6gLRmjjao8YcvrAAPevYPZ6JENQaB7cQEke/3P?=
 =?us-ascii?Q?hI/a4L+7aIt/5TWWno1rsV/bLhALTe69LC0zbXJ7f6igHwhbFjDf/9PvwEAs?=
 =?us-ascii?Q?Kt6uMMqExdt3pPwRaeBbMdvh+xndNalDTkLRap9Xy/MnGr9MQDB/bfOIcJvp?=
 =?us-ascii?Q?PxJnz/dEhvJLVnfeMiYmHxS7QNK4M3hAXsNq+7o/5ww3tS3iU2DEFSfLlnAW?=
 =?us-ascii?Q?mwbtwQ0RYlR8sJxz/asm5tr8Fnc7fUWeOs6LO/3eSu8RlNSgkSad1umCryBB?=
 =?us-ascii?Q?3Nwo9yhs18NS4b1oD15nS7uT3fI3m2wGGpi9kDXw2vhMX3kTp3gtB0yD+xc3?=
 =?us-ascii?Q?ThRJoS/iwXCGq92Q5Nln4bfGWyJ4fQ3mXNfktFpQ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 174af208-2218-4390-9cf6-08dc8caf9bc8
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2024 20:21:44.0346 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cGdUyX3ofx5T2pJE4QxneeETXhtNu41qv1XvIb0fFXuFl1CyhglWLNnshQPOZyPqhzSV4FxY8qIhUzFzAXRh7ahhCRFvYCMf1ZNFpPR+r+k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7435
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


>=20
> -----Original Message-----
From: Vivi, Rodrigo <rodrigo.vivi@intel.com>=20
Sent: Friday, June 14, 2024 12:46 PM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>; intel-gfx <intel-gfx@lists.fre=
edesktop.org>; dri-devel <dri-devel@lists.freedesktop.org>; Harrison, John =
C <john.c.harrison@intel.com>
Subject: Re: [PATCH] drm/i915/gt/uc: Fix typo in comment
>=20
> On Fri, Jun 14, 2024 at 03:23:54PM +0000, Cavitt, Jonathan wrote:
> > -----Original Message-----
> > From: Andi Shyti <andi.shyti@linux.intel.com>=20
> > Sent: Friday, June 14, 2024 8:22 AM
> > To: Andi Shyti <andi.shyti@linux.intel.com>
> > Cc: intel-gfx <intel-gfx@lists.freedesktop.org>; dri-devel <dri-devel@l=
ists.freedesktop.org>; Harrison, John C <john.c.harrison@intel.com>; Cavitt=
, Jonathan <jonathan.cavitt@intel.com>
> > Subject: Re: [PATCH] drm/i915/gt/uc: Fix typo in comment
> > >=20
> > > I guess sparse and potential CI errors won't minimally relate to
> > > this patch.
> >=20
> > Yeah, I don't see how a change to a comment could ever be related
> > to any CI errors:
> >=20
> > Reviewed-by: Jonathan Cavitt
>=20
> Please ensure you use the full line.
> 1. People don't have to go to the header of your email to get your email.
> 2. People might not be entirely sure of your choice of email. Please noti=
ce that
> even on Intel many folks have @intel.com and @linux.intel.com and sometim=
es although
> responding from one, they use the other to sign things.
> 3. Tooling! (b4, patchwork, etc) There are many tools that get these tags=
 directly
>  from the email response and by using partial one you can complicate thin=
gs.
>=20
> If you also allow one advice, try to use a terminal mail client like mutt=
 and
> open the replies in your favorite editor and add macros there to add your=
 lines
> based on shortcuts... For instance, on my case I use mutt+emacs and I jus=
t hit
> Ctrl+c-rev and that adds my full rv-b tag in the response.
>=20

Whoops!

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> Thanks,
> Rodrigo.
>=20
> > -Jonathan Cavitt
> >=20
> > >=20
> > > Adding also Jonathan in Cc :-)
> > >=20
> > > Thanks,=09
> > > Andi
> > >=20
> > > On Fri, Jun 14, 2024 at 12:28:37AM +0200, Andi Shyti wrote:
> > > > Replace "dynmically" with "dynamically".
> > > >=20
> > > > Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> > > > Cc: John Harrison <John.C.Harrison@Intel.com>
> > > > ---
> > > >  drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/=
gpu/drm/i915/gt/uc/intel_guc_fwif.h
> > > > index 14797e80bc92..263c9c3f6a03 100644
> > > > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> > > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> > > > @@ -295,7 +295,7 @@ struct guc_update_scheduling_policy_header {
> > > >  } __packed;
> > > > =20
> > > >  /*
> > > > - * Can't dynmically allocate memory for the scheduling policy KLV =
because
> > > > + * Can't dynamically allocate memory for the scheduling policy KLV=
 because
> > > >   * it will be sent from within the reset path. Need a fixed size l=
ump on
> > > >   * the stack instead :(.
> > > >   *
> > > > --=20
> > > > 2.45.1
> > >=20
>=20
