Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6529969334
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 07:32:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C3AC10E2C4;
	Tue,  3 Sep 2024 05:32:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AJ06/S1O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6270A10E2C4;
 Tue,  3 Sep 2024 05:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725341562; x=1756877562;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vWrAxjaqv+VY5Kh8xnljtKzJJEST8PDQYsD4dwCr6EI=;
 b=AJ06/S1OmLXa48pwLMhwoSm448ZiKUjOmRmCOGtAH7vPlEYEo71MsKMf
 V95jnntBU08fqbPrTQbPRc7ada3bNFQ+W3z7rkXb0saJXtMoyjakMvRvo
 V2Rej16Rj5oym5p4J0VcoiSSIfbwRrnWLsaPCGE/lEqIL9HNylA+aC+Cz
 OuTgatrcr3gWAsQViULwxNgcQpK9J94ziekoEVjgg5bNul1oEI75n0K/Y
 DIRIPq6BG81ofTES6e1MMP6UaICwnn8ZuxTemHgQ1stHIW14/HZ+bV/mg
 QVPGbnWCF1a7PebNwQjgjz6pUpMt4zrnyUwbq5C7DV5yTTBrGV+9jvtHT Q==;
X-CSE-ConnectionGUID: hgwkEkk/QSmQbkdElBcdQg==
X-CSE-MsgGUID: uWG6jg4fT2y7Yo3OJFD2VQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="34487293"
X-IronPort-AV: E=Sophos;i="6.10,197,1719903600"; d="scan'208";a="34487293"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 22:32:42 -0700
X-CSE-ConnectionGUID: EbMlsbx8RXmfFCqp8a/qQw==
X-CSE-MsgGUID: FT5PtsabRJqe0ui3WYOECQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,197,1719903600"; d="scan'208";a="68920476"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Sep 2024 22:32:41 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 2 Sep 2024 22:32:40 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 2 Sep 2024 22:32:40 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 2 Sep 2024 22:32:40 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 2 Sep 2024 22:32:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=avF0oHjTt97j166Dae2nbXZSZAL0WtnOheWswhh07ODhFZzZwlq8IiWH2JAzciHhKFWk7vSS5LtcyBwfA9JB2iPWxODghnAkkUIo3hUAouJbRgSrYpX3imcp1cUMFR8dDjehaeUhBgQXY3yMAxh3USkN6SBpqUTErs7l87+Z6CD2Ejnm/2DIeIzda2teG2jZfRGjvz3DejInhkZMos2yWu/u9Tq+PKdzsTyGxd0vdk6BkP8szLKKmWzDjbIFg2+7s04QlHJOGkjtI6uKH+91+55ukUX/OoaGjeWzVR+R8UZhAXKR3xXfFyu/+7vaVCK1M/65KwgAAv248+nMffCGBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ICt/b4B/zbPLT0XDfGe7OgPrEFDv0L7swqIKAIevDI0=;
 b=YTZzAnQd+i+QJGk38tpiVgOy0herBgtYeUocmfuh/xJxm/Aqx4cVTV4nGBst8dBm65qzxQLzsHgdPKoy05A3XQDotSWoL5BSIqqTI2IoR0ecwGMMJuUweRS3ziDDeaztnqqJrb7q5Gznv9CYOC2bR4BQfojrJu3dmTVFfrkAa1dEr8tgcfXVW3sHBNQ6uVyv1OOoAH39Nb2hLVhD9Y6Ec6zpMcvKm/JvaoWFqIK5knrBtINp6ZfY/mpRWyLyxpT15lPtlvbWk816nj8OdGjk/wOZKGOtMy59PV+pKP0hI4KPw1GSLFjusRT2/NVY3ViUJzUD6op/bmL/DRDw8TpfOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB6789.namprd11.prod.outlook.com (2603:10b6:a03:47f::11)
 by SA3PR11MB7525.namprd11.prod.outlook.com (2603:10b6:806:31a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Tue, 3 Sep
 2024 05:32:28 +0000
Received: from SJ0PR11MB6789.namprd11.prod.outlook.com
 ([fe80::c0dd:2dd9:aec0:94f7]) by SJ0PR11MB6789.namprd11.prod.outlook.com
 ([fe80::c0dd:2dd9:aec0:94f7%7]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 05:32:28 +0000
From: "Kulkarni, Vandita" <vandita.kulkarni@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Murthy, Arun R" <arun.r.murthy@intel.com>
Subject: RE: [PATCHv2 3/5] Add crtc properties for global histogram
Thread-Topic: [PATCHv2 3/5] Add crtc properties for global histogram
Thread-Index: AQHa87WgCxuhSo9p/EeEQupr06IXXLJFmlCwgAADbqA=
Date: Tue, 3 Sep 2024 05:32:27 +0000
Message-ID: <SJ0PR11MB678992A6D474133C0AA0180F8D932@SJ0PR11MB6789.namprd11.prod.outlook.com>
References: <20240821102349.3961986-1-arun.r.murthy@intel.com>
 <20240821102349.3961986-4-arun.r.murthy@intel.com>
 <PH7PR11MB6772D84ED6F45849552F514B8D932@PH7PR11MB6772.namprd11.prod.outlook.com>
In-Reply-To: <PH7PR11MB6772D84ED6F45849552F514B8D932@PH7PR11MB6772.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB6789:EE_|SA3PR11MB7525:EE_
x-ms-office365-filtering-correlation-id: e905e73e-00db-408f-ddd5-08dccbd9cc9b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?GF878cfvAyKocphulyTnnpwvIQb+Ho9D4LxNvB0CLeFXZ1BHKOxRLUhEwAKa?=
 =?us-ascii?Q?gVeYbSwY3VXh+uaO9/4HvtqkfVfR/lH8R9wAGc5/MKjm4AO9OFsxPO+tt9gy?=
 =?us-ascii?Q?t6US2QRrgq9E2kPNyl6TRRpQSisJIDMi8e7+gO1UYkSCcgc39P7R0cHGt55G?=
 =?us-ascii?Q?lLMBEB5oRgnhXHCqGc0X4UVl9aa0qNFIdmyO2ykDumz/WIguSogkmZ1IKwT7?=
 =?us-ascii?Q?P67DnTJRP3GenjhsXHCvY8D5k+Q5nrUxlrm9gfZfCfLD/f0IN3OgGX1MROmh?=
 =?us-ascii?Q?GRBw9iByfH0jft0qRqNI6zCs3HFXJqftUcDuIJkpK1FoqGiEuUkfPh6P1ihW?=
 =?us-ascii?Q?GtuKQHQc0h7qNNquTid5S3U6JbDoIV2SWbi35D8lH3K0Zpc/CAJmLjSseMA+?=
 =?us-ascii?Q?uRWLLDbTsfUWfgMRnEZjezP1/qU/f331ihFIG+BemwoXh8m5DV2zi7iwYlj0?=
 =?us-ascii?Q?4AfcG2ecK6utTMfYIq4QXMZQf8cyVbrngwHyofE9b00acHCQd2gRpgoxs0V7?=
 =?us-ascii?Q?E54uA2m2Fbx05GGdrwmKtfxSe50uv9EbvU/WdKwUruGPmr9/GitACGFZKtdQ?=
 =?us-ascii?Q?e/A+2UzdjUCQXn/ZewPJRcM1Uc/Pl3Qo87uAdwMmXb1X91Kq0hhNUZUr2qx7?=
 =?us-ascii?Q?VU54qfi19R7eMWUMTnjZaykd0qYdEcZ5b71zCLFRyyN+wfAQaejnJX5TDNq7?=
 =?us-ascii?Q?yf7Gp9l4hjU1szncFEoEYm07jMyJFiWP4lGrmIkCwPFHk8dp1qR28/xf8jyL?=
 =?us-ascii?Q?3R0+p5O4RkN9LevDjKNTb3HfnynVczOT3QVL+N8CwJEREGRHTzUu6n62hTMG?=
 =?us-ascii?Q?vQ0Vk5cMGxZsoBy8XKQKnDbCHeOwDKo4uutE+G4QndBG6OhHlpLY8y/qWBUF?=
 =?us-ascii?Q?3MlChE3jgNyn85ovP+oCuHnITvdEz0ymAdsl1y8LoLO01aWrINTylGKR9KAi?=
 =?us-ascii?Q?XSN5NZ/CLQ+rktr8tC/d+8S7wrFvWc38l3OjZN6U1LeyZijNFMW/5cJO5fO3?=
 =?us-ascii?Q?EvWv7doBolMFt24/bmD8H/ge64fTKYqDgGMVB3MmUi5nrJqAvy6tcROUXVaD?=
 =?us-ascii?Q?swKFA7t8ydBfSewP0zpicaJZUB3FiBo7ufn9S6QITFdKq6VLAjcLIH6Due2J?=
 =?us-ascii?Q?C514bMoCStolkbiRzzTvgHtXXzk7gZwrnr7UuR6GpCEoMmId+iRku5bkESfs?=
 =?us-ascii?Q?nZkau6jxUT7ORq46Djf+D5kfnLo/iMGGYNNuQ0aSFNDI22NlsV0a75wkMA23?=
 =?us-ascii?Q?Ab4iN2YBAyqNVqEWLF91R/pzC2ki2nG9lq1OwIU5GlSl5H8NOqnOet6gJPf9?=
 =?us-ascii?Q?N9krfYYrztX2OiHtbLcVzFNG5rdUtIGHjbX42ENgIde3zEpcIqbeqdcfHecQ?=
 =?us-ascii?Q?ZD+QTdvOdQHUnmFhMI53iPzoJSMQZXTadEjOSHS7PcxDoJHCWw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB6789.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?HgjlhathDut9HUCCjkyX6vPPAAfbz2d4xN25/HYdPTYAkCQcGv9IBuqQ2wij?=
 =?us-ascii?Q?7IJrooHc3yEmZ2LsnS7V/NJc2NBUMTwgCwoVlfcm1mvev5fG1fVZrJSCN3wb?=
 =?us-ascii?Q?dfEdCcE38SGhfzY3i/+7Qv7xGhpB+n6RcnVEoo7AIMVpTZarx4sR5xQqlC15?=
 =?us-ascii?Q?8TGwEox1jOJCo7etRyMKg32e2b8536Le2lrv7Ndhvqpo2L2CGplyL8wA9t7b?=
 =?us-ascii?Q?vfahOEdx7164xH+8mTIPrORY5CVQEIxeYDH7FEzdpKuHyfOUNtNIGhjq9Er/?=
 =?us-ascii?Q?6MHKE5X2231NFEDsd/8p985EHYlJyrlqY3f+YgLM9tNrCn2TRUYWwyzk0XXx?=
 =?us-ascii?Q?0wYY72MnTaOY7el5LcAHGnuKjBYnmaKCqBh46LFXrv1HRXMiDNrxUhF8JYGH?=
 =?us-ascii?Q?WT7csWIEnFM+dNSH8e26ymDZRweHIqe+r/tFW7+c9fLJu8FjJ48lKiqWLhbp?=
 =?us-ascii?Q?havudguUntkfK0llDwSqLbCCN+8XZBV2xmV2M+JzutXlOTf1XuyJzeR5d82V?=
 =?us-ascii?Q?bPgFoqHud98Oc2hNjSWsLyiMD5U9TY4qT+UV3D/7T33Bx++1kxAVJvG8HwaK?=
 =?us-ascii?Q?l6EVRrbypJ5t5x5jQNC6vwmq5Z0tZ+0qKJeBHhkI/mZma3P/ycxgaVCeuBUN?=
 =?us-ascii?Q?mlI2NjVvBsaQvQndC23VoYh+uRb5BEjsLg8n0VLCzGF9cLKO6XT5DWx3TxUa?=
 =?us-ascii?Q?3wNVG+F3TutzeAdmrwwkUrNTItKMZJaW+Cltb0Atl2qzhzPZVh3Tz5Mi4ZFB?=
 =?us-ascii?Q?4osf9wyUxm2845AzpOmUYcvEPfWdNY7ZsfK27Zb22UO59uohsli9hh9K+92B?=
 =?us-ascii?Q?wt/7jKCvWe/eeaPmXVkN3MsjfxMJ0zO7s4ymSCeqFWGaCfuZr8rwNA+qjDcH?=
 =?us-ascii?Q?wZtQ26r5ALilKL5OBvHxTIDrgnWcme3hFg5e2hqXVYgKmqusIZB7vpezw+Qy?=
 =?us-ascii?Q?m6Sc41nx2O0nI3rLaDyddBvX7G1jjiuEtgCAIQVePpMamyEYhQCtMCw5+hfY?=
 =?us-ascii?Q?okmalaDck1BfFTfnUMIL5BCx7D2dTnww4nrmbsapP1T7bE7XVv/vltlxm/s8?=
 =?us-ascii?Q?jWt2iTDCtcheLCGiU4wV1AVtU78UYQtyvILXMCJnhzleA7eyNatKe7N3m6Vl?=
 =?us-ascii?Q?CiezyLW/c6KkeYXrtPG3FbNY8TPdnxXVqQWQQ8w/JPDnlGqySKjDbUc59xzu?=
 =?us-ascii?Q?FVjrVkSBgsTvlLS7SQ3/7aW7pKKZW/1/ZHkqNqclgJNnsjREGv63h3BK2DL/?=
 =?us-ascii?Q?/F69kITC6wnZoh67ySJcH9i6It+3CcmHh/lYv9hpIvF1MsyJDRH8n5jDf+u1?=
 =?us-ascii?Q?dOQh1sflrvOTVv4pdSmiWzp0QM6KFerlzFB4cluPn4iYWpsukUSIQxyEPKEO?=
 =?us-ascii?Q?Eg/SHztkoAKtmOs4DOLRtcMZrITX9Ev6+UWUXLr/ecFYHEbl5PjZKaokd8vm?=
 =?us-ascii?Q?Z+kermPjzpV/DyHFXQv65P0CU6/rUkLRYSjatyBywleXhRKug6Tt9bnHmwEP?=
 =?us-ascii?Q?RF4RsTO4bqcVNinKf3Sijbo+Zra24EBioHTCoakmHYTPyMQ/sDXOFkmgIlJ/?=
 =?us-ascii?Q?1+5rUW/8Wyzw0kigydgNcaVIDOQbYhGO8hHc+Q/c?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB6789.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e905e73e-00db-408f-ddd5-08dccbd9cc9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2024 05:32:28.0383 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VyTJ2iof+9WE8jUD0hnsb/1cPKgWmm5y88Z7n0ag44q5XxiRqLHjtxoXWYkaxyuX4RBUxNhCqxfqagBNBoo4jwbqXecFfsorWTsEMqCQxv8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7525
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

+dri-devel

> -----Original Message-----
> From: Kulkarni, Vandita
> Sent: Tuesday, September 3, 2024 10:54 AM
> To: Arun R Murthy <arun.r.murthy@intel.com>; intel-
> gfx@lists.freedesktop.org; drm-devel@lists.freedesktop
> Cc: Murthy, Arun R <arun.r.murthy@intel.com>
> Subject: RE: [PATCHv2 3/5] Add crtc properties for global histogram
>=20
> > -----Original Message-----
> > From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of
> > Arun R Murthy
> > Sent: Wednesday, August 21, 2024 3:54 PM
> > To: intel-gfx@lists.freedesktop.org
> > Cc: Murthy, Arun R <arun.r.murthy@intel.com>
> > Subject: [PATCHv2 3/5] Add crtc properties for global histogram
> >
> > CRTC properties have been added for enable/disable histogram, reading
> > the histogram data and writing the IET data.
> > "HISTOGRAM_EN" is the crtc property to enable/disable the global
> > histogram and takes a value 0/1 accordingly.
> > "Histogram" is a crtc property to read the binary histogram data.
> > "Global IET" is a crtc property to write the IET binary LUT data.
> >
> > v2: Read the histogram blob data before sending uevent (Jani)
> >
> > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_atomic.c   |   5 +
> >  drivers/gpu/drm/i915/display/intel_crtc.c     | 202 +++++++++++++++++-
> >  drivers/gpu/drm/i915/display/intel_crtc.h     |   5 +
> >  drivers/gpu/drm/i915/display/intel_display.c  |  13 ++
> >  .../drm/i915/display/intel_display_types.h    |  17 ++
> >  .../gpu/drm/i915/display/intel_histogram.c    |   7 +
> >  6 files changed, 248 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_atomic.c
> > b/drivers/gpu/drm/i915/display/intel_atomic.c
> > index 76aa10b6f647..693a22089937 100644
> > --- a/drivers/gpu/drm/i915/display/intel_atomic.c
> > +++ b/drivers/gpu/drm/i915/display/intel_atomic.c
> > @@ -246,6 +246,8 @@ intel_crtc_duplicate_state(struct drm_crtc *crtc)
> >
> >  	__drm_atomic_helper_crtc_duplicate_state(crtc, &crtc_state->uapi);
> >
> > +	if (crtc_state->global_iet)
> > +		drm_property_blob_get(crtc_state->global_iet);
> >  	/* copy color blobs */
> >  	if (crtc_state->hw.degamma_lut)
> >  		drm_property_blob_get(crtc_state->hw.degamma_lut);
> > @@ -277,6 +279,7 @@ intel_crtc_duplicate_state(struct drm_crtc *crtc)
> >  	crtc_state->fb_bits =3D 0;
> >  	crtc_state->update_planes =3D 0;
> >  	crtc_state->dsb =3D NULL;
> > +	crtc_state->histogram_en_changed =3D false;
> >
> >  	return &crtc_state->uapi;
> >  }
> > @@ -312,6 +315,8 @@ intel_crtc_destroy_state(struct drm_crtc *crtc,
> >
> >  	drm_WARN_ON(crtc->dev, crtc_state->dsb);
> >
> > +	if (crtc_state->global_iet)
> > +		drm_property_blob_put(crtc_state->global_iet);
> >  	__drm_atomic_helper_crtc_destroy_state(&crtc_state->uapi);
> >  	intel_crtc_free_hw_state(crtc_state);
> >  	if (crtc_state->dp_tunnel_ref.tunnel)
> > diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c
> > b/drivers/gpu/drm/i915/display/intel_crtc.c
> > index 1b578cad2813..24f160359422 100644
> > --- a/drivers/gpu/drm/i915/display/intel_crtc.c
> > +++ b/drivers/gpu/drm/i915/display/intel_crtc.c
> > @@ -10,6 +10,7 @@
> >  #include <drm/drm_fourcc.h>
> >  #include <drm/drm_plane.h>
> >  #include <drm/drm_vblank_work.h>
> > +#include <drm/drm_atomic_uapi.h>
> >
> >  #include "i915_vgpu.h"
> >  #include "i9xx_plane.h"
> > @@ -26,6 +27,7 @@
> >  #include "intel_drrs.h"
> >  #include "intel_dsi.h"
> >  #include "intel_fifo_underrun.h"
> > +#include "intel_histogram.h"
> >  #include "intel_pipe_crc.h"
> >  #include "intel_psr.h"
> >  #include "intel_sprite.h"
> > @@ -201,6 +203,7 @@ static struct intel_crtc *intel_crtc_alloc(void)
> > static void intel_crtc_free(struct intel_crtc *crtc)  {
> >  	intel_crtc_destroy_state(&crtc->base, crtc->base.state);
> > +	intel_histogram_deinit(crtc);
> >  	kfree(crtc);
> >  }
> >
> > @@ -220,6 +223,100 @@ static int intel_crtc_late_register(struct
> > drm_crtc
> > *crtc)
> >  	return 0;
> >  }
> >
> > +static int intel_crtc_get_property(struct drm_crtc *crtc,
> > +				   const struct drm_crtc_state *state,
> > +				   struct drm_property *property,
> > +				   uint64_t *val)
> > +{
> > +	struct drm_i915_private *i915 =3D to_i915(crtc->dev);
> > +	const struct intel_crtc_state *intel_crtc_state =3D
> > +		to_intel_crtc_state(state);
> > +	struct intel_crtc *intel_crtc =3D to_intel_crtc(crtc);
> > +
> > +	if (property =3D=3D intel_crtc->histogram_en_property) {
> > +		*val =3D intel_crtc_state->histogram_en;
> > +	} else if (property =3D=3D intel_crtc->global_iet_property) {
> > +		*val =3D (intel_crtc_state->global_iet) ?
> > +			intel_crtc_state->global_iet->base.id : 0;
> > +	} else if (property =3D=3D intel_crtc->histogram_property) {
> > +		*val =3D (intel_crtc_state->histogram) ?
> > +			intel_crtc_state->histogram->base.id : 0;
> > +	} else {
> > +		drm_err(&i915->drm,
> > +			"Unknown property [PROP:%d:%s]\n",
> > +			property->base.id, property->name);
> > +		return -EINVAL;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int
> > +intel_atomic_replace_property_blob_from_id(struct drm_device *dev,
> > +					   struct drm_property_blob **blob,
> > +					   u64 blob_id,
> > +					   ssize_t expected_size,
> > +					   ssize_t expected_elem_size,
> > +					   bool *replaced)
> > +{
> > +	struct drm_property_blob *new_blob =3D NULL;
> > +
> > +	if (blob_id !=3D 0) {
> > +		new_blob =3D drm_property_lookup_blob(dev, blob_id);
> > +		if (!new_blob)
> > +			return -EINVAL;
> > +
> > +		if (expected_size > 0 &&
> > +		    new_blob->length !=3D expected_size) {
> > +			drm_property_blob_put(new_blob);
> > +			return -EINVAL;
> > +		}
> > +		if (expected_elem_size > 0 &&
> > +		    new_blob->length % expected_elem_size !=3D 0) {
> > +			drm_property_blob_put(new_blob);
> > +			return -EINVAL;
> > +		}
> > +	}
> > +
> > +	*replaced |=3D drm_property_replace_blob(blob, new_blob);
> > +	drm_property_blob_put(new_blob);
> > +
> > +	return 0;
> > +}
> > +
> Can we align this design to what we have for get property with similar
> pattern of if else logic and return 0.
> > +static int intel_crtc_set_property(struct drm_crtc *crtc,
> > +				   struct drm_crtc_state *state,
> > +				   struct drm_property *property,
> > +				   u64 val)
> > +{
> > +	struct drm_i915_private *i915 =3D to_i915(crtc->dev);
> > +	struct intel_crtc_state *intel_crtc_state =3D
> > +		to_intel_crtc_state(state);
> > +	struct intel_crtc *intel_crtc =3D to_intel_crtc(crtc);
> > +	bool replaced =3D false;
> > +
> > +	if (property =3D=3D intel_crtc->histogram_en_property) {
> > +		intel_crtc_state->histogram_en =3D val;
> > +		intel_crtc_state->histogram_en_changed =3D true;
> > +		return 0;
> > +	}
> > +
> > +	if (property =3D=3D intel_crtc->global_iet_property) {
> > +		intel_atomic_replace_property_blob_from_id(crtc->dev,
> > +							   &intel_crtc_state-
> > >global_iet,
> > +							   val,
> > +							   sizeof(uint32_t) *
> > HISTOGRAM_IET_LENGTH,
> > +							   -1, &replaced);
> > +		if (replaced)
> > +			intel_crtc_state->global_iet_changed =3D true;
> > +		return 0;
> > +	}
> > +
> > +	drm_dbg_atomic(&i915->drm, "Unknown property
> > [PROP:%d:%s]\n",
> > +		       property->base.id, property->name);
> > +	return -EINVAL;
> > +}
> > +
> >  #define INTEL_CRTC_FUNCS \
> >  	.set_config =3D drm_atomic_helper_set_config, \
> >  	.destroy =3D intel_crtc_destroy, \
> > @@ -229,7 +326,9 @@ static int intel_crtc_late_register(struct
> > drm_crtc
> > *crtc)
> >  	.set_crc_source =3D intel_crtc_set_crc_source, \
> >  	.verify_crc_source =3D intel_crtc_verify_crc_source, \
> >  	.get_crc_sources =3D intel_crtc_get_crc_sources, \
> > -	.late_register =3D intel_crtc_late_register
> > +	.late_register =3D intel_crtc_late_register, \
> > +	.atomic_set_property =3D intel_crtc_set_property, \
> > +	.atomic_get_property =3D intel_crtc_get_property
>=20
> +dri-devel
>=20
> Can this be made drm crtc property as histogram is generic?
>=20
> >
> >  static const struct drm_crtc_funcs bdw_crtc_funcs =3D {
> >  	INTEL_CRTC_FUNCS,
> > @@ -374,6 +473,10 @@ int intel_crtc_init(struct drm_i915_private
> > *dev_priv, enum pipe pipe)
> >  	intel_color_crtc_init(crtc);
> >  	intel_drrs_crtc_init(crtc);
> >  	intel_crtc_crc_init(crtc);
> > +	intel_histogram_init(crtc);
> > +
> > +	/* Initialize crtc properties */
> > +	intel_crtc_add_property(crtc);
> >
> >  	cpu_latency_qos_add_request(&crtc->vblank_pm_qos,
> > PM_QOS_DEFAULT_VALUE);
> >
> > @@ -690,3 +793,100 @@ void intel_pipe_update_end(struct
> > intel_atomic_state *state,
> >  out:
> >  	intel_psr_unlock(new_crtc_state);
> >  }
> > +
> > +static const struct drm_prop_enum_list histogram_en_names[] =3D {
> > +	{ INTEL_HISTOGRAM_DISABLE, "Disable" },
> > +	{ INTEL_HISTOGRAM_ENABLE, "Enable" }, };
> > +
> > +/**
> > + * intel_attach_histogram_en_property() - add property to
> > +enable/disable histogram
> > + * @intel_crtc: pointer to the struct intel_crtc on which the global
> > +histogram
> > is to
> > + *		be enabled/disabled
> > + *
> > + * "HISTOGRAM_EN" is the crtc propety to enable/disable global
> > +histogram  */ void intel_attach_histogram_en_property(struct
> > +intel_crtc
> > +*intel_crtc) {
> > +	struct drm_crtc *crtc =3D &intel_crtc->base;
> > +	struct drm_device *dev =3D crtc->dev;
> > +	struct drm_property *prop;
> > +
> > +	prop =3D intel_crtc->histogram_en_property;
> > +	if (!prop) {
> > +		prop =3D drm_property_create_enum(dev, 0,
> > +						"HISTOGRAM_EN",
> > +						histogram_en_names,
> > +
> > 	ARRAY_SIZE(histogram_en_names));
> > +		if (!prop)
> > +			return;
> > +
> > +		intel_crtc->histogram_en_property =3D prop;
> > +	}
> > +
> > +	drm_object_attach_property(&crtc->base, prop, 0); }
> > +
> > +/**
> > + * intel_attach_global_iet_property() - add property to write Image
> > +Enhancement data
> > + * @intel_crtc: pointer to the struct intel_crtc on which global
> > +histogram is enabled
> > + *
> > + * "Global IET" is the crtc property to write the Image Enhancement
> > +LUT binary data  */ void intel_attach_global_iet_property(struct
> > +intel_crtc
> > +*intel_crtc) {
> > +	struct drm_crtc *crtc =3D &intel_crtc->base;
> > +	struct drm_device *dev =3D crtc->dev;
> > +	struct drm_property *prop;
> > +
> > +	prop =3D intel_crtc->global_iet_property;
> > +	if (!prop) {
> > +		prop =3D drm_property_create(dev, DRM_MODE_PROP_BLOB
> > | DRM_MODE_PROP_ATOMIC,
> > +					   "Global IET", 0);
> > +		if (!prop)
> > +			return;
> > +
> > +		intel_crtc->global_iet_property =3D prop;
> > +	}
> > +
> > +	drm_object_attach_property(&crtc->base, prop, 0); }
> > +
> > +/**
> > + * intel_attach_histogram_property() - crtc property to read the
> histogram.
> > + * @intel_crtc: pointer to the struct intel_crtc on which the global
> histogram
> > + *		was enabled.
> > + * "Global Histogram" is the crtc property to read the binary histogra=
m
> data.
> > + */
> > +void intel_attach_histogram_property(struct intel_crtc *intel_crtc) {
> > +	struct drm_crtc *crtc =3D &intel_crtc->base;
> > +	struct drm_device *dev =3D crtc->dev;
> > +	struct drm_property *prop;
> > +	struct drm_property_blob *blob;
> > +
> > +	prop =3D intel_crtc->histogram_property;
> > +	if (!prop) {
> > +		prop =3D drm_property_create(dev, DRM_MODE_PROP_BLOB
> > |
> > +					   DRM_MODE_PROP_ATOMIC |
> > +					   DRM_MODE_PROP_IMMUTABLE,
> > +					   "Global Histogram", 0);
> > +		if (!prop)
> > +			return;
> > +
> > +		intel_crtc->histogram_property =3D prop;
> > +	}
> > +	blob =3D drm_property_create_blob(dev, sizeof(uint32_t) *
> > HISTOGRAM_BIN_COUNT, NULL);
> > +	intel_crtc->config->histogram =3D blob;
> > +
> > +	drm_object_attach_property(&crtc->base, prop, blob->base.id); }
> > +
> > +int intel_crtc_add_property(struct intel_crtc *intel_crtc) {
> > +	intel_attach_histogram_en_property(intel_crtc);
> > +	intel_attach_histogram_property(intel_crtc);
> > +	intel_attach_global_iet_property(intel_crtc);
> > +
> > +	return 0;
> > +}
> > diff --git a/drivers/gpu/drm/i915/display/intel_crtc.h
> > b/drivers/gpu/drm/i915/display/intel_crtc.h
> > index b615b7ab5ccd..56c6b7c6037e 100644
> > --- a/drivers/gpu/drm/i915/display/intel_crtc.h
> > +++ b/drivers/gpu/drm/i915/display/intel_crtc.h
> > @@ -7,6 +7,7 @@
> >  #define _INTEL_CRTC_H_
> >
> >  #include <linux/types.h>
> > +#include <drm/drm_crtc.h>
> >
> >  enum i9xx_plane_id;
> >  enum pipe;
> > @@ -49,4 +50,8 @@ void intel_wait_for_vblank_if_active(struct
> > drm_i915_private *i915,
> >  				     enum pipe pipe);
> >  void intel_crtc_wait_for_next_vblank(struct intel_crtc *crtc);
> >
> > +int intel_crtc_add_property(struct intel_crtc *intel_crtc); void
> > +intel_attach_histogram_en_property(struct intel_crtc *intel_crtc);
> > +void intel_attach_global_iet_property(struct intel_crtc *intel_crtc);
> > +void intel_attach_histogram_property(struct intel_crtc *intel_crtc);
> >  #endif
> > diff --git a/drivers/gpu/drm/i915/display/intel_display.c
> > b/drivers/gpu/drm/i915/display/intel_display.c
> > index 9f2a4a854548..20caa952d687 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display.c
> > @@ -94,6 +94,7 @@
> >  #include "intel_fifo_underrun.h"
> >  #include "intel_frontbuffer.h"
> >  #include "intel_hdmi.h"
> > +#include "intel_histogram.h"
> >  #include "intel_hotplug.h"
> >  #include "intel_link_bw.h"
> >  #include "intel_lvds.h"
> > @@ -4335,6 +4336,10 @@ static int intel_crtc_atomic_check(struct
> > intel_atomic_state *state,
> >  	if (ret)
> >  		return ret;
> >
> > +	/* HISTOGRAM changed */
> > +	if (crtc_state->histogram_en_changed)
> > +		return intel_histogram_atomic_check(crtc);
> > +
> >  	return 0;
> >  }
> >
> > @@ -7512,6 +7517,14 @@ static void intel_atomic_commit_tail(struct
> > intel_atomic_state *state)
> >  		 * FIXME get rid of this funny new->old swapping
> >  		 */
> >  		old_crtc_state->dsb =3D fetch_and_zero(&new_crtc_state-
> > >dsb);
> > +
> > +		/* Re-Visit: HISTOGRAM related stuff */
> > +		if (new_crtc_state->histogram_en_changed)
> > +			intel_histogram_update(crtc,
> > +					       new_crtc_state->histogram_en);
> > +		if (new_crtc_state->global_iet_changed)
> > +			intel_histogram_set_iet_lut(crtc,
> > +						    (u32 *)new_crtc_state-
> > >global_iet->data);
> >  	}
> >
> >  	/* Underruns don't always raise interrupts, so check manually */
> > diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h
> > b/drivers/gpu/drm/i915/display/intel_display_types.h
> > index 79d34d6d537d..ddf1cb0ab26d 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> > +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> > @@ -99,6 +99,12 @@ enum intel_broadcast_rgb {
> >  	INTEL_BROADCAST_RGB_LIMITED,
> >  };
> >
> > +/* HISTOGRAM property */
> > +enum intel_histogram_en_prop {
> > +	INTEL_HISTOGRAM_PROP_DISABLE,
> > +	INTEL_HISTOGRAM_PROP_ENABLE,
> > +};
> > +
> >  struct intel_fb_view {
> >  	/*
> >  	 * The remap information used in the remapped and rotated views to
> > @@ -1431,6 +1437,13 @@ struct intel_crtc_state {
> >
> >  	/* LOBF flag */
> >  	bool has_lobf;
> > +
> > +	/* HISTOGRAM data */
> > +	int histogram_en;
> > +	struct drm_property_blob *global_iet;
> > +	struct drm_property_blob *histogram;
> > +	bool global_iet_changed;
> > +	bool histogram_en_changed;
> >  };
> >
> >  enum intel_pipe_crc_source {
> > @@ -1538,6 +1551,10 @@ struct intel_crtc {
> >  	struct pm_qos_request vblank_pm_qos;
> >
> >  	struct intel_histogram *histogram;
> > +	/* HISTOGRAM properties */
> > +	struct drm_property *histogram_en_property;
> > +	struct drm_property *global_iet_property;
> > +	struct drm_property *histogram_property;
> >
> >  #ifdef CONFIG_DEBUG_FS
> >  	struct intel_pipe_crc pipe_crc;
> > diff --git a/drivers/gpu/drm/i915/display/intel_histogram.c
> > b/drivers/gpu/drm/i915/display/intel_histogram.c
> > index 83ba826a7a89..ad4f75607ccb 100644
> > --- a/drivers/gpu/drm/i915/display/intel_histogram.c
> > +++ b/drivers/gpu/drm/i915/display/intel_histogram.c
> > @@ -66,6 +66,12 @@ static void intel_histogram_handle_int_work(struct
> > work_struct *work)
> >  			       i, histogram->bindata[i]);
> >  	}
> >
> > +	drm_property_replace_global_blob(&i915->drm,
> > +			&intel_crtc->config->histogram,
> > +			sizeof(histogram->bindata),
> > +			histogram->bindata, &intel_crtc->base.base,
> > +			intel_crtc->histogram_property);
> > +
> >  	/* Notify user for Histogram rediness */
> >  	if (kobject_uevent_env(&i915->drm.primary->kdev->kobj,
> > KOBJ_CHANGE,
> >  			       histogram_event))
> > @@ -193,6 +199,7 @@ static void intel_histogram_disable(struct
> > intel_crtc
> > *intel_crtc)
> >
> >  	cancel_delayed_work(&histogram->handle_histogram_int_work);
> >  	histogram->enable =3D false;
> > +	intel_crtc->config->histogram_en =3D false;
> >  }
> >
> >  int intel_histogram_update(struct intel_crtc *intel_crtc, bool
> > enable)
> > --
> > 2.25.1

