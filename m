Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D85DBAAEC37
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 21:32:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA63410E878;
	Wed,  7 May 2025 19:32:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AGPFXKCS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A02DE10E1C9;
 Wed,  7 May 2025 19:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746646374; x=1778182374;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rVCXk59FWiyT72Lr0raOcslnIFIpeK0o+F5m38rvqK0=;
 b=AGPFXKCSA09Yvgg2ms7eabGbqnZa+8WVx3G4NMvtaJF/0FbqlzpQ1ud0
 nxuTau5lGEn1VVo637ceeOe6g331S2Jcn5YMyOugv/lVnOht38Iiv7vFR
 44w7aGOzOWND4aEdg/F9NJfzl794sjH+P/0Z+zJCcsaxh1vGsQGCnYqft
 SQ9zDTmECgDVGRBRjMCCjnuBKrQdYjqJr+jD5Lt+GCAfYYan/GGz0xviv
 qfNf3dgWt+YBIfWfOuu+R9hISSlKhhkKaxeNbRTFPJVDmfeQ7t6/z/XhY
 M5v144gnv5LpN6+kkjG8pXXkouT6cC96HmHrQXnpA9+aR75KaSZb5Tgm6 w==;
X-CSE-ConnectionGUID: 9y3+WuQdSF6VnhIXEGiHHA==
X-CSE-MsgGUID: WW+rfNqFQpKujlV7X/rBtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48416891"
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="48416891"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 12:32:54 -0700
X-CSE-ConnectionGUID: 42R3rWt8S5KJMNtVgObTlw==
X-CSE-MsgGUID: WBduiVuhSeaKtPNj3GbANg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="137048482"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 12:32:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 7 May 2025 12:32:52 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 7 May 2025 12:32:52 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 7 May 2025 12:32:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P6uzGI2v47OWYGwycmZucCbMmWxwgi+IvnPR5MkUZchtbmUxddj+xJ7mpyUY/11Z8fZP55LsiibLMBqfWomIJ4Skdrz2ff2LjO+Cg/QQxULWgq3Z4v2d+hw0zjy5DUHHlJ6H03TIMggzg3UrvMdPWxOjLQUJVJrn+SZmbJ618fHcRG5iLdOk32p+p09kZ3B1wHLBp+A5Mn1lgPekBYO1hJGAUrzFD69xXjHSE8iyKeFGnV2dMlgJOj1wJ0Mp/FWwIAE+UVFmS+goHF7+6cj1ccOgI8F++PWrvMcrX92flX53SPL5DVtkFaK8F00PFJQGdw+GI7MZcJE/SVWcJ3CUbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eh6JycWt9eFbTTMWN5uwA57tvnaTUcVxTt2V1xWa1YQ=;
 b=deFwpsnufCQu7DtAubIZLdLgJ3BoKjJgOjuf/gbJT4as1Gsqkt5skbhMNHQVQeCuYGK7g/u9ra5BIybqzgz7qPVvzEwIIvKI9N9UFsJviLkgCQyQFreaQ7AfxrVw6wiksCcDunJWIddBH3t4y+8FrLNu8kxPTUMsOd//qwKu302yCQqJH2jSS5yYs9cmEsiZ7BI3j5MXGoGvlaxrv6VhYJA/nWaDnCZwkMVy6Pa+2Ji1oH/F5FfJx+a9sOhjMssdkVV/fvwUMQ7N3Hz961Ak/IidwlPezD3PBtkaG+Q06KQgOg0Z4k68PYSBYn2pIlIA6xr81FZWVb6OX3Pxy14z4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by IA0PR11MB7306.namprd11.prod.outlook.com (2603:10b6:208:438::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 19:32:49 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%7]) with mapi id 15.20.8722.018; Wed, 7 May 2025
 19:32:49 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Gupta, 
 saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>, "Brost,
 Matthew" <matthew.brost@intel.com>, "Zhang, Jianxun"
 <jianxun.zhang@intel.com>, "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Mrozek, Michal"
 <michal.mrozek@intel.com>, "Jadav, Raag" <raag.jadav@intel.com>, "Harrison,
 John C" <john.c.harrison@intel.com>, "Briano, Ivan" <ivan.briano@intel.com>,
 "Auld, Matthew" <matthew.auld@intel.com>, "dafna.hirschfield@intel.com"
 <dafna.hirschfield@intel.com>
