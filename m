Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A487B05FE9
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 16:10:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDB5010E5E6;
	Tue, 15 Jul 2025 14:10:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V4tPlpMC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E30810E5E3;
 Tue, 15 Jul 2025 14:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752588653; x=1784124653;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=bOdgpjoD4ap7wwD+SWmFeH+O2Ry+dD/AhYJfw8CtiQg=;
 b=V4tPlpMCH4mE/qAriiXZ9JdJCWG1/8169UJL2BmGsfNhqY3vEGedTzGE
 5geGHBKeWA/ZDANH12MjOl8ZshGyNk2NHRye6l5t656oDKCavAAXBrrhr
 F8Jpb8w0NMQwcJdIWt+qySiZVj/YCswqODN9wa6p2M1t+MF/cLzOXk4v+
 bUnluetLG24EjCRSlXHT0fpPaB/M7denQHtRXMkIgi51ZjbqeCDWTDie5
 c5+5ytzqo/Kn+fvrTQAZHix173/20IoxT8lWLe08l5hGub88e/C6T9fb3
 sc6mIVE7zZmI8Ve7NcWgzLJVJDtHumhX/zuZQvu6SiKHxUVEvkcyoAi6d A==;
X-CSE-ConnectionGUID: r0O4tJ47TM2tghOV5DyVGQ==
X-CSE-MsgGUID: mQBFa+UiTJiOjzQ9SlZkpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="65069462"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="65069462"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 07:10:53 -0700
X-CSE-ConnectionGUID: uEKBeLUCT8+6z4aaLGZCiA==
X-CSE-MsgGUID: 5E6Ua1aoRCabV15LN5+9eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="157737466"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 07:10:52 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 07:10:51 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 15 Jul 2025 07:10:51 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.83)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 07:10:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W6xImEfRaFWSqby1KzHYaQW4+/L1aD+R3WopYsBGcI1Fg4CnKg82s2N3/p40ecu6Uc+yIhElG6E8QF9wCGhQa1UGGamRCRdWqa7ohePsH3pkYPnTPGYdjAFv271OVDYG1pyBKG2545U/zG/kyTnsq5VT9VyaMq5MYpI58JT0mtZvySyXrLuimFaHhzxaGHZXDlM7fqBPd0STOZDwFuUAIBs9L78FBWtxG6nO9CCW/9aMzeUVXq/3niF7H7peaiPB+QNjb+GDJS3lwYsWwQKfGC/3jstkEniSufd7lmkoQr5Hs6Oj1aS/gGz9YEqwDcFCYKcZ71AGx1Jz90C9uA5VSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bOdgpjoD4ap7wwD+SWmFeH+O2Ry+dD/AhYJfw8CtiQg=;
 b=pjVquLUBU7k62ufJxnwLx1jpB6hvOLVNv2t2iuSvUiLiQqGKlOvOk/2+MdkBcDzSHqGuhpWKAiu6uZB+cJGzOFo9C6s9PBLiOxgbSk2LZ8K1yyhJatTHW9yjODnvTN9mf/1+ZjplFBWeD9aFLWm8A+gtoeJQMn3BeNELqMQa1Cx78mZ5s9+PwhFA1br2lCeb+4lnGCo0Ja+3BwKMGhxHXQsZrLoL4zbXKAoqgeSV37/wLIv1MWxmfXSwean+TeNZF3Y1bGUZprqydM7mRoWJSfX8twctw/5wOHQS0o2gR8/BbUrzqMo/f9Klz+CoAbzxIWE7Bt28VdZR/lfB+qeLkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 PH7PR11MB8034.namprd11.prod.outlook.com (2603:10b6:510:247::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.27; Tue, 15 Jul
 2025 14:10:19 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.8922.028; Tue, 15 Jul 2025
 14:10:19 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Tauro,
 Riana" <riana.tauro@intel.com>
CC: "simona.vetter@ffwll.ch" <simona.vetter@ffwll.ch>, "Jadav, Raag"
 <raag.jadav@intel.com>, "Anirban, Sk" <sk.anirban@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Scarbrough, Frank" <frank.scarbrough@intel.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "aravind.iddamsetty@linux.intel.com"
 <aravind.iddamsetty@linux.intel.com>, "Gupta, Anshuman"
 <anshuman.gupta@intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH v5 9/9] drm/xe/xe_hw_error: Add fault injection to trigger
 csc error handler
