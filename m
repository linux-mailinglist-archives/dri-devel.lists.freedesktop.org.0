Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 785C5C0844A
	for <lists+dri-devel@lfdr.de>; Sat, 25 Oct 2025 01:00:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CEC710E229;
	Fri, 24 Oct 2025 23:00:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="elLbTskC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B643D10E227;
 Fri, 24 Oct 2025 23:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761346836; x=1792882836;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Kzfm2DkT3xvsTxfu7jmJesklPi+yUv2Tpwl5izxDhFw=;
 b=elLbTskCasRF6gZjU1UJfT9BxgXaDNFDeRBp7z3wFOECi/vMLqeC+xaC
 189e6r3ef4e3BAkF0UgyZBwjl0JGHtlljHQqJA3IA3ecCM6F9wgJQspZJ
 X8GzvVKWoSX1JJ8OLLo9mQKqwLiqVN6kbLi/uv3ukEqAI5knOZ6zZ4fnB
 0taGfFZYfF9KLxyZVP1kOs+A+Hjqa4CJLAI6atOIyVoUHLjDzHyvs8CD/
 iH/MP342AaKGlkDnF+cs961RCI/uSc6L9xO4S5pjT36WJhI0IoTGZa48H
 QtmDlGP1rMwuOdtSvfcFkmxZPnbQMZ52CheRQ9GoSkzHNeR2xFxJPncIu w==;
