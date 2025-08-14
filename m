Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E053EB26306
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 12:43:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37C9A10E84D;
	Thu, 14 Aug 2025 10:43:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DK7CCcNe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF32410E84D
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 10:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755168205; x=1786704205;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4g+vBg4+IdzIBU2n+Mwo+/Vsg2dGq7XPfsMfUAZEnhc=;
 b=DK7CCcNeruWvBtma3wPsHJC0UvOvWPpHANJ2fcchIZaROR19EeOdfVhD
 qAEXD62nm2JBH3EY6sXSHMUKEZl85lJd24asvsDuZ5fy3mYue29OSAZmC
 8tLKJ48A2h0W1d5guKRJ06DxsRg8F9u8xDuZ33149LY5p78jz3a2xuCNP
 M3rBKiI261njYlgz4cjaztZMal8aBVcFdnMnrH5cQhHvLNabhjRZd1z/p
 KJ8vEDaNGxU3jqyxGhkPvXoQOKSNmdSkorp+wE6ufHdsrz+dc0CIqSxg0
 utYZdYwez9NkB4BhgqGUDhbchC7a+DXm5vl5xU1zFVFbIdtCaAx6QBHtP A==;
X-CSE-ConnectionGUID: 3uf97CalRaiFRX5mgyH4Ng==
X-CSE-MsgGUID: Tf5GIoA6TZqfPhWAV2EQuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="68084851"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="68084851"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 03:43:21 -0700
X-CSE-ConnectionGUID: TSQpzF7qSyqQnc1T2EtXkg==
X-CSE-MsgGUID: Ixv2Vga7TqSfmmKOzNN6fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="197581055"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 03:43:20 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 14 Aug 2025 03:43:19 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 14 Aug 2025 03:43:19 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.58)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 14 Aug 2025 03:43:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yc+JmdZhPcL73vt5/CjIbO++Jce79BFvZjUm5nIzdrRzkAab0ZTDXsEJ5/xu7h1VnuFkCJcKGYaxS33rVEmu+beQXerEo4RlLDY1SuLRs3rynOWoKJuUbtOXptim2n5HXQlfHSQ+TnIkspQQOOpxb8S4qyz5IysKj8Qeo0Qlfk/55OZOCTA2XQryzUbcf3o3N4yCT5Es6C3FBC2uK8ZGXe28a/eM3YGWplSF543K309uq5rUSH9Q2mnxpA99OoGXbUBidEgql3i+RdamNQmDe2GfufEz6jnNvgO7O1Gx/9Mcr4zgqr03GQMaW1ZCxXK/oXtdCjhfqhBQlMmATLL+3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4g+vBg4+IdzIBU2n+Mwo+/Vsg2dGq7XPfsMfUAZEnhc=;
 b=WivE6eEtRhgrERPHUASq/I66ZZDFVPF7V978By1PSgaAoB3eK1FcRq6zmi2fOEvzh0QmPKObKC/vYuKp65xv7BoAXJayktyA3laHGVNsAfa0qWzoQprq9zRVb8M0SHdMzBbtDYdXyKrQ/NAG36JHBa4IGrYf1B2GNCBLk2D5ITz7p+/UHgvhFMBs5ebrvEnwsFqC/pljLcOn6X3z1UbxlJv9y8+Yl0E+G1+LhOWrB1a4slb0ovoXaIIALVO9TZS+jBHbq7tA0Q501gGrQ0Qlw/wrUtRKQI1Xr41H15B46uOACNs+jeJqOM5tL9hVwg2d29bfT/PbbsO2TJoc5FMXDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) by
 PH3PPF8517B3F27.namprd11.prod.outlook.com (2603:10b6:518:1::d35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.13; Thu, 14 Aug
 2025 10:43:17 +0000
Received: from DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::6c31:ab8a:d70:2555]) by DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::6c31:ab8a:d70:2555%5]) with mapi id 15.20.9031.012; Thu, 14 Aug 2025
 10:43:17 +0000
From: "Avizrat, Yaron" <yaron.avizrat@intel.com>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, 
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>
CC: "jgg@nvidia.com" <jgg@nvidia.com>, "Elbaz, Koby" <koby.elbaz@intel.com>,
 "Sinyuk, Konstantin" <konstantin.sinyuk@intel.com>, "Levi, Ilia"
 <ilia.levi@intel.com>
Subject: [PATCH 0/1] Update on habanalabs maintainer status
Thread-Topic: [PATCH 0/1] Update on habanalabs maintainer status
Thread-Index: AQHcDQGuFYWWQofOfkmwCOpv2RhuSrRh6oIAgAAL9TA=
Date: Thu, 14 Aug 2025 10:43:17 +0000
Message-ID: <DM4PR11MB5549E031DEBC4B6BAA004470E935A@DM4PR11MB5549.namprd11.prod.outlook.com>
References: <20250814095556.5424-1-koby.elbaz@intel.com>
 <DS0PR11MB77675F904CE71124954DD8B58E35A@DS0PR11MB7767.namprd11.prod.outlook.com>
