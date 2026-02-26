Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oIIrBzu1oGnClwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 22:03:55 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9C91AF5FE
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 22:03:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BA0310E999;
	Thu, 26 Feb 2026 21:02:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X/sParEe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B507A10E999
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 21:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772139774; x=1803675774;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OdI7TzqhtJFTNHea0qqUJlg/dEPhyM4sGyR+6j9n2IU=;
 b=X/sParEeQJi1mMgR2NeNpQP7YJvBd2xFMRyXLWiF2NhUs8wrbBfLaaOE
 DUICvMQn91zbTDCxrYiFavoYm4VadDirgDf5+oX8kHqcgOxwNvpFX6SgJ
 DMBsYfUBtQxiFRRFYNkte95EaSjH2YftileJVm9H4z9ngdU/OsdNXT5ii
 o4CJEAIUPnvCa/wxHoonBsxdgWaiPH3NNyayCIgyGDdGXf3N5Ls/Up2py
 xZL18OOMKlEjKlvags9xsffRJIPG4qu7y5jJZvkEJePCUPxxr9SGtwUZO
 NUMeCzgaVVh/JQz0/9tgiwh9/g1mM8/o3PE1t6Z9zSsuvQMYBa9oaYdTW g==;
X-CSE-ConnectionGUID: X8KSZ9HrQau6Rr3NGzsmpw==
X-CSE-MsgGUID: 9OQRdlVxR/S5U9ftoBlLWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="95832776"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="95832776"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 13:02:39 -0800
X-CSE-ConnectionGUID: c8FeD/RwQdKOCOXLBWd9sg==
X-CSE-MsgGUID: MBps3GyCS+y1M+k50uKfGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="214184423"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 13:02:37 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 13:02:37 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Feb 2026 13:02:37 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.13) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 13:02:36 -0800
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 PH0PR11MB4853.namprd11.prod.outlook.com (2603:10b6:510:40::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.14; Thu, 26 Feb 2026 21:02:32 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::22d9:ae03:5db1:680]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::22d9:ae03:5db1:680%5]) with mapi id 15.20.9654.014; Thu, 26 Feb 2026
 21:02:32 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 1/2] drm/dp: Add definition for Panel Replay full-line
 granularity
Thread-Topic: [PATCH 1/2] drm/dp: Add definition for Panel Replay full-line
 granularity