Thread-Topic: [PATCH v5 9/9] drm/xe/xe_hw_error: Add fault injection to
 trigger csc error handler
Thread-Index: AQHb9XKKSjvAD7Ng5U+0QmMgcuwvGLQzOX0A
Date: Tue, 15 Jul 2025 14:10:19 +0000
Message-ID: <e1d33079c2213534ce33df56a2381604f570960e.camel@intel.com>
References: <20250715104730.2109506-1-riana.tauro@intel.com>
 <20250715104730.2109506-10-riana.tauro@intel.com>
In-Reply-To: <20250715104730.2109506-10-riana.tauro@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|PH7PR11MB8034:EE_
x-ms-office365-filtering-correlation-id: 09138868-6ac8-437f-74f7-08ddc3a954a5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?M1I1Rng1RlhHYTFEZFBnSEdxc0RBRjY5SGI5eFdhRUNOVjNpN1BFMzVrTzh6?=
 =?utf-8?B?RWhZUk04QlZKT01PdldkaTQxYmlyN09iakpGYVQ3RUFrTHBHS01UcWFVUjBM?=
 =?utf-8?B?dnVXa2M3b05xZUlQWlplK1FXUFJqZFFwQzJnNHhSNk1WdkZMcHZRbFd2TDh6?=
 =?utf-8?B?WTBSaUdISDRWSm52djBrNzdDODBEaEpISm9nVVFKanQ1MVYxQkRWNkt4KzZV?=
 =?utf-8?B?SGVEeDZBZGVlNGRXaDQrdGwwakdneHhCbks0QjN1T2xiNDQrK2tOOFVTNktx?=
 =?utf-8?B?aTBFUTZMRXpaL0pFUmtJZWI5Wk1vQkNkUk5IVlpwWDRJai9yL04yV2xVYmFF?=
 =?utf-8?B?T1BFb2Z1dEhnam9uY2JWZk41L2NLdEVYRXVRMk82RHhNNHJBVjZKaTFrMC8x?=
 =?utf-8?B?ajJoWk9pSURzSCtMRlg0eE82Z1E0Q0lZYWxZNmpCdUR6TEthaEJKV1JFa0tC?=
 =?utf-8?B?NGtQK3RIKzNWOE54RWtoQ0J3SjlLZUNjNWxqWkFEQ1JQbmVhNE9tcjBrcVhh?=
 =?utf-8?B?L25CMjV1N2tiSlVJR3I5R1Y4QmZnczY5SmphTWdjSlRFMjYyZVFXOEhxQjh0?=
 =?utf-8?B?aXFnZGtNcS9Na29aOWtQaUtxc2xFRVljajVuWG00dzRyZFhLYlpjeTl3OTI4?=
 =?utf-8?B?THlCaEFlMnJOdmxLNW1YMytwYUIySWNDTU5yUHlmUW1SR1Zza0VNeHRBc29h?=
 =?utf-8?B?WmhUZEMrWWR0YnVKbE9GeTJTcG9OTjEzSk1jZVkzRGRrdjAvZUhaZ2tQZk9F?=
 =?utf-8?B?bnduUHM3RjF4WS9oU2F3cFAzOUhySmswQkFueTlCbUE2M2FnVkYwUGZvOXFI?=
 =?utf-8?B?TGZxNlA3MEc2dllTS3ppekNuQ1V2clZvNTZKOUFIT2p6a1NlY2t6OVluRzBh?=
 =?utf-8?B?Wjg0TVhnZzUybnhnZWFnU2k1QkZSTTlVQzRaRHp1L1BQbUFWSnY0MytFREpN?=
 =?utf-8?B?anJ1cGROaHZ0bTJRY2t3WncwNmRGWjRYOFJoTUlPY29NOXR0d2hRWGxaNVBS?=
 =?utf-8?B?V1FhaUxRbFlLVitxd1pzMnpPcnhxT1R3WW1nbjlQa2ZUbVNPYzBmWmppSWNh?=
 =?utf-8?B?MGN4OE02bk9ONDkzYkZGRFFTWjlCQmt3Q3J4UkJzVXpORFk1ZUo0WEd6Wk5h?=
 =?utf-8?B?cUhxeS9nTmd5TmtISHpheERKaEtwbUZHR0JlM2U4QlYxeE9nU2ZZYzRERnBS?=
 =?utf-8?B?blhtaytvdkEzbTRvN3ZJOUVYSDdpQmpkUGdZNU5nbExacjdOY1Q3L2UxTmdi?=
 =?utf-8?B?MDhSc0FuakcvZTdGZkdNVi81UGRzNjdrWlJOcllyLy93eXU2Q0NvUVlEa0Nj?=
 =?utf-8?B?eWpnTHRuU2pGNExsZXQxclRTaG1abm0wRWpoRC9YQkgwWXpuOThqaVU1TlFp?=
 =?utf-8?B?OEQ3cVNPTVpZUzlrc1RIbDA5MFdScjBkOS9MZFlNREpqVWJjbndPODZITjNt?=
 =?utf-8?B?TmIvbEZ1Z0tobVpmUTlOQ1dSNmRjWm5vSjFaTklxRnh3YkNTNnRqRWZSTXZV?=
 =?utf-8?B?NWVyU01oZlFPdVJpM1ZPNXlRZ1J6ekZBUHp5OUU5T05qaVV1WWdHeWxTQzlT?=
 =?utf-8?B?M21wWHdqQklHVVh4SkJIVGJmczYrdlY5ZHJ2ZDBGTjdxRHZrU2hMdytMQSt4?=
 =?utf-8?B?S1UyQVBmT1BtY2Z4UTNBK01OeCtLOE9ZdTVmMTVnaFhEbW5paXlBRVNYRlJu?=
 =?utf-8?B?WlhpeWNJa1poMGVkc09uQzNPRDVhQWt3M0Y3MEhLelVIWmpzcEU1TjgreUxN?=
 =?utf-8?B?ZEtZeHBOUlU2T0ZreXpHTnp5a0p6SVhJOHVVYVhJZDcrRnNrWkpTNnRkczRX?=
 =?utf-8?B?eDQxdDRxTjdBNklVRHpOZ1NWTytTMDZ5bnl5cU5qQTFvalJxeDZGNE4vWkJ4?=
 =?utf-8?B?WEZ2K0dJYzFJZ0tPL0d1SU1aZyswbXlsSlh4cThyUkt5RktDZWhjL0EzQ0Vp?=
 =?utf-8?B?ZUQxNXRiVjFaK3g1Wk9KSFpkaUcwS1Bhd3FUYjY1cFhyZVZBYWx0b1hhY1pJ?=
 =?utf-8?B?QnlqS3BhT1B3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TGFUWWI3WUZ6YjJvbUtOVmFRMEVrMDhKZkUwcG40QU5aRWpOZTJlTVNrTys1?=
 =?utf-8?B?Vm1JWTNUenNURUt3NTlqYkN2dVdNSkhLdXlkR29iaDFTV0tlOG9JdGY1ZTFl?=
 =?utf-8?B?b04ycExBSnd5a1E3dWpGREpBMDRhVWgyNGJrV1dsRHBWcXNFNUIzWk92bzFP?=
 =?utf-8?B?U0FQRVlhaGxiTjk2ZTFVemNCWVVSVGhKbEhhalp1OWM0YStqTWxEQmlTMzZM?=
 =?utf-8?B?elJwalhTV0k0bStZRXRadmJEa3VoYjBDSmpqREREY20xYXEyM0RFWCtscWpo?=
 =?utf-8?B?OVVad2tFQ1R0QXluWkJYYUlMUzc0MUQ2aHRMeU1wdTF0c2JmQ2FnVzBpdElO?=
 =?utf-8?B?dnU3TktKN2ZWYWsvRlFlcUNPQW1oU3VzZnRadCtQWE1yK2w4VFZuMWVaVm1h?=
 =?utf-8?B?ZjZFRU52ZU9EZ2xMT2ZtbHlJUitjczVNTGY5OGdKaGl0U2kvaGQ3aE4rQkkw?=
 =?utf-8?B?Wk4xN2tPRzMvcks2OVdwUEw3VTQrU0wrT3F3dUdKV3Jha0hXZ2dnc0dENTNq?=
 =?utf-8?B?UGI2VUdHQk5SSnBmckZzUFc5WlA1bUxGUnZUc3Zzbm91aStRWjROVWJ1VUpy?=
 =?utf-8?B?emFQakh2U2RGTGY1WU9xTm83VkI3NzBvbXMzVU9lR3VwUjNibmNvY1JBUG9O?=
 =?utf-8?B?bkVaWmpHVGkxeDZJWVNDeWtITVB5ZEM5bXJndXFIK0swdjRMZkJ4TGR1SjJQ?=
 =?utf-8?B?U2ZpaDZaQ3VlZWN6cjZ5MXlEa2pkTXNzTkZ1QkRzQ1piT0U0Q3BBWHIvci9x?=
 =?utf-8?B?bjE3d1ZhTlk0MDVmK0JCVmdzTUhhNzFSZjhWZlQ1VVlWcFlSZWVubDdnU21v?=
 =?utf-8?B?ckNqRTBYWDFtMExZZzJyUGpGR0NlbUthY2hVYU0rUFVyOHBleTkxV0pPNUlk?=
 =?utf-8?B?WmdKOFhBSzJ5Yy84aGgwYktwN25adVlweXY3d2Ywc2xQWVpVc3VyNGZxa0Fq?=
 =?utf-8?B?dmpFcXNPSXZzK3VWSlFvOVp6eGNHSmVpZVdBd0xtQUdwbzNreHVaZ0ZUWlVm?=
 =?utf-8?B?cDIvV1puQTBhbE9SSjcyc2pNZjF0NzJVblc1RzJpZkVWVjRGbTFsUDhxNnor?=
 =?utf-8?B?UDJ5eWRKNjcwOHpKU2JCM0k4RTRBeExIRG9VY3RBSnlUU0pzaHlPVHJJQmh3?=
 =?utf-8?B?SFJDczFYZkIxaER5ZENVeE1CQnFKUlR3NHNISmNCWUlYQTh2NmRlU1pnK3dr?=
 =?utf-8?B?OStXWWhjeXZjdi82MGJRSmJzbjBJK1VhMm1NVnc0WEx6aUE2dTNpbGZscVFr?=
 =?utf-8?B?NjZYQUxITllyRlRTVy9TZjhIOVNWMnd6MlY3UnNFSGQraDhqaFFIYUNHUmRn?=
 =?utf-8?B?cElVNU04cmlSMzMxY2RBRG9LQWo0VkNkaGxPUnhpVWN6WFhCQ0ZVTjVRcnQr?=
 =?utf-8?B?eUx3Y2pLOWdSMFRPNHE1WnpvbFpabi9lcEI5VVNOUFFpUUIyKzFYTm13MHU1?=
 =?utf-8?B?cjhTdGRBN0dUeFdEZ1FnUGZJaWMvVFgrS0ZDV1l3RHcvb1RlU0RWbWtmRmd3?=
 =?utf-8?B?dUtpSWx3YnFoT251ZW9pVThmVDZNK3h2bnBEYUlrSW9EYXJubmVRcFdJa3ZI?=
 =?utf-8?B?Q2I5Vy92M1pOQVF0amRPMlJVa2x4TVB0ZnlrRmllWWpDMHQ4ZXJWNGF6dEgx?=
 =?utf-8?B?eitmb3grZS8yelluL3R5cTFaOE1tZkkwb3Rvc1kwdWVMTlY2a1pxUTRZT2py?=
 =?utf-8?B?dWM1YUl4RzNlNUl1TWE0c1ZZb2RSM2hSOXNRZHJLc2pSa0xKRWNmZ0Y5Vy9x?=
 =?utf-8?B?bXAzVFJISjBYRm93ckxJZ2FaazJuMnQwWXhNeFE2cUFUR3JobFRvWG15OTNw?=
 =?utf-8?B?UEt5ak9JOFNmalB1YlpDbi9kZHBNL05FNDhNTWJMbWptcjZYZVd1Nm9EQlRU?=
 =?utf-8?B?czlxamk1WXB3RWRqN0lSTE9ybGNod1FsQm5QV254R2VjeFQybXgrL3A1QjRS?=
 =?utf-8?B?TEkyZjc0Qmw3VFFzV1dUcGRHdERkMTBMYWNnNFhWSE9Fb0plWlRPbU01elVL?=
 =?utf-8?B?VGpmZldvM0RrTXJvNHc3MmIzNzJuU3ZNQlQxNU1XMUhKRjdGa3R2Q0pCSzVj?=
 =?utf-8?B?RmljT0IwaFN3bU1BSFB6QkZzSy9wdVFvaUp0QzBmS1lYbzVvcUpBdm54S3hO?=
 =?utf-8?B?cTFKQUsvMGJUS0M1cnRwT3FOc0VITWkzeXZpaFRQZ1Jqb2tldmR1TUt1OENn?=
 =?utf-8?B?NFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <29741D5F56022F4690D7250A29DAC294@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09138868-6ac8-437f-74f7-08ddc3a954a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2025 14:10:19.2936 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UtVTLlGQU65xjTpyEF+LuPIJkbbTpAZ/OQ0LkXSH9qlCgo0CfmzNNrLk7DHbMDs3AjevdejmmFZSSBxSbF+n+lghhobrmt4r03NZM16kMf0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8034
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

