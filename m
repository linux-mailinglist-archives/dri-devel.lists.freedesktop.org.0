Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A47B346CD
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 18:12:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AEED10E4FC;
	Mon, 25 Aug 2025 16:12:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YO4FknRJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9730310E4F7;
 Mon, 25 Aug 2025 16:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756138321; x=1787674321;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HL5A7K4eCx0fNqnx5OzkJU+V33QPNZNPgt0nL7EIXVk=;
 b=YO4FknRJZuvmu8vJ1sUQEQZKQuD0gXiUdEgpD619Rhe1pqOip5101nPP
 UNus42jzBNQGGuJ2NUvxSVrgaBlpgNr4rmetz+FkoMYiyEzTHe7uql/es
 KJzmgHWNWL9WVh3nXERq+6QBEJ0p+lZVws5E5h1HeYDgNCQ/HJlvT2nLn
 QgWyOgN9plVwqeuU78vDstCYoAfQDjFspxv7BzUL4J0Q6ESCIzXxqunS0
 pAxlClUpyQ+EwJKgp+q06TH7LM5583jQvpxYLax/Ciu9nNTOskeu2UsbL
 PNLccXzGzsHYPISq1VwwW5RJqaHebyPpL9xELhzRiYtowWaYAyS9jRn53 Q==;
X-CSE-ConnectionGUID: sfDQBN9ZQb+HY9JQgddL3Q==
X-CSE-MsgGUID: TtOCwLnvRwKJFck+/Hkkrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="58454794"
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="58454794"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 09:12:01 -0700
X-CSE-ConnectionGUID: +4dHnXPcTlaouk3SK2Evww==
X-CSE-MsgGUID: uLzQDIm6So6+vazQkClT0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="169726503"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 09:12:01 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 09:12:00 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 25 Aug 2025 09:12:00 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.57)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 09:12:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P+iDPl1j7DCV79m/qqGNMDJAamsn5kF9lxIi/+zwXcaAqMMTLjLq2X0Iuef0XwcPDnZTfS1Uhr8qWXeKAcggL9c3vgq3Arm2ys8505fHJSb+ovXSqps4NwSIPK8W5rGOdjp4PG1/peUUtL2/j4i7ZUrpQ/EdPvD4kCc3sshZ/3/Ko4bvKWVmVtBFEsNZTFKeJ8kEntmb8kEn6Wxb1BYl7VDnFZCLA8exmHF/fYrEX96rtJ7XjNte4BagZYPNCIox0w2xPlF3pbybf7Fmeg7EnASm3f9nZPmW11C2t2hp3WTR6lGNOq2g0aflZ3F/jTJ23GPx7FeA5yfanfAOsPvb7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uiwBR2q0qlLa3zDrA8ZAbdjgeHcj8LUQYNzqKhGGD8k=;
 b=Z4weW3Cfi4Of7Oq9sA87fRJwHKwAGljdGa2R9QyXVLN0JrnL5U8yT233rm/oB1sCYpq94C+IBbZLOwc8r/1L883X8EqGs7LJHNm7fL0OXQzOlKpWt8LFYTg/T4UA6pcWC5RmmKOic9kdIK5FzWfJcHDHxKdWzN+NyrK8PXklFFQgehfQdU3aASuIlNEucRCCMOWxcxMGoQY3YcC3b2r1m4Pq9ef+FQCvDXu+RFtMzSKIZ7kNoXt4W+it1c7EQAw6+fj1ggWQLMwv0d75aaJpbSO/SZ+HODj/vaMkXasuDrGrlHiF7K2ntHEasWH8rMzcCKUdQrJsSTExff3zUD8wvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DM3PPFD83941681.namprd11.prod.outlook.com (2603:10b6:f:fc00::f55)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Mon, 25 Aug
 2025 16:11:53 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9052.019; Mon, 25 Aug 2025
 16:11:53 +0000
Message-ID: <87a20fc7-bc22-4db9-84b4-e2ff090cded8@intel.com>
Date: Mon, 25 Aug 2025 18:11:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Skip creation of pcode sysfs files when pcode is
 disabled
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Raag Jadav <raag.jadav@intel.com>, 
 Jani Nikula <jani.nikula@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
