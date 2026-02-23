Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCiMAzlZnGmzEgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 14:42:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 834A017723C
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 14:42:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25D0610E411;
	Mon, 23 Feb 2026 13:42:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ORS84013";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013019.outbound.protection.outlook.com
 [40.107.201.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01EA610E408;
 Mon, 23 Feb 2026 13:42:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LwOH/S7/f8dk/oUOZvCi5msIwQwmP9YruPlDGqzfi7KJJ1ghp2BjvwMv8v46LSNO1bIpIO8ZIaBeA9XfXwBLlFN4Xa1RE+Fb/Zdi00I7XPTWFFRe39R1h6gW3CDM+/E4PSDVy7XY8Sx7eOf9chfLqEPxsuPXQyTvs/USWVr/O0iYgMmfcC3+2qyeyucbwp4DzJbJLHJhqjKM7iQcJhhMkxzi6Ro4ygWRVVeHJIvCDQsbJVnDPYB2DdjBX1BImPbbJM5hE26NJ/8n4Y9U5u2WxkuQXKG8rLX98xaweHYgoE2N7um3z56GulZ77+1bli5v0NnmWtEtME3Bsm+V+tyxmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vi3dPIUJ+LLa/hMw1yB11iMZz2HFbBnvwYX0eWherr4=;
 b=WPy+0ISYiWpGy1gDPhKl2LR60hu8hECVrev/lL97NZktDTy8lAEOKSqoUErdVuJnz7SqzeqRSLt2/Fwd7U25iJA8gK55iFrFIkPVw/kn+A2VmLnBgdVEvK/3+5sDsYqInZdAjlbKDu1pfVe8DHxNItWygsPwDe4VnLuXPiiWEJ8Dpb6pXBK4qWOZ3J8QlwWu6nPZk+XHnkn64ub2yBKwefFl6iYcmy80r787v6MpLd6s0X/lFHBIw67HSz4utvdcJf1Z95/e9NUqt85GSaGy+jtU9LgtaCvT25wRdJSq6TI+hD5eydHf3t8oJUxCT1NBw4omRzf0aDhhilLZPIwuFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vi3dPIUJ+LLa/hMw1yB11iMZz2HFbBnvwYX0eWherr4=;
 b=ORS840133xEtJ8+mb5dsMTGsIQPYpE4fXQti7d+pLw2i+H6oSEAHmRm2trlMRIlktUedd4P5TQ+6q0A7af3oHJUCewShDwPcDpXYKnPW89bPc+hfwUQbVjF61If16pKBmgaulNdbUK/bb9jF/2QhWIPxEOCgE0MMtt4A4v8w1nlhhBWXIKrIAOadkVlCATEuI0ZLwxIUXfFtVbyXz8a7Kcz6D1I91EGlMn+Nd7mredRzOUz9ZSXwMfea99vzuwyouHmyuszYGBaM6DIajkP9VmhlJDusZ8k6XF9imohg2mtXGBmvKfAbpQqUi4q23/U0ia5H5DnNuAvtLy2SYOUISA==
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 MW4PR12MB6706.namprd12.prod.outlook.com (2603:10b6:303:1e2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 13:42:06 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 13:42:04 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
CC: Koen Koning <koen.koning@linux.intel.com>, Greg KH
 <gregkh@linuxfoundation.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>, Dave
 Airlie <airlied@redhat.com>, Peter Senna Tschudin
 <peter.senna@linux.intel.com>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>
Subject: Re: [PATCH v3 1/3] gpu/buddy: fix module_init() usage
Thread-Topic: [PATCH v3 1/3] gpu/buddy: fix module_init() usage
Thread-Index: AQHcoeg0w7BvIkwG20iu+6ObT9zbqLWLGlAAgABGA4CAAD0cAIABCRgAgAJ+SYCAAQN1gIAAALiAgAAnl0E=
Date: Mon, 23 Feb 2026 13:42:04 +0000
Message-ID: <B4DB7124-32EE-436A-8447-679015162B87@nvidia.com>
References: <DGJPMOESHINC.1NGNT8LLY8DKW@kernel.org>
 <1771594440.99434@nvidia.com> <2026022156-citizen-shredding-5d6d@gregkh>
 <cdc31857-c9a0-4d05-a243-780dc9819cb7@nvidia.com>
 <b45a50ce-de96-42ee-90c1-0a6cd7a78cc0@linux.intel.com>
 <DGMAUQLZGPZB.FWELZM9GYP0Z@kernel.org>
In-Reply-To: <DGMAUQLZGPZB.FWELZM9GYP0Z@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR12MB6486:EE_|MW4PR12MB6706:EE_
x-ms-office365-filtering-correlation-id: f46d92df-33b3-4010-b410-08de72e154d0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?SmFIZTkrQnUyZ2txclJScnM2NEdrRlJNUkZBd1pXWVdjSTJ6N3FZRU81VmJL?=
 =?utf-8?B?YVBBNzVJQTJkelJVVjRJQjczajMwbUw1MzNrWm1mQXhzbzdSRHczV3J5cEgw?=
 =?utf-8?B?c05GZElLUXZHNmtEY0djVHBPT2hLcmp5dlpkbWc5MXpLSTZEb1REOGRoVGNY?=
 =?utf-8?B?ZDBiZFFTTWJ6UkJ3NEF3R2laUXVCMUh2NUhRbkEvcHM1MFM0M3ZXQ1NlNm5o?=
 =?utf-8?B?WjFpKzBBT2phU2NlbE5GVnBPOENMbVpySW45dlduWDRFekVaUVphS0NpQ0d1?=
 =?utf-8?B?cHlFQmhTTFNpUjlqTys0ZkZRNU9zYysxY3Q2STNId3o1Y0VENWlnS0kwdkdo?=
 =?utf-8?B?eWpXVkdvTFZnZVhBV2V1a2tpNUI1cFY4UGhOUjJBS1ZldGpuNTFyQ0hpakpz?=
 =?utf-8?B?V0dTbm9MNDhXYW14WmJETTh2QW01MlJqQWpVd0xlczU3eDE5RHUyL1FLWkti?=
 =?utf-8?B?b2sybEJkdC9iYXRLWXduYTcraGdtZlZGdnV3Q2JFajlLVHZwNzV3MWFmSXFk?=
 =?utf-8?B?UnV2RkdrUVZkL0dncklOQVVQbTZBdXZRek5HMjBHd25lYzVEK3RSK1RFcGND?=
 =?utf-8?B?RlBZd1FuNHY3cWV0Y0Q1WVI0Z1pNVnd5bmgzSXFYZElGTGFYTW5RU283VDIx?=
 =?utf-8?B?R3liQzlTeW5Nb3dZYlVadkg3QTNObHZSS2JjTlNyTGFZUDJWZjMvb2c0cmJl?=
 =?utf-8?B?UTIzVXlJNng1Y1B2Nzc5SmNnY3ovemJIQlZNd3VrZDNlY0tpSU96NC94Njhi?=
 =?utf-8?B?UzVUa2QrQ2hOamlzaXFSMmFrT2h4TGRpYXgwb0ZxTUpqN3VNblUwbjFHZDNz?=
 =?utf-8?B?bFFTTkRVTUtXYmNjSi9OSFlWd0dDRWMxQ1p0d2YzZGJ4anVHbzVpL1BpcEto?=
 =?utf-8?B?aG92Y2lsbU9mcWw0WEFYdGRVQ2o4T3VyZm9GWVNhRi9mM2lCNjVTZE8xOGRn?=
 =?utf-8?B?MFFsekY2b0tyZVpQaVhFMU9SQ01UVnFXdnpvVkIyNDViVjcyUkoxYzNZTnpT?=
 =?utf-8?B?ZklkTG8xQlBXcXZxY0krUlB5R3EzejlUb3hrSDdqKzNPMWNQN2VuclhQSGk1?=
 =?utf-8?B?NjlKbk1jck5yMEpkNG55WkZvcVNWQ1drcENUUE13dXFPbjRoaWZFNFA2WHAw?=
 =?utf-8?B?dHJWdUllK2g3ZVhRWUJIS3JETWw3RWJrZUlkOFQ1NnJ0dWFiRTl5VUVkMnVu?=
 =?utf-8?B?eFB4YTI3WVAzYkxKNzU5MjQrSngwT1dQWWkyYUZERTVJNmJrYXZsUEIvSSto?=
 =?utf-8?B?TlhqYmVkSkp2THhRYUJaZVVqQnlVVXBBbE8zUk90ajRETmgwYjdaUldJb2px?=
 =?utf-8?B?dnY3OCtVMTFQdklpTDU1eVJGSXJYUkt4RFVwSFFlb1U2Vkc4V2E2NDhJZG5T?=
 =?utf-8?B?eCt2UEEyU2ZWbGg5RndrckdOSHZITmtvUEpZY1ZJZ3FrNjlNOThodHJzZXh2?=
 =?utf-8?B?N044Sk1RRitQMFhoSU04aXNlcTI0MTFqb1lzWWFMTzlVb1B3cVJONkVYQ0sv?=
 =?utf-8?B?TTlsSk9LS3o4d3BLYUtadmFidE53c3pCT2wwUEhQNkRmWVpEUVdRTHFGK3h6?=
 =?utf-8?B?U25vRmZYbTlSaWhhUlF4R3ZHazlSSk15bUJITWFCWDUyZVZVdE50NCtrK1FS?=
 =?utf-8?B?MWRvY1lvK3krdWNVTUVsbFRQMTF6NUpZc0tmV2lFbEFzcUVkTndCcmhsSnpL?=
 =?utf-8?B?N1o5NXBPUGw3Zko1WTk4VitLZjNpcGpqMnAyVTBab3FSR2h3Q1U5blU5V0FR?=
 =?utf-8?B?ZGU3N29oYzNvQXQ1ekdacldKUmFhR0dIR1ZrMFZ6aUcwYStpNGFJWkxvT3p4?=
 =?utf-8?B?Y016NnlRNEhSNXNFckxnNGZocWZhZjQwU0dpVmdlSDVDS0JtK2h2Wm9la3pk?=
 =?utf-8?B?ZDVDMWlvcWtlQ1VZc2RFaUNYT1g0d3VXQ00ya0YvUzIxa0Qzd0RBSjhJeEp4?=
 =?utf-8?B?TWVEcjZwdFVDUVlvR1c1b0ZQRjlSUEZpQ2lyZXFYSFRVaFRKTGdJNkF2Tm1D?=
 =?utf-8?B?S1ZqRFB3UEQzd3Y2cHNiVFFDK0ZiNjkrWkxFTkxFZ0JkREZ6TjJJemxpdi8y?=
 =?utf-8?B?LzVaMTJmR01VZndNaUM0blJqdG1ESFZOOUl3NEY4KzBLSEozRlZCcXluK2xI?=
 =?utf-8?B?K3J0QjV2S2pJWDI5WDB1NGtRSUJWV294alYrMGtOZjZoSzhEeXowREVCK01L?=
 =?utf-8?Q?ALID4qu6cpIexlBnUEL3OE0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dEJlbk1YdFpod1RoRXZVWSt2NTlHQ3QrcEkzZW9aMEpQU2VaMEk3ditoZ3B6?=
 =?utf-8?B?U09tTmRZM0RSY3N6cVdNK1o3S0xEU3NYWVJMTThhQzhtTlRsaEJMYnlrTVRW?=
 =?utf-8?B?WHdUM2xRR3BnWTQ1YjNmbXM0ZnlSWmZWQ3NvVXhuM3h1VldrMEg0RC9pYVFT?=
 =?utf-8?B?N2ZTTUhmRlpZSEtRVk5yalVHTmFKMDJqWnliVVJaOEZHMXhyNGI4Z3hsWmVD?=
 =?utf-8?B?WWcvdXQ2K0xyaExOeTJvQ2VxUy9uOHRma29QbU1KdDlkaWU5ZTc4eGN0ZnJt?=
 =?utf-8?B?dEhob1BrbE1maUNOTm54VzN3aXZVeSs5aTlPb29HTU8ySHErZjR2cnVNVVpZ?=
 =?utf-8?B?YWZBanRFRmRremdreTdFdG9udzU4ZXRsVDdKMHRxOWJpSDl2L1pBU2xXT3JB?=
 =?utf-8?B?SElrYkRSRVVVb01HQ0dYcC9LLzJBT096YWdvZ29PdWY2MHMvalpVOGNPSTRQ?=
 =?utf-8?B?bnQ2ajVna2EzWXhzaWpRNUJsSDZQTUdBMUtPd3FSaERBTys5NmVvNDEvVXBI?=
 =?utf-8?B?TmVNbXVIelZVUys2ck5zelgyRkg3TzREdmZqU2NEYUsxN0Rodm45T05uUENG?=
 =?utf-8?B?SkV2alYzR29kNDJSYy9MWDFmejlHbmROblhQOUI3bFgwb0c5V3pKd3l5TFF1?=
 =?utf-8?B?dkFraTd5TDc5NzRzVm15MENncGR1em5BRkJyVWI0SUp3YW9kNVZjcnlsdVdG?=
 =?utf-8?B?N0VSc0w2bk1xb2NUK0Y5RXJkUUd5VllzR2lCSUdaYmZjSTJSL2I0K0ZoV291?=
 =?utf-8?B?MW9Qc3EvRkhLWHNoUmlPZUZrVGhBQUZ2YklvN0lXYnBzVHRLbTU4eUp0aHJs?=
 =?utf-8?B?K1k1dnc2U3p4Z3VxdXVuQi9JQThmbjFoWitqbUtPZGdwbVJCU1preldaZ2xk?=
 =?utf-8?B?MjdXUTZuMFdyb2NFUVYyVU4vcVMySnBFMnVLZ0wrNmF4U210a2s0YWdOSWVi?=
 =?utf-8?B?ZTRWZTBJbDkzWXlhYW1WZUxjdWpXb2hhT1h2YS9Db3JuWWFJSmp4SngwelVl?=
 =?utf-8?B?MFZ2cStBYkF3RkpPdm9PRzU3azJIQTAranorRlF6UklZRVpEMVJPcVgrbE5J?=
 =?utf-8?B?RG52MFJiYXk4bmVvSVYwcGdvR2Z6NlBWQmhhTWFmRkpibDZwWEduTElBVVdX?=
 =?utf-8?B?bzhsaWRPUVpBeU1pMHFaM0kvaHVNZkI3SlpoZUwvdnJVaDl0LzJtRzhoVEJr?=
 =?utf-8?B?a0pNclpuUUo5YnRWblYydmtZcktreFlYVktsSUZhbGRFYkV2TEhRMmJtNjNT?=
 =?utf-8?B?cm14MTUzemRYek1FcGswejE3UHRSN244M1pFakhRMEJMWXF0YXpMZ1AyL2NT?=
 =?utf-8?B?NGJOTW5tVEN4ZG5vSDQ4Q3N0aWwvLy9JVkVwUmh5UWtpb2JYckErajZFVExH?=
 =?utf-8?B?RzN1VVM5TkZGenJYRVVsYXJQQ2kya2FuZE96M0Z4RkZ3cGZ3MEFPRTV2cEFj?=
 =?utf-8?B?eWV1ckFvSHVXeWtKd2taSmR0ODRoWlBzV2lreERNZkxXcGlwRSt2a1haalRl?=
 =?utf-8?B?SXEzK1k0dk4vT0g2SklhL1JoeEY2ZGFiVWljMWJFVGwyc01jMXJYbnIvZmRE?=
 =?utf-8?B?ellzRGp0b2JoZ2RUQkZMaUd2cVNzbzZxL2lVT2lFUHZ1RlN1NDNPeFBWeTM2?=
 =?utf-8?B?YWYybGZoUS9XZGhTei9haWlLU21xb0hLdWw4aTFraW5OQXhQSktSTk13QU4y?=
 =?utf-8?B?ejB3Mm5ITW1pNzJHMFQzMExJQWZlUGdWK2VVN3VZWHhKL1VxVFdtVmdzVEFm?=
 =?utf-8?B?YjlLS0VaSWtKTm54NkdFUG52WWl5N0t2dElLME1iOUk1WkZoLzZ1ZVN3dUhD?=
 =?utf-8?B?czFQcEliQXdXWDNGeUNxZ0I4V0pnMVArcGh4THVycWF4T1RBbXZ0YjFHV3hP?=
 =?utf-8?B?WXgzb1Roa0hyWDQzektoS2ErQkJPcFNqZkM3ZWlGNXVHdUUrMFpLazdlSDZU?=
 =?utf-8?B?a0JERjZqOVNrMXJtV2RGS0tjZnR2Q045V01nTklWaGphV1FqcFM2REJrMDlY?=
 =?utf-8?B?Yk10NUlFRmlZUWxWQk55NnNLRHZCQ3lMNlZiNWxjaUoyR1pYUVRwZHFJT0xT?=
 =?utf-8?B?RklSa3RsUnczTE5rbEMxaG5qeTRoWHRGUi9vQ1dGYUpUUkR0N0V2eVJMTVFK?=
 =?utf-8?B?YXhtdzhTRkpweVRpTGNrS0lEdDRDd1c3ZWNGMlhNUHUrTzBBaGhDNDhxdUhP?=
 =?utf-8?B?TzcwM1d4S2dQWlRTbVNUL2gxZVBmaWt6N3IzdEpmZWUzUytIaGxiZUpiRkUx?=
 =?utf-8?B?TS9Pb3RBcWNqOXVzVWhQVElUZW9Nbzg2QVlvdTcrQk42c0w1bmJMRUN3OG5Q?=
 =?utf-8?B?THZaa0U3dzBNbjJwM3QxaEhrK2twMFZ6amZHWmdKWFN1dTNZcDdzQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f46d92df-33b3-4010-b410-08de72e154d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2026 13:42:04.9174 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x7/ElewPb8CCEdNDRc26ht7CtaaR7APIBvWVAEpGToxNyYnzvmqsL2KiLu4PXMhUAN1v02oQUj1S6bO8Km1zvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6706
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
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_BASE64_TEXT(0.10)[];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 834A017723C
X-Rspamd-Action: no action

DQoNCj4gT24gRmViIDIzLCAyMDI2LCBhdCA2OjIw4oCvQU0sIERhbmlsbyBLcnVtbXJpY2ggPGRh
a3JAa2VybmVsLm9yZz4gd3JvdGU6DQo+IA0KPiDvu79PbiBNb24gRmViIDIzLCAyMDI2IGF0IDEy
OjE3IFBNIENFVCwgS29lbiBLb25pbmcgd3JvdGU6DQo+PiBUaGFua3MgdGhhdCBtYWtlcyBzZW5z
ZSwgdGhlbiBsZXQncyBqdXN0IHN0aWNrIHRvIGFkZHJlc3NpbmcgdGhlIGN1cnJlbnQNCj4+IHJl
Z3Jlc3Npb24gd2l0aCBncHUvYnVkZHkgaW4gdGhlIGRybS10aXAgdHJlZS4NCj4gDQo+IFRoZSBw
YXRjaCBzaG91bGQgZ28gaW50byBkcm0tbWlzYy1uZXh0Lg0KPiANCj4+IEpvZWwsIGNvdWxkIHlv
dSBncmFiIHRoZSB2MSBvZiB0aGlzIHBhdGNoc2V0IChvciB0aGUgdjIgd2l0aCB3aXRoDQo+PiBz
dWJzeXNfaW5pdGNhbGwsIGVpdGhlciB3b3JrcykgYW5kIHRyeSB0byBnZXQgaXQgYXBwbGllZCB0
byBkcm0tdGlwPw0KPj4gU2luY2UgdGhpcyBpcyBteSBmaXJzdCB0aW1lIHN1Ym1pdHRpbmcgcGF0
Y2hlcywgSSdtIG5vdCByZWFsbHkgc3VyZSBob3cNCg0KV2VsY29tZSB0byB0aGUgZGFyayBzaWRl
ISA7LSkNCg0KPj4gdG8gcHJvY2VlZCBmcm9tIGhlcmUsIGFuZCBpdCB3aWxsIHByb2JhYmx5IGJl
IGZhc3RlciBpZiB5b3UgaGF2ZSBhIGxvb2suDQo+IA0KPiBJIHRoaW5rIHdlIHNob3VsZCBsYW5k
IHlvdXIgb3JpZ2luYWwgdjE7IEkgZG9uJ3Qga25vdyBpZiBKb2VsIGNhbiBwdXNoIHRvDQo+IGRy
bS1taXNjLW5leHQsIGlmIG5vdCBwbGVhc2UgbGV0IG1lIGtub3csIEkgY2FuIHBpY2sgaXQgdXAg
dGhlbi4NCg0KWWVzIEkgZG8gbm90IGhhdmUgYWNjZXNzIHRvIHRoaXMgdHJlZSwgc28gb3ZlciB0
byBEYW5pbG8gOy0pDQoNClRoYW5rcywNCkpvZWwNCg0KDQo=