Subject: RE: [PATCH v24 3/5] drm/xe/uapi: Define drm_xe_vm_get_property
Thread-Topic: [PATCH v24 3/5] drm/xe/uapi: Define drm_xe_vm_get_property
Thread-Index: AQHbv2jCHYG28wuYM0uTJPUlBM6wlLPHjF2AgAABqdA=
Date: Wed, 7 May 2025 19:32:49 +0000
Message-ID: <CH0PR11MB54441C9BE476FAA329E98673E588A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250507155727.130444-1-jonathan.cavitt@intel.com>
 <20250507155727.130444-4-jonathan.cavitt@intel.com>
 <aBuzU7zfg41-F_ya@intel.com>
In-Reply-To: <aBuzU7zfg41-F_ya@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|IA0PR11MB7306:EE_
x-ms-office365-filtering-correlation-id: 6082f74f-888b-4b62-c5dc-08dd8d9df396
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?+CAx37i7grkyOiTk0TJxQEkPhVjDfC/KXcLVa82DwGyCs6PzarykyhM07/xE?=
 =?us-ascii?Q?RBgO2/rXqFddJbASnwjnwN7TM3SJic+Y7hocPb2DpG/7rIQ4EzMi5hwX1SM5?=
 =?us-ascii?Q?BW6G56jrpp47dBZNF0CyHYvqxt2DY/538rCC97tsQSULHCBMRsrT6bg5piHy?=
 =?us-ascii?Q?bliPcySa6dBQuUMlwzWWSBw/RGzf80JygRSSS47TttQHdPpB8WiOOewoRbFc?=
 =?us-ascii?Q?UOBmPZygDFrQbDy865+tgin1v+0LmjfIfpW3bH1KKtVlM4JH+AAhjYNg/Q1L?=
 =?us-ascii?Q?XaNWWDhCRr0kzwfP/ElRcn+riM1rzuI3ZoBX3qrXJpuItQt8BbvoakvmoFD/?=
 =?us-ascii?Q?iGx9OnPX50M81G+UFjaZLKnzhB8OJAd/Lm+UJeg9bwsD8Wr5GIJWwOA36do0?=
 =?us-ascii?Q?L3Ga4XcksrixKSvcEgrUvoikXhHM1Pvc5mrIqW429OO7faw6FFMttwwteD3s?=
 =?us-ascii?Q?qWE3kgvAHvyQrcw656cdNwFI5dXDIcQ9YhPM2QC60ky9vL/2rB8lbU0aXOz9?=
 =?us-ascii?Q?8JtYK2panKefTwtyFREVwgq5dWRcRicjC4sdb7mAf+O0BD/QD8N8YUitl+mH?=
 =?us-ascii?Q?elXtUEaV7YEdgDOB7oDz0dODG7xRMD787kOJaK5rjbPWhPTtWYke1B0Cd7he?=
 =?us-ascii?Q?n15SYT3dThQ67w3lWLK8O90fWYqQ46D66OZxr0pWo8pPPCCWGLVWIZhzEzWF?=
 =?us-ascii?Q?niWO6rU9HozGBlIQxjGaNO+3x7OxhhD9lYZVGUaicYTAVOlYGQ8b5wf203yU?=
 =?us-ascii?Q?GeXN3q6oKpG8Gd6EUJu1ceHrk6UOSS9KLp6SKPxs/sYHYG1dqiMgnZFZA7By?=
 =?us-ascii?Q?7GfQLaU6imfjR57xOBpyLv9FPMKI+N98VovIrDwFgpnbA+ZbRr7q4o8Uds/3?=
 =?us-ascii?Q?GSauYvhJPU6JTp8YWjD7n0dGqZ4wfZbpem1BqhHcmyBungFwNIsQtAE6nOWm?=
 =?us-ascii?Q?4eLG5Yb5esiiLQ1JsEDIfJlUZDnnPJ434rNXlBoXWBeCl1faI2bHg9KQE0vN?=
 =?us-ascii?Q?H/TJUOcrj9av7dgCrTLTHN1V05Ks8PsATCtUU5iOh24om+e4vHd8LLnp5FHZ?=
 =?us-ascii?Q?gme+T2KIANDOtouSTxe4T/pwwcQ8d67qv2VLBDisfDp4Ux2Wx6yOnTDOVxxU?=
 =?us-ascii?Q?+kdy6T58C7Sryeg/A9hXOnd5t6SRHpJpaCjd2FdOZ6BUgmexQWBaN8N8ZUIc?=
 =?us-ascii?Q?ZfYNS9oJvCFR8PI+IJDJ+zNZKqroR+SHv/y/moSWuTqnP2Whm1lT734sCGRj?=
 =?us-ascii?Q?FbEcNLyEGuUVqmw23KQ+KSUGCCcAkncQpHTOaivwYMOoLk4nSD8jq4O7hvxw?=
 =?us-ascii?Q?C0ETb9lANxHdtv9R7kc9sMnUzhhHBxDIhz6EHZ/riTEo77YG798YZvm0YtKP?=
 =?us-ascii?Q?olgKHdy9wDLtfZ8ZYYBbyQPVqicoN/U41Uo0Y9b0neXXeclgELjqNPwzG2VG?=
 =?us-ascii?Q?SqgkzkjXK30=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Pw3W+hE6WY8V0f17y8KRPnk0v+vk1HAO26Y7glSuez2n5GQOesNStnsnPuAd?=
 =?us-ascii?Q?aZAYTYiEGtBa4AQPOadUhH6bz3gDAYMnfHWZwCaSYdJdDZ2ghGRnZg6pulgY?=
 =?us-ascii?Q?rgJ6dImL9e6MMunI7S0KVGswwF9FoP3iljLoktV2qDsz3OspFJiQ6/mVBRWA?=
 =?us-ascii?Q?xHfAt6moYmGhtuopQrzQVYtkKcsUAaPAKx8zRrWPZ2zCpnoVvN3hOmeWOr5f?=
 =?us-ascii?Q?uCaLModAKUS8mtSjFgjOQpIAQj4j2BzXahcQYVS+gbeJhmxS3cHzpra2RTPG?=
 =?us-ascii?Q?EvsAo7sdsr06LhKo+zPqohUAOuXIZ+qdHqyHfIZ/K3c44IH97Pf3OQASwFv0?=
 =?us-ascii?Q?HtZTsQcQqOqHXVUi3Dat3fU1Ugx8y09G8MsXRM77F6piuxSI8yPS1Et+xVtO?=
 =?us-ascii?Q?PqPn6eVpXfmJ2nVf4sOb1TAIQBZ22Mg3MVYR8icreSo+43ExibkLZSLABlb4?=
 =?us-ascii?Q?+ZigZYw/I/kLK1dUiiZ7U+mrmAiNskd8tBDzbi1g2K6PD/1J5mOM7iHuWEN6?=
 =?us-ascii?Q?pUsGKOuCim2N8sgxx0/Z1i1QRFjIT0ZYCg0XcM161K9egXniF6Y/5BBRtM7V?=
 =?us-ascii?Q?TAzCPiO+oxKwoH63OGHVWwxOglx6weC/vOWQWS0vOb11rLC/+L/2NZsfUwJa?=
 =?us-ascii?Q?tvBsD9jxYBlS4jRSdLLbdy4hTH9dRQX46SwPOi2ATdUOc5zy9dk5yVao/YIr?=
 =?us-ascii?Q?UMDC2b30AczYPBtg+ErQ04wSwJfQ8EAKWLFe+XZTBZizob5nfq3hqVUO4ky0?=
 =?us-ascii?Q?QrXasyn10hJG80n+fKipoaQN+CjmqVEBRpXW2mhyBsgRmOH920ll1Ah+ekow?=
 =?us-ascii?Q?m8U7PbVMPQxlYXYe2WsVlV95wKsyvBrwg64u7h6ktTFfxkr8ofG0nDrqBvcf?=
 =?us-ascii?Q?JxCpfTceSKIWNjshZxtFeLZzPaQsCnRl8SLG7fdTY1Cf0voedkhuHaKi3JhX?=
 =?us-ascii?Q?h8DCYId6wO/kx+lApOsbwm0rDjxihvPXdZN9WNsCqhb4+Nw0hNS7MtC3luip?=
 =?us-ascii?Q?+TqWqY86WAjgb2L8sdULWj7PubuhQrjWglMPPDYWAvgsErsIX47FhiIA4qCc?=
 =?us-ascii?Q?wB9qmcoAkZiCJ1VW+QanhnY+zbuSIINEDlcAvXQkF78d/o/+VuTI2nBsTCvz?=
 =?us-ascii?Q?kZmtWSlmRb/1tqcpmbQn2xMu2Cugx7KJOu/CAWM4PpWoTvaOe8/l5STJNFBI?=
 =?us-ascii?Q?DLbi8KCFawZ3G7P1QapRTbrNUtfdOqgGlxSMqDbelgQwXEHRudH1fz3Rfk5u?=
 =?us-ascii?Q?cxd2Bt19DSeuFcGUUFzhobVblZVd0r25KVgc8zY2stCf6DNP2fzTAvsswkSS?=
 =?us-ascii?Q?EKMT/i3SHp5clABgDDiDkiV6+RVtN9j00lseV5RSqRYTRXOyV9c8xzBQbFxQ?=
 =?us-ascii?Q?vLm7LHKTk1I9EPXUQRYVJ2LCXUfAUzXXbE7sL+R59Mr4oTWSGvWd4lZkXEcD?=
 =?us-ascii?Q?ETGDvzu+Pzb3zpvH3Ro4swmhO/RG0h0rLQPevhSbfnGAKEr9s9X1ALjysIOA?=
 =?us-ascii?Q?Hx3VJEQ4imZYs0wffWCzIqC0LTTznWMlbb5l6XRMRxEIRpfhMp4VxWkoH7np?=
 =?us-ascii?Q?fKVRuafoXa9E6GxQ9fECiGUeX4zPc+Q4Csrwueex?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6082f74f-888b-4b62-c5dc-08dd8d9df396
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2025 19:32:49.2019 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HNIpOujBK7AO7oeyre+/wjuCh9wrEtqk79Bhbart+iAz8ww7/uPe8/eNAgJ8Fk3DQKmWxabLbVT4nF+OZa/rU2/z3sF5fx+GAkJ4LL/Vo5A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7306
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