T24gVHVlLCAyMDI1LTA3LTE1IGF0IDE2OjE3ICswNTMwLCBSaWFuYSBUYXVybyB3cm90ZToNCj4g
QWRkIGEgZGVidWdmcyBmYXVsdCBoYW5kbGVyIHRvIHRyaWdnZXIgY3NjIGVycm9yIGhhbmRsZXIg
dGhhdA0KPiB3ZWRnZXMgdGhlIGRldmljZSBhbmQgc2VuZHMgZHJtIHVldmVudA0KPiANCj4gdjI6
IGFkZCBkZWJ1Z2ZzIG9ubHkgZm9yIGJtZyAoVW1lc2gpDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBS
aWFuYSBUYXVybyA8cmlhbmEudGF1cm9AaW50ZWwuY29tPg0KPiAtLS0NCj4gwqBkcml2ZXJzL2dw
dS9kcm0veGUveGVfZGVidWdmcy5jwqAgfMKgIDMgKysrDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2h3X2Vycm9yLmMgfCAxMSArKysrKysrKysrKw0KPiDCoDIgZmlsZXMgY2hhbmdlZCwgMTQg
aW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9k
ZWJ1Z2ZzLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGVidWdmcy5jDQo+IGluZGV4IDI2
ZTlkMTQ2Y2NiZi4uOTUwNTdjMDRhMDIyIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfZGVidWdmcy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZWJ1Z2ZzLmMN
Cj4gQEAgLTMxLDYgKzMxLDcgQEANCj4gwqAjZW5kaWYNCj4gwqANCj4gwqBERUNMQVJFX0ZBVUxU
X0FUVFIoZ3RfcmVzZXRfZmFpbHVyZSk7DQo+ICtERUNMQVJFX0ZBVUxUX0FUVFIoaW5qZWN0X2Nz
Y19od19lcnJvcik7DQo+IMKgDQo+IMKgc3RhdGljIHN0cnVjdCB4ZV9kZXZpY2UgKm5vZGVfdG9f
eGUoc3RydWN0IGRybV9pbmZvX25vZGUgKm5vZGUpDQo+IMKgew0KPiBAQCAtMjk0LDYgKzI5NSw4
IEBAIHZvaWQgeGVfZGVidWdmc19yZWdpc3RlcihzdHJ1Y3QgeGVfZGV2aWNlICp4ZSkNCj4gwqDC
oMKgwqDCoMKgwqDCoHhlX3B4cF9kZWJ1Z2ZzX3JlZ2lzdGVyKHhlLT5weHApOw0KPiDCoA0KPiDC
oMKgwqDCoMKgwqDCoMKgZmF1bHRfY3JlYXRlX2RlYnVnZnNfYXR0cigiZmFpbF9ndF9yZXNldCIs
IHJvb3QsDQo+ICZndF9yZXNldF9mYWlsdXJlKTsNCj4gK8KgwqDCoMKgwqDCoMKgaWYgKHhlLT5p
bmZvLnBsYXRmb3JtID09IFhFX0JBVFRMRU1BR0UpDQoNCkknbSBzdGlsbCBub3QgY2xlYXIgd2h5
IHdlIG5lZWQgdG8gbGltaXQgdGhpcyB0byBCTUcuDQoNCi1TdHVhcnQNCg0KPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgZmF1bHRfY3JlYXRlX2RlYnVnZnNfYXR0cigiaW5qZWN0X2Nz
Y19od19lcnJvciIsDQo+IHJvb3QsICZpbmplY3RfY3NjX2h3X2Vycm9yKTsNCj4gwqANCj4gwqDC
oMKgwqDCoMKgwqDCoGlmIChJU19TUklPVl9QRih4ZSkpDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgeGVfc3Jpb3ZfcGZfZGVidWdmc19yZWdpc3Rlcih4ZSwgcm9vdCk7DQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfaHdfZXJyb3IuYw0KPiBiL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9od19lcnJvci5jDQo+IGluZGV4IGM1YjNlOGMyMDdmYS4uZGI3NDE3YzM5
MGZmIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfaHdfZXJyb3IuYw0KPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfaHdfZXJyb3IuYw0KPiBAQCAtMyw2ICszLDggQEAN
Cj4gwqAgKiBDb3B5cmlnaHQgwqkgMjAyNSBJbnRlbCBDb3Jwb3JhdGlvbg0KPiDCoCAqLw0KPiDC
oA0KPiArI2luY2x1ZGUgPGxpbnV4L2ZhdWx0LWluamVjdC5oPg0KPiArDQo+IMKgI2luY2x1ZGUg
InJlZ3MveGVfZ3NjX3JlZ3MuaCINCj4gwqAjaW5jbHVkZSAicmVncy94ZV9od19lcnJvcl9yZWdz
LmgiDQo+IMKgI2luY2x1ZGUgInJlZ3MveGVfaXJxX3JlZ3MuaCINCj4gQEAgLTEzLDYgKzE1LDcg
QEANCj4gwqAjaW5jbHVkZSAieGVfc3Vydml2YWJpbGl0eV9tb2RlLmgiDQo+IMKgDQo+IMKgI2Rl
ZmluZcKgIEhFQ19VTkNPUlJfRldfRVJSX0JJVFMgNA0KPiArZXh0ZXJuIHN0cnVjdCBmYXVsdF9h
dHRyIGluamVjdF9jc2NfaHdfZXJyb3I7DQo+IMKgDQo+IMKgLyogRXJyb3IgY2F0ZWdvcmllcyBy
ZXBvcnRlZCBieSBoYXJkd2FyZSAqLw0KPiDCoGVudW0gaGFyZHdhcmVfZXJyb3Igew0KPiBAQCAt
NDMsNiArNDYsMTEgQEAgc3RhdGljIGNvbnN0IGNoYXIgKmh3X2Vycm9yX3RvX3N0cihjb25zdCBl
bnVtDQo+IGhhcmR3YXJlX2Vycm9yIGh3X2VycikNCj4gwqDCoMKgwqDCoMKgwqDCoH0NCj4gwqB9
DQo+IMKgDQo+ICtzdGF0aWMgYm9vbCBmYXVsdF9pbmplY3RfY3NjX2h3X2Vycm9yKHZvaWQpDQo+
ICt7DQo+ICvCoMKgwqDCoMKgwqDCoHJldHVybiBzaG91bGRfZmFpbCgmaW5qZWN0X2NzY19od19l
cnJvciwgMSk7DQo+ICt9DQo+ICsNCj4gwqBzdGF0aWMgdm9pZCBjc2NfaHdfZXJyb3Jfd29yayhz
dHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspDQo+IMKgew0KPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0
IHhlX3RpbGUgKnRpbGUgPSBjb250YWluZXJfb2Yod29yaywgdHlwZW9mKCp0aWxlKSwNCj4gY3Nj
X2h3X2Vycm9yX3dvcmspOw0KPiBAQCAtMTMwLDYgKzEzOCw5IEBAIHZvaWQgeGVfaHdfZXJyb3Jf
aXJxX2hhbmRsZXIoc3RydWN0IHhlX3RpbGUNCj4gKnRpbGUsIGNvbnN0IHUzMiBtYXN0ZXJfY3Rs
KQ0KPiDCoHsNCj4gwqDCoMKgwqDCoMKgwqDCoGVudW0gaGFyZHdhcmVfZXJyb3IgaHdfZXJyOw0K
PiDCoA0KPiArwqDCoMKgwqDCoMKgwqBpZiAoZmF1bHRfaW5qZWN0X2NzY19od19lcnJvcigpKQ0K
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc2NoZWR1bGVfd29yaygmdGlsZS0+Y3Nj
X2h3X2Vycm9yX3dvcmspOw0KPiArDQo+IMKgwqDCoMKgwqDCoMKgwqBmb3IgKGh3X2VyciA9IDA7
IGh3X2VyciA8IEhBUkRXQVJFX0VSUk9SX01BWDsgaHdfZXJyKyspDQo+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgaWYgKG1hc3Rlcl9jdGwgJiBFUlJPUl9JUlEoaHdfZXJyKSkNCj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaHdfZXJyb3Jf
c291cmNlX2hhbmRsZXIodGlsZSwgaHdfZXJyKTsNCg0K