CC: Andi Shyti <andi.shyti@linux.intel.com>, Andi Shyti
 <andi.shyti@kernel.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
References: <20250819175529.3722716-1-andi.shyti@kernel.org>
 <aKibCnAxTuYcKtWx@intel.com> <aKxzu8njh9Xc0wyU@ashyti-mobl2.lan>
 <aKx3vHwxnzf4cExx@black.igk.intel.com> <aKyApuCLCr5X0Css@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <aKyApuCLCr5X0Css@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0022.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::22) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DM3PPFD83941681:EE_
X-MS-Office365-Filtering-Correlation-Id: 100c8398-a5ec-4ba4-9c02-08dde3f21b00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WXFydzQzemdmZ3pvdzhYdnpyQ2x1K3MyemdoN21Ia2o4bE5OaTE4ckx6UURr?=
 =?utf-8?B?OEtPbW1IYldjREdidnR5dXVma1FPT0wzM1RYQ2FCc2lzMXltWVR0bndTTHpu?=
 =?utf-8?B?RHk0TzNsZFdlTGNQdUt0Z3hwRnJaTzdmMHpIOHoyYkF5UnFodnIwVmpXeENQ?=
 =?utf-8?B?OTRMWDNEMm9YM1FDcmNaSDZVSThaYkJsNExSRlZxK003ZXFrdzFjZ1hXT000?=
 =?utf-8?B?cmkxK2RLaUhCRVkwQ1YxRzJxK0RMY3B6WjJRVVBObkplMExZNm54b2pwRW56?=
 =?utf-8?B?a0xPaHBHMjY5UlI2UitwbVZyZ3FCSklqandTUnBOSFZVQkFUeGhhS1JaNDVi?=
 =?utf-8?B?K0Z5WVBCQnBISjE3RE9WZnhVeU1HbjJ0S0hDZVpIKys4OExqd0prMzdOTXhz?=
 =?utf-8?B?RE5HdWl2eFRPOGhKNTBsS0xGb0pURWVpdTd3cHlTL0R6MzQxaEpTTk1lU2Nz?=
 =?utf-8?B?TGNNQ3YvMTd5UXlWYmNQNlg5cmFFcjFYL1R0ei9JSmdjVEJRb25Nb1JpN3Fr?=
 =?utf-8?B?ckZPZWJxeXRZUjVJcWQvSXJLNWw5V1lyTjZmMlpBQ0JvcWVpWTQ1bWZ1VVJk?=
 =?utf-8?B?T283NUdEcmZzQ3ZZNWMyN2hDTnB6bkNiaURONHFCamp5NXlLS3RCTUUyUnV6?=
 =?utf-8?B?aU9YRk02MTJOVHJ6YWNIdGlyRnI5MEVIZUQ1TGlJMzhORU9EQW1aM1RBZjgy?=
 =?utf-8?B?alQ4Ymh1WnFqdVdFVm1lbTVCek50dFAyTnlqWm5QTFNya3hhdkQ2M3BmSGVY?=
 =?utf-8?B?THJIL3FxQWpHcFdNRG5GZHlLaGFpWjZnTm5LWVROQkxnUko0TUQ2dVhFdU10?=
 =?utf-8?B?bTF5WXBuS05ucTR4YUxvMDNCWmlCeEtSRGNjTVJsK0NvNUgyRiszQXdCV2Rp?=
 =?utf-8?B?SEhIMTBYYjlrRWVWajA2eHhZdWMrUDNFVlNoOENpRzI0Yy9mRGoyNHFkYkh1?=
 =?utf-8?B?ZG1weXdlSzcvQ05QckJQOEtLNjErVk9sYmw3K1QxVjE3ZWVTNytmSUpLb1dS?=
 =?utf-8?B?VUtjS1ppYzZwVHRjRGFDM0pmS1BrckNoaStjWTdjT2xnalZJS1FBbTZhOC96?=
 =?utf-8?B?dVFzUVZ0cTFVamNnS2pRYlJaRGcwd0JEWUtkYXdBYkpiWFpMdzZwQ1ZiQ3NQ?=
 =?utf-8?B?c2FkNi83Z0dabHJPc3RxeklTa1h1OHpZTVlsWlR4MkUzbXBoWlBieWlWSDdJ?=
 =?utf-8?B?ZnhMbUZOSkV3dFFiNm9HSG5rT0dFN21FM1JjVVEzb3pSRmxKb3YybHNZWXJu?=
 =?utf-8?B?NXpwSUNvMHBhbVhoaW8zV2taY1JyVWJibFhuQWkxNzNVcHlaamc2b1FEbks1?=
 =?utf-8?B?eVRiV29UdVRweFlqT0ZoS2l0djJjaGFDZ1FoZmM0T0s3VWM1dFVkdWJHZFpm?=
 =?utf-8?B?V0ZkOHhjTlgyU0FTUlUxQ0tpY1pXY05wMFFLNTkxVTZXZzg5SVFUczJhRDRz?=
 =?utf-8?B?bFZ6MGF4SXJkNndpdGp2a24yRWRlaUUxVVVJZWRlVEJDK1QyNHk2RU1MTWhT?=
 =?utf-8?B?ZzB2b1RRVENhM2Q0RVJ0WVplais2NXFQOS96dTJJakVRVGp1bTJpRW9SaWIr?=
 =?utf-8?B?WFJYMFAwZi9hZG1Ibi96SFpKVDlsenBUSlk0TzJxaXFld2Z3ZlAyMXV0TDVP?=
 =?utf-8?B?L2tNcGdIYnc5cmIrbUhnVmxGb2V0WEdrejVxNDZ2eVozZzRFT2ZEaEMySGNh?=
 =?utf-8?B?bEZFNldYSm5YSkZQODFPMGNyWk0wbmlmYThsNXpuczEzcTdpL203YmlDeUFl?=
 =?utf-8?B?ZUxDZEFMak5xRmpLTjJuQmQ0bzVTQjZxY3d5SmFUOVRsMXc2SVBnWlVkVktN?=
 =?utf-8?B?NTk2V0VqQ3JFYmRYZWF0andVWTN1Nm9Tc1IrS0ZtRFdhVnNFaTRUWmRXMnRv?=
 =?utf-8?B?ZGhrOFpyQjJNalpiTGxBQlI3Vk0xcjBaQ1R5MUsxZlFwU0MrcDNDLzlPa01H?=
 =?utf-8?Q?MJLFi0Nx8N4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjZDWU9WNTZySzVnYkdmemZuandIMkxGSE9GMTEraTBpT0pNWGdnM2t3UUJD?=
 =?utf-8?B?bUlsdkhYeFhld0lDRnBFOFNjeU92NWY1N1E0MTBNd2o1R1J6eEpTSXlPeU9C?=
 =?utf-8?B?N3RDTlhQVGFnaURHNzgzYkZlc21JVWtVN3VNeENXWFg2REpESHRuYW1JZmVC?=
 =?utf-8?B?RWo1YlJMN3JLZUkvR2lVNGZad085U3lVcDRjWDV6dzdXTDIvZ1drVjM5aU9W?=
 =?utf-8?B?S1R6aERHTnBYU0k2RklEVWRRUUpneXVSNUozNnZSMS9sbURDTEd3cjZla0s4?=
 =?utf-8?B?T0xEVWdoYitsU2kwRm5xVzBaQzRKNmFXcGNWZWFXMVBobkV0TzdweXpmSnJ3?=
 =?utf-8?B?NWpHWlhpMGp1VWZ6cjZGMk96STRxWWtxSU5saHdxWkVqUFFvSEttaVgvUTlM?=
 =?utf-8?B?LzR0c0Jlb29vTHVDdUdRNTA2R0ZYY2wrNEpBaHhzQVRYMERXdFdkZ1Zmcjhs?=
 =?utf-8?B?QVh6dEhsakNZNWdpTmltR2pLb0hwWThBZHBqL0tnWVMwN0dYekh2ZmNUL0xF?=
 =?utf-8?B?VUlJaUNBc3c5VmNXR0p0b2V4aFVhRkNuZUM3cXM2QVRYL3V1TS9oVGJ2RTBv?=
 =?utf-8?B?eGVqTmV3c2ZzdmFrMjNVbDFTWWh6dzc0TzZaTllnbFNVYlBrMzFHdS9KNFpO?=
 =?utf-8?B?dzcrb3M3UDlnNDhjRjZFODJXZktEWDc5dUlmd2t6bFpoOE52NXB5dW5xNVBt?=
 =?utf-8?B?SzFhSERvRXJtaW13UEY0YThOSnk3aklkVG5QcWhlbkUrL0NMOWtkVERacFAv?=
 =?utf-8?B?TWtJNFpTdHFYTkdHT3l4TzFJVEEzdGFXR3B6a2JXVWpVcmdkSDdtWUtxeDJa?=
 =?utf-8?B?eHdRSElUeDNtYlJBTTFwRWx6ajBFbUFNQXFqU3BZRW1MMzM1TS8rbk9KZ0Vp?=
 =?utf-8?B?THJHS2hLQmxCODJ5WURsaW9xZytLVFRqdDNXUEphWEozWHRxRkFyS2ljaHdn?=
 =?utf-8?B?YjNYMlRVdTdjSE5kaTF0YWl1a2ZUNk41N0Rmd284L1krVk96N0c3S3JlZ0pR?=
 =?utf-8?B?Y0czZVJ2alhldVpjU3BYanFud092T29LMzJQaWJEQnA0cUlpTW5IS3UzZnBm?=
 =?utf-8?B?VnNZL3o2WGFzS1dUcHE3UzFkbGZObW9vS0tNY3dReG5SQlUvRlJWN2RpWHNM?=
 =?utf-8?B?ek9ZaDZUaEhlZS9BTzd2ejNCL2dRSHloelJhZlBFb1NZK1RkVkpRNUdwQ014?=
 =?utf-8?B?Y3locmIzdStwMndsUHVuMXhKVXlTUUxPT0dHM2ZwaUw2Z252c2hBMVJsQWNu?=
 =?utf-8?B?ZVBQcEZBb0dNaWtIYVQ5QnpsYTFuQmtGWlFTMENueC8yOXdZS3ppa09nYVVF?=
 =?utf-8?B?eDAwYVVadjRhbllONXFPckszc2F5NWhyOHZvMnhXS3R0dVVDUlkxSEJVQkdi?=
 =?utf-8?B?WTJKSmwvd3BJaksxYU5paUhsNzgwWFI2R0Jpandjb21taFphb2hTeDdxeVdK?=
 =?utf-8?B?WDlaU1hBVTJJWmRhTkNlT21hWXNZZTQ3UWg3M3Yyd2d6NlZPcTRNakF5RGxY?=
 =?utf-8?B?eXpGalZFMEFXTWt1ak9yakhyNVRpYlh0cTRPNHlLaGtkeFUrK3k5by9IMG1H?=
 =?utf-8?B?MEdpYlpDUVpxZEV3ZnVOVmdURFlxQjZIV2dkaG1tOEFXajJld0NacG8yc2dN?=
 =?utf-8?B?ZlNyeGx1YkhLSDFuVU9uZW1OQVY3d3dMSmVWUTlzTnlqYytuK2tHM3RPWHEw?=
 =?utf-8?B?UzUyeHc5US9Ya21XNTFneWFKK1Y0SVFZK2ZRc1RMVWo4aEp1STJiQ0RBczZs?=
 =?utf-8?B?S1NJU2gzRHE3WkFzT0dYMFFLbk1LR3JTVU8zWHMyZ0g3ZVNlRGpSREIzMFRO?=
 =?utf-8?B?cER6R20wWmJHa3JTbmdqeE82NDZCbXQ3VGZ0czZCS2pSVmF2ejE1ZTk5NWFs?=
 =?utf-8?B?eEJ3VW1DcWd5TkcvVnh2SmNvNWpmbnBzY3VYbFQ3RzZwYVdRc1ZzamNneHcv?=
 =?utf-8?B?OWZMOGlBYm1jS2pYa2FEUXQybjN1LzFzNHgvNmVCekg4OVNBVkpGQ0RFL1I5?=
 =?utf-8?B?djB2YmQreHIvQXJrVnRZQjZxN2JYdk1sbGFlZzI0a3pCNGNYQlFoaWZSM1M1?=
 =?utf-8?B?VVRoaENib09waGdpM0plNmRya0NCanl3TGl1Q014R1JoMG5rSEhBbFBiOWYx?=
 =?utf-8?B?N3pGMUl3alV1MEZWY0Q1U3VvNnBtd2FtRUlyalg1RWZKWXJ4VmpiS2xaVlNJ?=
 =?utf-8?B?K1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 100c8398-a5ec-4ba4-9c02-08dde3f21b00
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2025 16:11:53.4920 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DbXKiA/9pSOlgeLcLbH2dgfPApYfnYeJhBjaG43wEYCmVbwy1O9KG2ZzWVB1nIpVFf5b7p1C9ao7PV1OSWHz2VhJD8uV4RXCZUS5t9O5pGE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFD83941681
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