-----Original Message-----
From: Vivi, Rodrigo <rodrigo.vivi@intel.com>=20
Sent: Wednesday, May 7, 2025 12:24 PM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org; Gupta, saurabhg <saurabhg.gupta@intel.c=
om>; Zuo, Alex <alex.zuo@intel.com>; joonas.lahtinen@linux.intel.com; Brost=
, Matthew <matthew.brost@intel.com>; Zhang, Jianxun <jianxun.zhang@intel.co=
m>; Lin, Shuicheng <shuicheng.lin@intel.com>; dri-devel@lists.freedesktop.o=
rg; Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Mrozek, Michal <michal.=
mrozek@intel.com>; Jadav, Raag <raag.jadav@intel.com>; Harrison, John C <jo=
hn.c.harrison@intel.com>; Briano, Ivan <ivan.briano@intel.com>; Auld, Matth=
ew <matthew.auld@intel.com>; dafna.hirschfield@intel.com
Subject: Re: [PATCH v24 3/5] drm/xe/uapi: Define drm_xe_vm_get_property
>=20
> On Wed, May 07, 2025 at 03:57:24PM +0000, Jonathan Cavitt wrote:
> > Add initial declarations for the drm_xe_vm_get_property ioctl.
> >=20
> > v2:
> > - Expand kernel docs for drm_xe_vm_get_property (Jianxun)
> >=20
> > v3:
> > - Remove address type external definitions (Jianxun)
> > - Add fault type to xe_drm_fault struct (Jianxun)
> >=20
> > v4:
> > - Remove engine class and instance (Ivan)
> >=20
> > v5:
> > - Add declares for fault type, access type, and fault level (Matt Brost=
,
> >   Ivan)
> >=20
> > v6:
> > - Fix inconsistent use of whitespace in defines
> >=20
> > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>
> > Acked-by: Matthew Brost <matthew.brost@intel.com>
> > Cc: Zhang Jianxun <jianxun.zhang@intel.com>
> > Cc: Ivan Briano <ivan.briano@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
>=20
> We are already in the v25 of this series and we still don't have the user=
space
> PR/MR to reference here and no ack from the user space?