Thread-Index: AQHcpipUT/3+YDDiC0mtc64SeEdJUbWVeMog
Date: Thu, 26 Feb 2026 21:02:31 +0000
Message-ID: <DM4PR11MB63607DE2CD6A445F51C9925DF472A@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20260225074221.1744330-1-jouni.hogander@intel.com>
In-Reply-To: <20260225074221.1744330-1-jouni.hogander@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|PH0PR11MB4853:EE_
x-ms-office365-filtering-correlation-id: 79bd5c22-3e0b-49d1-6c9d-08de757a5bd5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: Jw6o4hWqI6FhloOtnheUd69GmTOA4vPhxNF2mr85Zoor0cQJhPQJBEiOiF8JVgy2PdzZv9MAjX/u4oxhBkVlW4WUNd8WZ8eFjbB1wDDlyPA0rjmnW7Psk7UOzueo1NfUqMBRC1RntgtJNg0Haakx1MAgOcLyBeTB+DxfNq3vjU4oAQQs6FPm94vIJOcbFCXcM/Un6OHYkolmwpcACMgrDN/MvqmSWd3WMIrLBR/1HMF1qr0z9bWvmA03FgNYhaWja+2b54b88XjLEHGXSmSAcwa39FP0HHhB1dSfoPWggPlhSHXzpIBFkSpjq5/xlV6xAGXWI8cJHRw06E4oFyB2+/i8zQfylzMFmji3XvEIp1Pl4ZwFFG4NOI8cwOfyCUj+/62BHtRPvlyE4TL174D1IAC3o4XBwHqJ4zp+aPh/ubRZgzKrqWiWwkMKB0pHEh4y6Jg6CCfZJ3IFn0BQrcTrm9eMkZUCtrSwBzT2AwBDc3/BIGtOFyRGFJCOewXb/vbzp0dNb12REspo86QgJO5cxeL9pDD6GDxV6W+EIUr307iET/XGwB2MUGDXgBclNaz7uqCpqFSTSpOgU5YesC8GsjDC8nOCV2S8LDrdUFQB2SJlfCGCRAQvUh+s9aQrA3mbHN/EZuOswwlute/sSfV13PlO2N2c6r7QHsLNf7sI5l8Vx/J7YruegY6d/wmPDXezX2zam+szdh/G2I0Yt1OUb3bZaLQibVuEBzRB/uRDGQh2Wv/xvQ3AEIJPXhN/UQHHhxEaXn6H494udlXrh4cLGVhv3C+Vw91uD0dqB7DRKHs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YU92UkxCU0s1RW91OTFVYk1uYTB3SWFxM2I3OFNINDVZMjJOS0dHdFpJT05v?=
 =?utf-8?B?YURqdms4anM2bVllK3IyekdRUzlSeHQ2OHBIVDJPNWdRbTc0dWRPbW1za3Q4?=
 =?utf-8?B?UGFkZXAyVkJ2NjRUcUt5bHFYZk10aXcwTWxrNk02dTMweEZOTW95dUNUeXI1?=
 =?utf-8?B?UFIzd2xRbHJzck95aEdnalNBNWVZTjIvTmFlSEZqdFErOXdIV3lidkIvd2pE?=
 =?utf-8?B?ckFGMSt5SzJJWkE4aUlqN2tDdUl2dG4wakhDaXpJM1QyK2N5eTB2SWJXNUF3?=
 =?utf-8?B?bCtWM1dpRkt2U1VjQzBka3E3TWJIYmhBT3FRZUxHcTNneEo3MU9EN1pXdGUw?=
 =?utf-8?B?bTFVN1VjTEkyR1NTZ25uMXZMRURnV2JWUUY4WUxYSjhjQWEvcTl1MmEwQm9o?=
 =?utf-8?B?STNRUjB2UE0xblN2a0FPZ3ZYSllPTEVIZGRrTEUzWm0vVWVJUDQ5WmxaYUoy?=
 =?utf-8?B?ZnZMUUFobkw1akg2UkQwSDFwT2lXUjVYT2R6WFVmajhlemxuek9YTVJUSVlu?=
 =?utf-8?B?aWlWb1lmS2xucVFuckJBbUdKVUpsTU96SGo4NysxMWNWMmp3THVFbGNnc0NV?=
 =?utf-8?B?VWx2c3lnY1NkdDIxOGlCMmJNaFBiNC84QUNwVGlWaS9sd1A0Mnd6OUxnam95?=
 =?utf-8?B?N3pSbUp5MEp6aUpSVjZORFV5dlFScVRiNmZ5dGdwaVBBc2srbDBKZ3dwNGN0?=
 =?utf-8?B?Zk94MmZpT3h4Smh1SEo0QXArZThJZEJIM21xNjV4MDFUNUl0a2phVUlLUDBz?=
 =?utf-8?B?L1JSdzIxL2x2eWg5a1A4Uk51UE1SU3ZwR3ZCZGc5VUl1SEozWW1pRTErMXR5?=
 =?utf-8?B?L1JFYkdreGxuOTFiR0RHYS9wM3d2QkxQQzd5cjI4RTJsT1lYNGpqajVaNmx4?=
 =?utf-8?B?cVdhTDZLOWdZQmZUK2ZOLzBIMTVqT0pSQlhwanpyYzI5STVvQ3F2RnZxR0ta?=
 =?utf-8?B?TStPaFp5R29jcFIvRU5HMzZDZzd1VlY4Rkg2bWMycUE3SEFZb05zcmI5QTVZ?=
 =?utf-8?B?Ny9saWFXYVQwWHNXTWkvOXFJWUNqbTN2R3d4VXpWRFBJaFFPRDZDbGJJVXV0?=
 =?utf-8?B?Q0VadGt2dDI5U3FaRHNCamJ4WmFlb2JjaXVvajJnZWpXTEszUWZGVGVPRll1?=
 =?utf-8?B?TEVoMi83N0QzSzZLdndiaExhY3FhSG4zT3pMeDBoTWdFb2hOZVM5WHVGNkYz?=
 =?utf-8?B?dWNsUlpvVzhBTlVuNjAveExPdXk1T01VOVZ1WmQ3dUJLUXNiaTFhQm53a1Za?=
 =?utf-8?B?bEt6dFRIeXk4ZzdHZ2ZJU1pkdGYySHlhSjFBYWxhUFV1dVJ6TlZKa2pMZE9k?=
 =?utf-8?B?TmVWd013TUYrdlBEZ2NtQnhZR1dWaVdjbVZCais0MHFBamJLWXZ3WU50Y1VD?=
 =?utf-8?B?dHpMRXl1a2p2KzJ4cjJZL1VvT0g5M1NmNDArUkhiVitTa2xNNjM0VFpIQzdX?=
 =?utf-8?B?N0VldkY0N0oySjloZUQvaXR4MSttRW1VWnVjVEVmNUdWeUxoNlM1Smt5aEpa?=
 =?utf-8?B?QThPejlFcklOcGw4SmtCTEVEZHVnVHBRaUMwdjQxRjlhYUtFeUtHdkliYXdz?=
 =?utf-8?B?aWp2NnBUK3I4NGhRMXREdGVQZXJick9GS3N0cnNIQzBIeFVFNU5sWDVUbG01?=
 =?utf-8?B?ME40bzl6RHI5cjE5U3crNDJqZ1ZZUWdOWWdENW1LK3pNdjlpMXc0bXBmNjhl?=
 =?utf-8?B?T2FybXh6aEhtRGFWSkdxTkZPOXVaQ082R1l2SkpWQ3gvYk9kSTdDQThMditG?=
 =?utf-8?B?Z1IrZVppRG1HN0ZzZ05ZNDlZa3c2bk9ac2tOd0NsTUxsVXNPb3NqRTJlUzNN?=
 =?utf-8?B?U2pNZGZ1bXE2TFNacE5LWDA0UU9EcUFwVXZLckEwTG5ZQW1MMkVET1E2SGc3?=
 =?utf-8?B?ckxNcFhnS1RqNTI3d1UwQW9hTHoreWZZLzFwcFE3eXlVZmVCaW5ZUGxTczhE?=
 =?utf-8?B?MVdvTU5UMGFkalNteHZ1ZTRCMmtWK1RXZjVwZmlacElTMUpGUXBVODZKbXhI?=
 =?utf-8?B?V29KSWtHWm5HWDFKdzhEMTM5RURycVpEZVc5TG5tTlRxRmc5cEtrSFd2bU0y?=
 =?utf-8?B?ZzR6T1lLS3VWMUJVd0MvYlo4VWhMWUN2YmdBUmlqek5hZFBXL25aaDI2UFp1?=
 =?utf-8?B?Z0R2eTY1UVc5NGRSZmxnMVJ4a0FVT3h3dFBpQ0IyRC9hVXFqamI4eEdseHBz?=
 =?utf-8?B?RURISjNaV0E0WC8yeSsxNnVmekZxT2xmS1BSOFdKQVJ5VjM2MFlicWJjZHZq?=
 =?utf-8?B?TjJGcWJ2TGs3N1ptZWY2ZkVrVTZBYTNmdThLRGhFV05jaGs5MGs5eEJxelpy?=
 =?utf-8?B?eDBDU3NKVXNtRmpHY0dzUzRZREZpRkpDNDVMZXBTaUE1TFhtQzd3Zz09?=