X-CSE-ConnectionGUID: Ti4Wvx9tSgeREvQu0IEWYA==
X-CSE-MsgGUID: fbKlQNmTSBWPZ6nV88b5cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="81157017"
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; d="scan'208";a="81157017"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 16:00:35 -0700
X-CSE-ConnectionGUID: dTmYWFlGRHWOBjOqgdgLpQ==
X-CSE-MsgGUID: UvM46KKNT66TM/04jGDcFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; d="scan'208";a="184610400"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 16:00:35 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 16:00:34 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 24 Oct 2025 16:00:34 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.47) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 16:00:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kiCPlptCWtfBzfnwcsrTEvbA7RyPF0fX3uOWsqhYEq2g8CjnqHHcBUjHLp3CShAkhB8s3h2rE3AXP9XCRzvOrrCzxkuml5CPG9puWF4gDe8MMCwWKjcwDAOu+tOlDn/1ytpIzbSpD29Vrnn76liS4XDbM7nTKPFi/54e4VhEm+FqezLQDucjUKBDkA+AWT0eLsDgZiPeLcBzG22fLm9P+ak1OK9F54avbL4vz/m4Zb3cT9uUozglHNQ3YiGhSzTDjFDbWp9ElDiSQ7Abc1a17SMJkYNiz66W7EmPOwnB6fuJSqrBc6x5lUnmwAFyTw9r3HhNyK/H8tw3tlLaCHZp/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k33zUOuTfK1o/b7AioTxbaa+nRnIVH+wYDL5HbbEstw=;
 b=O4gKvphleOK4OSorM+V6OxATcF1xPTGc9LlIop8ysImA5a7zVbWu3FNFdhbIDGwIwO0sv0PYM183HZgfeRiT7mSe0y/RwupCMiqzN/6AhT3xYF5H/cc1NY8W5udaMohgajz1O5SzJefuozGzUaafdrzkhTu652mDQIBX2V+Lxf76CiO7dBHiVxLox7VaJdegxQ6nF4aQJlH5nABhV+lzyNr0b+ZAEfdSDupP+0NOnoqJZHs7WPMFdGHe3KX0TYovvh9x9XIrbEYO6FzcWpZrke1wxQC8lTLkUfybYQMhX+jP2BZGNa29UgljGuHRwa1bI4sCaflNiUwMAIxHWiCxAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB8176.namprd11.prod.outlook.com (2603:10b6:208:452::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 23:00:32 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 23:00:32 +0000
Date: Fri, 24 Oct 2025 18:00:28 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Bjorn Helgaas <helgaas@kernel.org>
CC: <intel-xe@lists.freedesktop.org>, <linux-pci@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Ilpo =?utf-8?B?SsOkcnZpbmVu?=
 <ilpo.jarvinen@linux.intel.com>, Icenowy Zheng <uwu@icenowy.me>, Vivian Wang
 <wangruikang@iscas.ac.cn>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Simon Richter
 <Simon.Richter@hogyros.de>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>
Subject: Re: [PATCH 1/2] PCI: Release BAR0 of an integrated bridge to allow
 GPU BAR resize
Message-ID: <o5rhgujo2ftmmnqdwpmbr44nlm6ygrouamoxziomlhnsbkww34@cp2zgmc4luhz>
References: <20250918-xe-pci-rebar-2-v1-1-6c094702a074@intel.com>
 <20251024224401.GA1371085@bhelgaas>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251024224401.GA1371085@bhelgaas>
X-ClientProxiedBy: BYAPR01CA0037.prod.exchangelabs.com (2603:10b6:a03:94::14)
 To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB8176:EE_
X-MS-Office365-Filtering-Correlation-Id: ec81b2d7-faea-4975-66f0-08de13512232
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?XybcBtO2GD4EMZSfJvKVT9EUovNpiRBRWZsVWv1286uxSoW/IkjZZ+IsOB?=
 =?iso-8859-1?Q?77JW042UkiOlgq7U/eosRUkQKEMtbqUHIeWJHvy8+R/PJASMoRy/+jgZK8?=
 =?iso-8859-1?Q?6fQHdB0WAXw1rqDDZsyG3UW71FHoEkW/JN+sxVNHivqmngtPWyCEyxFv6z?=
 =?iso-8859-1?Q?nWN9RucF/yYi1pSvneTi8z+YxlQWkbYbew40se9Mgx0VIGPN64Hcm9S92M?=
 =?iso-8859-1?Q?BG5xYaktS6Jo9qRlwKiGpY/MQKVx2W+LHNqm+oD94+E5R82clgTCgiNjhm?=
 =?iso-8859-1?Q?6ZoxXLCPaDAWQD88Jyq/VpcXEbX5EzGuxCjBzY+LyEbiLa+QKY+Y2e9jFS?=
 =?iso-8859-1?Q?EixLMnPnIgbD+XiGep3gn++tW8zYxznn16vVTO2Rgbq1zIT9kKucd2WGJt?=
 =?iso-8859-1?Q?RRlVM8K1Mcrpjrri8ClhnmCr7UJHYWfMGWenuI6tBQet7+Q6G/3X7FC4Ov?=
 =?iso-8859-1?Q?VMqSC9KA6q3G2fEvoS+dG7LoQLuVdNPlhMy/NUa4m1/cWM5/7LVhF7pMdo?=
 =?iso-8859-1?Q?ovTmrIQeKqU7atfyUw24+jG/mM9koZ8VKvLII/fJa+kPOG5uzvFXd7D5j+?=
 =?iso-8859-1?Q?VHpNmEcZQ/EYrqwW98w8Mgvyv3qF9+oXYUeKm43JWML3IZmlYRj7Us1+P1?=
 =?iso-8859-1?Q?IN2bsdL/fj0edJKX35GdTK4iQ+jezIGi3EgO6iq5s3p+5KyuIerym86FrA?=
 =?iso-8859-1?Q?w7eGQDT9Fe6VbEqG7aWWqQdSTsJM9maDJgXVW+QRW6B/sjDqlHx4NRMa9X?=
 =?iso-8859-1?Q?WvsZwimH6H9hGr1GR5sx3qIbMEq29Yf7gdi7dcgHd4T8gLpq98NbxFPP2L?=
 =?iso-8859-1?Q?CyC11BgNQeUz7X2bd6eDdnTK6m+SwTo+fPI+QH7mrA8FsKdJ2ZshyTGW1U?=
 =?iso-8859-1?Q?Umm/kolTYbPxXAZ4GJjBu09RSqms+nVR9JNDNO3cFb8yFnteV2NBZR7iEG?=
 =?iso-8859-1?Q?04Js6lLuWoVn5rq5aMDFuK8lTkmcuB9a3bCUs9MdXKodypFxd046D4q4qn?=
 =?iso-8859-1?Q?1dJ0sgyYjaTYVw3zJSfO/kBhi/mDM8IQCfHcCAEX+Vevk2iHWopUAsREEd?=
 =?iso-8859-1?Q?PMtzoXZEA8Kiy6EprdjMsmNGbOhabYytgEvT/TgfLZXKX4UYxGY4uEF0cM?=
 =?iso-8859-1?Q?F2gclScpy5ljXDJlopWZjj56HZmJgD2rT4YKT+WZNvcIqrC1oLixVEQC79?=
 =?iso-8859-1?Q?ahAJpu+MXleZbOeMr6H31GHtb0M/o9RuSsl57tr0qfKMJgFgsqXmFq+8hT?=
 =?iso-8859-1?Q?WMYD3Fy6qWgaTiSeCdBeIRJborLhy1izSUNjZz3knd2N8tDz/fqid3CBjR?=
 =?iso-8859-1?Q?jAs4/hH7Djk/ME4LOJ44l+5qc3OalvO3SRPGlqtArCmVvxtzygV5OvJ/yX?=
 =?iso-8859-1?Q?apKsQe/Qcs7UzXo1k5xNGorD5yB8YDXtRWUD5aP3RyMlRgc8QqI2oWwHsa?=
 =?iso-8859-1?Q?hOofLuJeIKqDy2gxah7OxA9hBJ2gijFa0Z1SM8sSArbbFZnDUw5PdXfYpA?=
 =?iso-8859-1?Q?1xw3ruxTGf3fiJc9sDYQz0XUmOPqpunJSNiqtCPCWYzA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?AuHcabPaoizkjnMjmXDa2tCg+wznSeJ/EXMN4Om1tWwAbkcqQ3+CoWNRQX?=
 =?iso-8859-1?Q?UzT1a4qCIwL9VFDxCKZ7TPigbSrnE42IS61oWM7Ew7BWCideds6IS78Ut4?=
 =?iso-8859-1?Q?EpujMnUbaqAxVSL7uph0laO3K81vp1/bIcRxHjuoLpx9Jujk4DA+f4I5Tc?=
 =?iso-8859-1?Q?MJtJmpCpGaeq96clvTESSIJ8hXgADnOrMj4Ll9U/DdyUPdxQX1dRc/g/Pf?=
 =?iso-8859-1?Q?NIgy7+BXC5ZSenrH52Dx3cITVQNdh/c2jXoK3Kr/oGrCnVQ98K4Pgu22/5?=
 =?iso-8859-1?Q?sYwTYIIt6+iAdTiZDgiTuo6GF7hZg+xYZdmkN1NmwqNfJudRb10sNE8MTh?=
 =?iso-8859-1?Q?ncEk+5uS2YFKkQTqhoSeC3yReGSljoC+O5M9faBbT0ul3es8BY9mqMLNyG?=
 =?iso-8859-1?Q?8nztvMJxL/zrd2rhesiGxNZqFEIbDecjqlDg/EruSjuH/E/r5U8yp7+mzX?=
 =?iso-8859-1?Q?xvwIj+4/nW5HPYOjI66GwKmFeAB5200aGCuACMNn6cMOKBuD4NTkL8tPg0?=
 =?iso-8859-1?Q?AEuRyPnwENfKCMM4laPBkBbG7UaOFxWLqUUStQoQZYWSoWaXSYp4Z+rzE7?=
 =?iso-8859-1?Q?wJgbJKVprv0H+Mg51f2DWgioFBhVtrhN6eh5Im0DOyWSG+sF1tfO4qrTW9?=
 =?iso-8859-1?Q?bDt6enL1U3XLf+nCu2NICLP0I9BXKEpQwbvJBAmlukkLvt/cjS87lV6EYG?=
 =?iso-8859-1?Q?Vt+21OA1Sm3zzMJ2u0lojxX9GHA3NXBVa8S9BV+/xJP72sxR4lOQLEizy+?=
 =?iso-8859-1?Q?SC9kXN0KhAXyiOhcNgNaIDbWUs6H8ut0Wb+GdXr7gnFw3AgpMuxq0HIpOG?=
 =?iso-8859-1?Q?9sWnyGT6HtCy7ZgdytYK3zxel9kJsUHrxXb1u7BXEPM01nPeifChUQANuf?=
 =?iso-8859-1?Q?iT09UnSPP3s9rIjV82ICncM3PGL4tt80hNdJspQBvFtfBNN1nLG0ZikRIn?=
 =?iso-8859-1?Q?9DtG00cKpOeXeeQuLIGWubkBhiQFeyGc/MqFOlpDgo1TjqkmdSA4GNUBDX?=
 =?iso-8859-1?Q?vGNQsvcbYIqvjLSsFgg0B19TjS9oxx3hU4Jb32/R+SMaq+VVoRMObj1ZlA?=
 =?iso-8859-1?Q?0Ttz+jqF3YEeIMzCg5MjhRl+TVZyyo4gqRfv/l8TRmM4mcgjMonrPuFjQr?=
 =?iso-8859-1?Q?68aViR3gBC+HyIql3Mlh+0orRLAtIuXi4BckU8PNio2h04kKppt65nGxcJ?=
 =?iso-8859-1?Q?DIGvapPzdCJp4Yc2gzkAqj+VYG5SaBqLIvdt4TN0FVM6BJPKlhf5bW7Jxk?=
 =?iso-8859-1?Q?u2+hMrexPaZ0ltzxl3yiICxmZabyZKLN0LiEbCswgtnJiGmB8IhlSXtIwQ?=
 =?iso-8859-1?Q?f739qIg4ENaSIRFv05H/5llVHDPdjfe1DZ+FMDTMdplNhylrrPB75lOGJI?=
 =?iso-8859-1?Q?RQOyx5Z21Ux2vihiXEFe8L1+mnOD6U07itH/SlGsrZxz3pRDhtqbPklsvx?=
 =?iso-8859-1?Q?jwIk+9wosR9YIAb6VeCMk/6Vl8HxeXp7YlRKyrfXjsS15yPS80FYPBv68f?=
 =?iso-8859-1?Q?uJcSY++sD+hJwgDx/i8nvbUYcZOk7tMjHPQTONBH6AxkLIhua0TOFi1ftp?=
 =?iso-8859-1?Q?NacZUFOf+XxL0SAIJ6eaLoKbjEguU2wN8v6mpsIAIjcYd+2OI00S4n9+gt?=
 =?iso-8859-1?Q?RUxpwS/Dsq3jWCZYze7idGGpWGFsp6+8lzvqQC5tQWYv5BoneAbEx8vw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ec81b2d7-faea-4975-66f0-08de13512232
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 23:00:32.1869 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kv7nqZDe9+egUUsmWwDle0jxvBDUpEgEi/HxK/30YZwLvt9W99cbno8PGoS5T0BDls/Pb2Mdk6Iy6w47Y8r/o9GOFwCMrmWB78OS/qq4td4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8176
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

On Fri, Oct 24, 2025 at 05:44:01PM -0500, Bjorn Helgaas wrote:
>On Thu, Sep 18, 2025 at 01:58:56PM -0700, Lucas De Marchi wrote:
>> From: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
>>
>> Resizing BAR to a larger size has to release upstream bridge windows in
>> order make the bridge windows larger as well (and to potential relocate
>> them into a larger free block within iomem space). Some GPUs have an
>> integrated PCI switch that has BAR0. The resource allocation assigns
>> space for that BAR0 as it does for any resource.
>>
>> An extra resource on a bridge will pin its upstream bridge window in
>> place which prevents BAR resize for anything beneath that bridge.
>>
>> Nothing in the pcieport driver provided by PCI core, which typically is
>> the driver bound to these bridges, requires that BAR0. Because of that,
>> releasing the extra BAR does not seem to have notable downsides but
>> comes with a clear upside.
>>
>> Therefore, release BAR0 of such switches using a quirk and clear its
>> flags to prevent any new invocation of the resource assignment
>> algorithm from assigning the resource again.
>>
>> Due to other siblings within the PCI hierarchy of all the devices
>> integrated into the GPU, some other devices may still have to be
>> manually removed before the resize is free of any bridge window pins.
>> Such siblings can be released through sysfs to unpin windows while
>> leaving access to GPU's sysfs entries required for initiating the
>> resize operation, whereas removing the topmost bridge this quirk
>> targets would result in removing the GPU device as well so no manual
>> workaround for this problem exists.
>>
>> Reported-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> Link: https://lore.kernel.org/linux-pci/fl6tx5ztvttg7txmz2ps7oyd745wg3lwcp3h7esmvnyg26n44y@owo2ojiu2mov/
>> Link: https://lore.kernel.org/intel-xe/20250721173057.867829-1-uwu@icenowy.me/
>> Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
>> Cc: <stable@vger.kernel.org> # v6.12+
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>
>> Remarks from Ilpo: this feels quite hacky to me and I'm working towards a
>> better solution which is to consider Resizable BAR maximum size the
>> resource fitting algorithm. But then, I don't expect the better solution
>> to be something we want to push into stable due to extremely invasive
>> dependencies. So maybe consider this an interim/legacy solution to the
>> resizing problem and remove it once the algorithmic approach works (or
>> more precisely retain it only in the old kernel versions).
>> ---
>>  drivers/pci/quirks.c | 23 +++++++++++++++++++++++
>>  1 file changed, 23 insertions(+)
>>
>> diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
>> index d97335a401930..9b1c08de3aa89 100644
>> --- a/drivers/pci/quirks.c
>> +++ b/drivers/pci/quirks.c
>> @@ -6338,3 +6338,26 @@ static void pci_mask_replay_timer_timeout(struct pci_dev *pdev)
>>  DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_GLI, 0x9750, pci_mask_replay_timer_timeout);
>>  DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_GLI, 0x9755, pci_mask_replay_timer_timeout);
>>  #endif
>> +
>> +/*
>> + * PCI switches integrated into Intel Arc GPUs have BAR0 that prevents
>> + * resizing the BARs of the GPU device due to that bridge BAR0 pinning the
>> + * bridge window it's under in place. Nothing in pcieport requires that
>> + * BAR0.
>> + *
>> + * Release and disable BAR0 permanently by clearing its flags to prevent
>> + * anything from assigning it again.
>
>Does "disabling BAR0" actually work?  This quirk keeps the PCI core
>from assigning resources to the BAR, but I don't think we have a way
>to actually disable an individual BAR, do we?
>
>I think the only control is PCI_COMMAND_MEMORY, and the bridge must
>have PCI_COMMAND_MEMORY enabled so memory accesses to downstream
>devices work.
>
>No matter what we do to the struct resource, the hardware BAR still
>contains some address, and the bridge will decode any accesses that
>match the address in the BAR.

there's no real use for that BAR, so I don't think it matters if the hw
will still decode accesses to it - in this case I don't think it's
really important to really disable it. As long as pci can manage the
resources and not block the move of endpoint's BARs, it should work.

These 2 patches definitely fixed the rebar for me in a system with
Battle Mage GPU. I don't have access to it right now, but I can dig more
info about it if it's needed.

>
>Maybe we could effectively disable the BAR by setting it to some
>impossible address, i.e., something outside both the upstream and
>downstream bridge windows so memory accesses could never be routed to
>it?

yeah, I guess that would be possible, but given the above, do you see
any advantage on that?

thanks
Lucas De Marchi

>
>> + */
>> +static void pci_release_bar0(struct pci_dev *pdev)
>> +{
>> +	struct resource *res = pci_resource_n(pdev, 0);
>> +
>> +	if (!res->parent)
>> +		return;
>> +
>> +	pci_release_resource(pdev, 0);
>> +	res->flags = 0;
>> +}
>> +DECLARE_PCI_FIXUP_ENABLE(PCI_VENDOR_ID_INTEL, 0x4fa0, pci_release_bar0);
>> +DECLARE_PCI_FIXUP_ENABLE(PCI_VENDOR_ID_INTEL, 0x4fa1, pci_release_bar0);
>> +DECLARE_PCI_FIXUP_ENABLE(PCI_VENDOR_ID_INTEL, 0xe2ff, pci_release_bar0);
>>
>> --
>> 2.50.1
>>