On 8/25/2025 5:26 PM, Rodrigo Vivi wrote:
> On Mon, Aug 25, 2025 at 04:48:28PM +0200, Raag Jadav wrote:
>> On Mon, Aug 25, 2025 at 04:31:23PM +0200, Andi Shyti wrote:
>>> Hi Rodrigo,
>>>
>>> On Fri, Aug 22, 2025 at 12:30:02PM -0400, Rodrigo Vivi wrote:
>>>> On Tue, Aug 19, 2025 at 04:55:29PM -0100, Andi Shyti wrote:
>>>>> From: Andi Shyti <andi.shyti@linux.intel.com>
>>>>>
>>>>> Coverity warns that 'cap' may be used uninitialised. If pcode
>>>>> is disabled there is no need to go through the hassle of a
>>>>> pcode read or taking a PM reference.
>>>>
>>>> Please mark it as false positive!
>>>
>>> this patch is not for fixing the Coverity warning, but I saw it
>>> useless to step any further if there is skip pcode.
>>>
>>> The same check is done later in the function, but in the meantime
>>> we have done a few things that we could have spared.
>>
>> I tried something similar a few days ago, but perhaps not very convincingly
>> I presume.
>>
>> [1] https://lore.kernel.org/intel-xe/20250806152256.748057-1-raag.jadav@intel.com/
> 
> Cc a bunch of folks...
> 
> Well, we have a mess to fix here indeed.
> 
> We should not be mixing platform checks with info checks that are coming from
> platform definition...
> 
> Look comment in xe_info_init_early:
> "Initialize device info content that only depends on static driver_data
> passed to the driver at probe time from PCI ID table."
> 
> However this thread made me to realize that we are not respecting that
> and we are indeed changing the info at runtime and not only based
> on the platform:
> 
> sriov_update_device_info()