The userspace PR/MR is in the cover letter:
"""
uAPI: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/32987
"""

>=20
> Sometimes faster series iterations are counterintuitively slowing things =
down.

Who should I be messaging to get userspace acks from?
-Jonathan Cavitt

>=20
> > ---
> >  include/uapi/drm/xe_drm.h | 86 +++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 86 insertions(+)
> >=20
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index 9c08738c3b91..556fc360a076 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -81,6 +81,7 @@ extern "C" {
> >   *  - &DRM_IOCTL_XE_EXEC
> >   *  - &DRM_IOCTL_XE_WAIT_USER_FENCE
> >   *  - &DRM_IOCTL_XE_OBSERVATION
> > + *  - &DRM_IOCTL_XE_VM_GET_PROPERTY
> >   */
> > =20
> >  /*
> > @@ -102,6 +103,7 @@ extern "C" {
> >  #define DRM_XE_EXEC			0x09
> >  #define DRM_XE_WAIT_USER_FENCE		0x0a
> >  #define DRM_XE_OBSERVATION		0x0b
> > +#define DRM_XE_VM_GET_PROPERTY		0x0c
> > =20
> >  /* Must be kept compact -- no holes */
> > =20
> > @@ -117,6 +119,7 @@ extern "C" {
> >  #define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, st=
ruct drm_xe_exec)
> >  #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_=
XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
> >  #define DRM_IOCTL_XE_OBSERVATION		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OB=
SERVATION, struct drm_xe_observation_param)
> > +#define DRM_IOCTL_XE_VM_GET_PROPERTY		DRM_IOWR(DRM_COMMAND_BASE + DRM_=
XE_VM_GET_PROPERTY, struct drm_xe_vm_get_property)
> > =20
> >  /**
> >   * DOC: Xe IOCTL Extensions
> > @@ -1193,6 +1196,89 @@ struct drm_xe_vm_bind {
> >  	__u64 reserved[2];
> >  };
> > =20
> > +/** struct xe_vm_fault - Describes faults for %DRM_XE_VM_GET_PROPERTY_=
FAULTS */
> > +struct xe_vm_fault {
> > +	/** @address: Address of the fault */
> > +	__u64 address;
> > +	/** @address_precision: Precision of faulted address */
> > +	__u32 address_precision;
> > +	/** @access_type: Type of address access that resulted in fault */
> > +#define FAULT_ACCESS_TYPE_READ		0
> > +#define FAULT_ACCESS_TYPE_WRITE		1
> > +#define FAULT_ACCESS_TYPE_ATOMIC	2
> > +	__u8 access_type;
> > +	/** @fault_type: Type of fault reported */
> > +#define FAULT_TYPE_NOT_PRESENT		0
> > +#define FAULT_TYPE_WRITE_ACCESS		1
> > +#define FAULT_TYPE_ATOMIC_ACCESS	2
> > +	__u8 fault_type;
> > +	/** @fault_level: fault level of the fault */
> > +#define FAULT_LEVEL_PTE		0
> > +#define FAULT_LEVEL_PDE		1
> > +#define FAULT_LEVEL_PDP		2
> > +#define FAULT_LEVEL_PML4	3
> > +#define FAULT_LEVEL_PML5	4
> > +	__u8 fault_level;
> > +	/** @pad: MBZ */
> > +	__u8 pad;
> > +	/** @reserved: MBZ */
> > +	__u64 reserved[4];
> > +};
> > +
> > +/**
> > + * struct drm_xe_vm_get_property - Input of &DRM_IOCTL_XE_VM_GET_PROPE=
RTY
> > + *
> > + * The user provides a VM and a property to query among DRM_XE_VM_GET_=
PROPERTY_*,
> > + * and sets the values in the vm_id and property members, respectively=
.  This
> > + * determines both the VM to get the property of, as well as the prope=
rty to
> > + * report.
> > + *
> > + * If size is set to 0, the driver fills it with the required size for=
 the
> > + * requested property.  The user is expected here to allocate memory f=
or the
> > + * property structure and to provide a pointer to the allocated memory=
 using the
> > + * data member.  For some properties, this may be zero, in which case,=
 the
> > + * value of the property will be saved to the value member and size wi=
ll remain
> > + * zero on return.
> > + *
> > + * If size is not zero, then the IOCTL will attempt to copy the reques=
ted
> > + * property into the data member.
> > + *
> > + * The IOCTL will return -ENOENT if the VM could not be identified fro=
m the
> > + * provided VM ID, or -EINVAL if the IOCTL fails for any other reason,=
 such as
> > + * providing an invalid size for the given property or if the property=
 data
> > + * could not be copied to the memory allocated to the data member.
> > + *
> > + * The property member can be:
> > + *  - %DRM_XE_VM_GET_PROPERTY_FAULTS
> > + */
> > +struct drm_xe_vm_get_property {
> > +	/** @extensions: Pointer to the first extension struct, if any */
> > +	__u64 extensions;
> > +
> > +	/** @vm_id: The ID of the VM to query the properties of */
> > +	__u32 vm_id;
> > +
> > +#define DRM_XE_VM_GET_PROPERTY_FAULTS		0
> > +	/** @property: property to get */
> > +	__u32 property;
> > +
> > +	/** @size: Size to allocate for @data */
> > +	__u32 size;
> > +
> > +	/** @pad: MBZ */
> > +	__u32 pad;
> > +
> > +	union {
> > +		/** @data: Pointer to user-defined array of flexible size and type *=
/
> > +		__u64 data;
> > +		/** @value: Return value for scalar queries */
> > +		__u64 value;
> > +	};
> > +
> > +	/** @reserved: MBZ */
> > +	__u64 reserved[3];
> > +};
> > +
> >  /**
> >   * struct drm_xe_exec_queue_create - Input of &DRM_IOCTL_XE_EXEC_QUEUE=
_CREATE
> >   *
> > --=20
> > 2.43.0
> >=20
>=20