arc-seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BTAT20VH5NzOavBbMkdD+OMtEWKjk1gk+ankKyI8TcOqhonKShXE24ak9b9OaHkfShm5nNCj0Q7DPWeeVC+v/WekQVuwlrDNLGfMWtxSDn5Dk7R96SnDybn1KwigHQMxn+Yl2JOe/oQT8iq6boCn/PMAourKXuh0JijvKqiHpMr5Jr7vT4Wx+DNTWuBe9KwOGplPr6yBLhRd4OHsW6xzxcvirFS0Ds8st4Bje5IgquhH+xcgjlpzIVspYZnKORsaW4f63Umhj6vdQMUIqeWxqw1olAyUpSU0245HqyUqTHxzJxjJINZZx+aLdilTs6q5ZkQewRMEuM+EJRAoPF5IcA==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L48sWvAHz1xB0r2uf8ZZ0PhUxsEpzAqWv7furWQakaU=;
 b=ioEBO7fXSPyajPlNRzadK03beMeAEY/oEBDPE+wOnQ7009LRW1YIDcaj5DmHZOwotUNb9INMo1TZaiB488ldoBcME4qPkBVRmmynMGuDNh7J8OBokSFEQko18Qk5v16wEFTaFGq3kMJSLogDrbv4hYvJmUnJujdhKnw0ObvL/ajSAK/zBeMjAVMmP/gGXC6rFOX8TOSYiLTwE8pkDL65aRNQocXSz2czwZUEr+MGiLIsvJgUrzhlCVWyOLrb/s3AloR8zDixaNjiwU6xUW0obXAuLv8BWjbf1bY8RpE8GUxgFEqaepR+mLqxJnc6vsD08AB+vxyo5zbXyhv4tKosFw==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