this was due to not having two static sets of .info (one for native, other for VF)
and it shall be called ASAP (and only once) right after we detect that we are a VF

and all of this was true at the time I've added this helper but over the time
it looks that more and more code movement was happening, so I'm not sure now

> 
> Hence these kind of patches poping up.

hmm, or maybe the reason is much simpler - pcode was not honoring that flag
in all cases, like the one listed below ?

btw, late_bind_remove_files() seems to be also (very) broken

> 
> Jani, I remember you did a very good organization in i915 with the static
> info vs info that can change in runtime. Any advice, guidance here?
> 
> Thanks,
> Rodrigo.
> 
>>
>> Raag
>>
>>>> We will only get here for BMG which has pcode for sure.
>>>>
>>>>>
>>>>> Check skip_pcode early in the function and return if it is set.
>>>>>
>>>>> No change for platforms where pcode is enabled.
>>>>>
>>>>> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
>>>>> ---
>>>>>  drivers/gpu/drm/xe/xe_device_sysfs.c | 3 +++
>>>>>  1 file changed, 3 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
>>>>> index bd9015761aa0..3a083c215891 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
>>>>> @@ -156,6 +156,9 @@ static int late_bind_create_files(struct device *dev)
>>>>>  	u32 cap;
>>>>>  	int ret;
>>>>>  
>>>>> +	if (xe->info.skip_pcode)
>>>>> +		return 0;
>>>>> +
>>>>>  	xe_pm_runtime_get(xe);
>>>>>  
>>>>>  	ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_CAPABILITY_STATUS, 0),
>>>>> -- 
>>>>> 2.50.0
>>>>>