In-Reply-To: <DS0PR11MB77675F904CE71124954DD8B58E35A@DS0PR11MB7767.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5549:EE_|PH3PPF8517B3F27:EE_
x-ms-office365-filtering-correlation-id: 9f45d21f-e4ef-44ba-7d04-08dddb1f613d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?R3BxVExkaHFIZkNxYm55K1FBNWdUWnA0T2U3dGtZRmFYWk05NlgvcXVQZG02?=
 =?utf-8?B?SklJVTdjWVpzUmFjcXZRWTJ0RHh3WXBJaWNZVzE3VFpJMjdZanNvSE5LMUdh?=
 =?utf-8?B?b3BmMVA2dHhnZFhUWVFmZi9lSXlMQVJTM3huclhWd25waGdudHh3MkFpSnVi?=
 =?utf-8?B?RVJIU1NKSzRlRkYyV0dKUkNSQlJsTUp2STM1KzdRS1JUN0VNWnVLeUx1UnhU?=
 =?utf-8?B?SzJOYWRPZTdEUjdWL1paRGhTM3hYVUI1NWlaOVJPSzZiWlJuMmpEamg3OHly?=
 =?utf-8?B?ZDVRdVg2UUVCODBkb3VLcjZJbTlXV3N2WnZmSGQvVUR3Wm9wRExwbit3dU9t?=
 =?utf-8?B?UXFlb3QzejZXWjdwSVdYcUdPTy9TRjhaZmo5dlNhalI3cEVZMnVmNk5abDNu?=
 =?utf-8?B?ZDJ3bnMzMFpHeUxXaVBML2RqUFY4cG5zWm9hQm1RWUhacFVJVHhpZ283NzhX?=
 =?utf-8?B?b0tYM3hYendjamt5dFNvU3NiV1RqZGpLSzdwQVdxVG5tMFYzdWVSeUt6Z3pt?=
 =?utf-8?B?T3BiUGIvS0w1TzNvWVRlcGtGazIwZFREOXNnQ014dEV3YktwWUdMeU10SzNn?=
 =?utf-8?B?V1lCb05ldnN1NzFCRk5MYWdud3hIUUt1Z2k3LzM3bzV4UHlwNTNmL2lLaWhu?=
 =?utf-8?B?ejlBbmFjS1I5WWRtTmV3eEFnUUVoVGk2NWtrcXRZRE05cWRFV3BQSWNBVFkr?=
 =?utf-8?B?SDYzdnZqZXBVSkR4ajJhR2thbTR6dW9GRnY0WVlrMFJqbklxNnlKZFl3aTgz?=
 =?utf-8?B?N1NxMHVaOWVQUTVhVlpUSnFpV2Rhdm5UTDdiUzBsYlFZSElYdjVUWjFDdGRt?=
 =?utf-8?B?UU1ia0wwZFc0ckxTcHVhZDJnY2tKSjY1QW03OHRSWFpXUEl0a3JSZDdYcDds?=
 =?utf-8?B?S2xyeVNzTklSZnl6QXhoZEozdlBrOFJMdWhDMlJwSkdZOFN2ZGJ6ZHBRRUxS?=
 =?utf-8?B?UWZxbEJoM1ZxaUV0VURaZ3Zzd3lVMnQzTEZuYm5vVUhLQWRHMHdPUkV0SnBO?=
 =?utf-8?B?VmZML1ZPOVE0ZFdRWkhqRWZ6Z2ZoMFVZckIxaDNlR05icjJoblAzL1c4TW5K?=
 =?utf-8?B?d3gxWTA2OVRIcnhtekNqNU03TmJubVRzZkJjWGpjeWwzb05Fb3dVcXBGYkc1?=
 =?utf-8?B?L1BubWVubmRnUGRpdkdTdTdaNTNsR0IzSFg4NkV4a3Q4MklmZjhhcXVQZ1Nm?=
 =?utf-8?B?ZzFwbzZzNG9yWGswYjBDTWtOaXhIUjV0R0diZTBwVGZzUllpQlNYVHpMekFC?=
 =?utf-8?B?d0R2NGdaMFRLZFlQc0Q5M1dYSkdjVVA0QzVsWXZxVGw5d0s3ak1ZMWdMR1di?=
 =?utf-8?B?UGloaE5MSDgzb1lMNU9YMzhiOU1lWk9nVStWMnVISDg5c3BzZVR4TVc3dHM5?=
 =?utf-8?B?Q21XblBzMTVWZjdNTHprZ2t1eGhCWkM5U1ozWE03S2U5b2xqZi9tbWhEeTUy?=
 =?utf-8?B?TnpBL1hjL2RHZmtjbEd6dGNzaW15RkQ1TU02NWphdlNVQjIxMGhvajViZ2JD?=
 =?utf-8?B?WXl4SGRiM29tVTVpWjBwSng2L20yZElDODJJQUVqc3RSd0wySWNUdUVJMnlG?=
 =?utf-8?B?RnloZVBZWjhWaWhWeFJtMGczTWQ5YWJBcjFpN0dqVE81SnZwMDdrdDhnd1pJ?=
 =?utf-8?B?TXdmNWsyc3g5M3JWYWt4V29QaE81TlpZOE9lQUZCdE9jUFhGRWxlcmltQzlF?=
 =?utf-8?B?dWE0b3ZsYTFROS9IQmNrV3FwVnZWR1JvaWVTaVp5MmNEcjVVa0ZhOTBxSDUx?=
 =?utf-8?B?eHV0L1U4N05JWHdxb0tRRlZGVUtWWGFxZW1kc1ZWcE1xb2t2YktVYkI0dTdF?=
 =?utf-8?B?aEJNNUdaczNDZmVPcWV2VGZ5aUc5YURkWkZiRDVvVGlMdE9YNmpwOE1TMWVN?=
 =?utf-8?B?WVhSdG9xOU54WjN3aXdYS1orSEIvbTZCSCt3WXBkbnRSNkJBT1M0Q1ZlTm05?=
 =?utf-8?B?SE1YTm93ZXN4dUcrZFRHMWpGUDFRbzR2R3NSZUs0bjBneGoxekR1ZU52a2w5?=
 =?utf-8?B?eWlzM0gwT21RPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5549.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RkFLajJ1c1hRd0kwM29RNEEzeU9ZZVY4eW5lWWhLSW1pV1QwTmFWTVRwZVR6?=
 =?utf-8?B?V1VBQ2lrektkREdJZGhKb3NXY2F0QjVWR1dVOTZqblM5WVJzK2kvYndkeHdK?=
 =?utf-8?B?dW92bzBhVjUxVStZcFVuVVhPZVVvN0dNN2lxTXBlMTNDY1BNTW1mV0l0K1Y4?=
 =?utf-8?B?TW1JMWdvdmdZL0tpZ21vbGZ4amo4SXAxWFM3c2dGcjBoT1hZcHpmbkZ1N1BR?=
 =?utf-8?B?Y2hwWi9HRU1vdU9BcWkvNENwSnJuUVZGOTJaTk1uMFpFUWJaVjBJOVZuUVB4?=
 =?utf-8?B?dFVpb0xoL0ZsTTM5cEphNHFQNFpEMTlqeXgrd0wvRi91MTRWMjVwTFZTckxm?=
 =?utf-8?B?U0ZwV0svWVl0MGI0VFRFUTRjcm9sZGRpR1Ftc3dQT0hLbUhnVUlwTTdSK3Bm?=
 =?utf-8?B?TWV5NTB4eTlyMUVKbDRqbFRsY0JxR0tYQ1FpaTZKdVBtMGFidGEzYlgvVm0y?=
 =?utf-8?B?K0M2bENUYWhvQjM4bEhOWUsrUmxFTW1rRjFnTFFhM3c2T2tGOUFlZDllR3c2?=
 =?utf-8?B?em5XUnJUNkQ1bFRVNVZZcTJyU0sxeVAyeHd4bStHWVJienN2TDZXWENsU0xZ?=
 =?utf-8?B?aVpVY0NaTDhxcXNCeE82RWZvbzFuUnJBWU91UmFqenduU3VsM2pobyt3ekYw?=
 =?utf-8?B?bGRUdE03alBLaHZtdlBnNzZSMkxZSGNsWHVwSUExZkd1NU9Ua0pucnhxVVFu?=
 =?utf-8?B?NnBDU1RDcm9EQXBVLzU2SjVMUXQ5bHRJbTF5WlpqVUVJRjRVdXA2SU44cWd0?=
 =?utf-8?B?UWNUSDhSaHIyZDJKZmxkZFdTMWRpWFJvd1BRL3pEc1cvQ2JSR2RLMER1MDI1?=
 =?utf-8?B?NFhPeXFBRXVXZTUyY2tuVFVVbklpMzEweGVOZnRqeGhXZnhvOGVlLzZHUHU5?=
 =?utf-8?B?Y0ppS0R5WXRZZlRycGVJUHhITHFDM1BzNVVQMDRYcGZzRHBNQ3NJZUgvRzhF?=
 =?utf-8?B?RVQxalZkWkRVeXJuSFVMZS9HR1lPTDQ3WGV1RXV0cklEQjBQaER3S0diYjUr?=
 =?utf-8?B?djhDVUZ4QmhYamVhMmVHN1NXY3ltVlZJWGNrcWlTdWtJMVJWZG1yWnF5NHJw?=
 =?utf-8?B?cDRlQUZ5TlIvOERpWXFTZ1E4WUNHZ1hhL3hmVDVLeXhDVjk3bjlwYWcralps?=
 =?utf-8?B?TWlJb0d4Z2NKWkppQ214SndKbUVJWHlLU09kUml3cFM4bWJIREc2SEZZTGEz?=
 =?utf-8?B?dW1KaE50QWh6V3I3amlTZnNJRTdNdG5qWXRMcXBjODNTYnBvNmZyK3BuczVX?=
 =?utf-8?B?NE5yVlgvZGl4NlpQMXhwcmhzUHdrUXVOQ2xrVXFYTzk4UE9oTlA5aE10NVNp?=
 =?utf-8?B?UmVNMWllNTZTVTJYbksvLzVONDJyeHdkbVA2d3JvSlVUR1JjZ2cwZ1JtTVVE?=
 =?utf-8?B?NnRWSURCZllEWU1yNzdBMU5zSExWTUdmbnhLV2lnVnVmaCtQd1BQeUdZVzU3?=
 =?utf-8?B?MWh3end4dTNqWTU3Uk9NUnpzQXh0d0JkK2FwM3htc2VaN2Y1cVNPTDVvcnpr?=
 =?utf-8?B?TzlHNkNXK3BGQzJ1VkFHZ3ZnNEtQejV0c1NMaG1SY2diWHNRUnFjWUNjd2VC?=
 =?utf-8?B?bDM4cEpHSHJJR0tMTXpMWmtubERpMXVucnNPdTk1Y3E2RHpiWlRrUFYzZThU?=
 =?utf-8?B?ak04Zm9uZmpWQTRXWVNYNWRYTW1md3Jjb3VLM2k0L0xjbW5oajdURU5uRkZw?=
 =?utf-8?B?Vi9IeS8xcUVjNllwTEVVSjg4WmdBTnlSVW5BLy9mQ3NEc0h4djdWcy9IbzJ0?=
 =?utf-8?B?RjhsQkRBd1dMRnYvRDhPSXovb05vWXp0dlUyYU9WR2d0b0YxejJZUVN3SFA1?=
 =?utf-8?B?WmU1RWc4aDQ3dnA2aEVtVTY0VHZ1d2N0OS8vTmZsOWFqc1VlY2IzQnMvNzMv?=
 =?utf-8?B?cXIvUStEN3hGaVJCWlQzYWQvUS8vZ1dwUlNLNkJUUXpFM2pxQTQvK3lQd3gz?=
 =?utf-8?B?bGNqT2xxK3VlWk9IUzFUSlFVcm5qTkwyVnpzNFdqV3NWQWFwdlRGTXVTaDlI?=
 =?utf-8?B?dmxjNWREbzlXRHpnZjNld28vSEtFRlZFU0xrcXpnL3c2cEhmRUJpN3dLbnN5?=
 =?utf-8?B?ZDRJUzFNa2NzWFRuSTlrZUhNbXNQMGdmd25HRjR1KzgxeVVmL0lVQitSVElQ?=
 =?utf-8?Q?1L/4z/kc8S6npCa/W2JLizp1Z?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f45d21f-e4ef-44ba-7d04-08dddb1f613d
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2025 10:43:17.8069 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M1qZ9hog1AFmGMn76eGYB9aE/YMsVDN1uy4MTd0TzWged+shOIsYV+bNf6F0QzJscU3zP0il4DJ1i25zoNrcrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF8517B3F27
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

SGkgRGF2ZSwgU2ltYS4NCg0KQXMgSSBhbSBhYm91dCB0byBsZWF2ZSBJbnRlbCwgSSdtIHN0ZXBw
aW5nIGRvd24gZnJvbSB0aGUgbWFpbnRhaW5lciByb2xlIG9mIHRoZSBoYWJhbmFsYWJzIGRyaXZl
ci4NCg0KS29ieSBFbGJheiAmIEtvbnN0YW50aW4gU2lueXVrIGZyb20gSW50ZWwgd2lsbCByZXBs
YWNlIG1lIGFzIHRoZSBuZXcgbWFpbnRhaW5lcnMuDQoNCllhcm9uIEF2aXpyYXQgKDEpOg0KICBN
QUlOVEFJTkVSUzogQ2hhbmdlIGhhYmFuYWxhYnMgbWFpbnRhaW5lcnMNCg0KIE1BSU5UQUlORVJT
IHwgMyArKy0NCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
DQoNCi0tDQoyLjQzLjANCg0K