x-exchange-routingpolicychecked: fVxciwUyOJ9DqwHyGTpN9EcJpxg5dRdo2XGK+HtlhR2CiyNodGcU7+1EMekdrLvHx4f/RcW4Lx1Tf3IFn5sXGQJQKvANIIUeIKCAqfQ6x71HqP3VcXFgqT93Sr3P8bFZfqJhnYn0pR8JeehwPB5n/L8zmaeWO0tbFj+clu1uoCoKRGowrSxU6EzKdNWfKGhtWuILxZxP4NYchE8UMXf9czGXeybv+P4sibCgZAxHvkpg0gcoq6n0TWyIhYLw1q7x2ivQPP1g6bXFIfb+uc/b0e0oWY3Plac0gFcGiqWanYTiLEAgDAPjfi0FSScQolJmll2RcjcUqvQqY/3bxcnHVw==
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: DM4PR11MB6360.namprd11.prod.outlook.com
x-ms-exchange-crosstenant-network-message-id: 79bd5c22-3e0b-49d1-6c9d-08de757a5bd5
x-ms-exchange-crosstenant-originalarrivaltime: 26 Feb 2026 21:02:32.0235 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname: u0N/WXEHg6c7a4Z2UCQyUfaB3Eo2BIbmnsNrGRcSgjxY0LXtMrxr4fCj1UX5yO2zrP4DDLKzDounyF1yRlCALQ==
x-ms-exchange-transport-crosstenantheadersstamped: PH0PR11MB4853
x-originatororg: intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jouni.hogander@intel.com,m:intel-gfx@lists.freedesktop.org,m:intel-xe@lists.freedesktop.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[uma.shankar@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email,intel.com:dkim,DM4PR11MB6360.namprd11.prod.outlook.com:mid];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[uma.shankar@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 2B9C91AF5FE
X-Rspamd-Action: no action

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSW50ZWwteGUgPGludGVs
LXhlLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgSm91bmkNCj4g
SMO2Z2FuZGVyDQo+IFNlbnQ6IFdlZG5lc2RheSwgRmVicnVhcnkgMjUsIDIwMjYgMToxMiBQTQ0K
PiBUbzogaW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgaW50ZWwteGVAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnDQo+IENjOiBIb2dhbmRlciwgSm91bmkgPGpvdW5pLmhvZ2FuZGVyQGludGVs
LmNvbT47IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gU3ViamVjdDogW1BBVENI
IDEvMl0gZHJtL2RwOiBBZGQgZGVmaW5pdGlvbiBmb3IgUGFuZWwgUmVwbGF5IGZ1bGwtbGluZSBn
cmFudWxhcml0eQ0KPg0KPiBEUCBzcGVjaWZpY2F0aW9uIGlzIHNheWluZyB2YWx1ZSAweGZmIDB4
ZmYgaW4gUEFORUwgUkVQTEFZIFNFTEVDVElWRQ0KPiBVUERBVEUgWCBHUkFOVUxBUklUWSBDQVBB
QklMSVRZIHJlZ2lzdGVycyAoMHhiMiBhbmQgMHhiMykgbWVhbnMgZnVsbC0NCj4gbGluZSBncmFu
dWxhcml0eS4gQWRkIGRlZmluaXRpb24gZm9yIHRoaXMuDQoNCkkgdGhpbmsgaXQgd291bGQgYmUg
Z29vZCB0byBjYWxsIHRoaXMgYWxzbyBvdXQgYWxzbyBpbiBjb21tZW50Og0KIlRoZSBTVSByZWdp
b24gd2lkdGggc2hhbGwgYmUgZXF1YWwgdG8gdGhlIGhvcml6b250YWwgd2lkdGggb2YgdGhlIHRp
bWluZyBiZWluZyB0cmFuc3BvcnRlZCINClRoaXMgY2xhcmlmaWVzIHdoYXQgaXMgbWVhbnQgYnkg
ZnVsbCBsaW5lIGdyYW51bGFyaXR5IGhlcmUuDQoNCj4NCj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcNCj4gU2lnbmVkLW9mZi1ieTogSm91bmkgSMO2Z2FuZGVyIDxqb3VuaS5o
b2dhbmRlckBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgaW5jbHVkZS9kcm0vZGlzcGxheS9kcm1fZHAu
aCB8IDIgKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCj4NCj4gZGlmZiAt
LWdpdCBhL2luY2x1ZGUvZHJtL2Rpc3BsYXkvZHJtX2RwLmggYi9pbmNsdWRlL2RybS9kaXNwbGF5
L2RybV9kcC5oIGluZGV4DQo+IGU0ZWViYWJhYjk3NS4uOGIxNWQzZWViNzE2IDEwMDY0NA0KPiAt
LS0gYS9pbmNsdWRlL2RybS9kaXNwbGF5L2RybV9kcC5oDQo+ICsrKyBiL2luY2x1ZGUvZHJtL2Rp
c3BsYXkvZHJtX2RwLmgNCj4gQEAgLTU3MSw2ICs1NzEsOCBAQA0KPiAgIyBkZWZpbmUNCj4gRFBf
UEFORUxfUkVQTEFZX0xJTktfT0ZGX1NVUFBPUlRFRF9JTl9QUl9BRlRFUl9BREFQVElWRV9TWU4N
Cj4gQ19TRFAgKDEgPDwgNykNCj4NCj4gICNkZWZpbmUgRFBfUEFORUxfUkVQTEFZX0NBUF9YX0dS
QU5VTEFSSVRZICAgICAgICAgICAgMHhiMg0KPiArIyBkZWZpbmUgRFBfUEFORUxfUkVQTEFZX0ZV
TExfTElORV9HUkFOVUxBUklUWSAgICAgICAgICAgICAgIDB4ZmZmZg0KDQpTcGFjZSBpbiAjZGVm
aW5lIGNhbiBiZSByZW1vdmVkLg0KDQpXaXRoIGFib3ZlIGZpeGVkLCBDaGFuZ2UgbG9va3MgZ29v
ZCB0byBtZS4NClJldmlld2VkLWJ5OiBVbWEgU2hhbmthciA8dW1hLnNoYW5rYXJAaW50ZWwuY29t
Pg0KDQo+ICAjZGVmaW5lIERQX1BBTkVMX1JFUExBWV9DQVBfWV9HUkFOVUxBUklUWSAgICAgICAg
ICAgIDB4YjQNCj4NCj4gIC8qIExpbmsgQ29uZmlndXJhdGlvbiAqLw0KPiAtLQ0KPiAyLjQzLjAN
Cg0K
