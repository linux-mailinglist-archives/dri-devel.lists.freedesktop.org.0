Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFB79778DF
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 08:33:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BD4D10EC0E;
	Fri, 13 Sep 2024 06:33:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="HXqvzzlv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2082.outbound.protection.outlook.com [40.107.215.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD88710EBFC
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 06:33:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ja0vK7NJN82be+uUek2oLx9pzX3+LZCf6pmbQvjyvwppPyEpHRDNjb0++qPNefgUDcdwGHPaBWgKcCRZiUfltzJPIA9XZzHWI6mQQ1Bdi1dvJ4O3JbzRAOB/fpiouTjb1kBptbhc3WHpQjNwsFTTuvyI/ohyln4bqBJv03z+lbJ4yeSMLwGX3/I0F4x/F9n3IkO775et+4pyfRMWbXiXwBOaT4MTSRpWKt5Z9ThN9NM3yJeNmvHXSjuQv4eZT0x+KB06y8FLPl2xJBOYRpMTOiQ0gfC7abmPCVcPHvDNGMeRlSkNUEFv+PaHrv8k2yjYvFE/5EI2ckabz7VZXhuDkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dHCrUTtASyUi+btWBIr2VEl8wZCzkGrTJ3hmdbOZLKE=;
 b=nvH2f4KFWBKlBwvhXmjezsjslwiOEqfrQIYNTbF2hmg//icRJ74AckxPZSt/YZIXBrLOEajO0dqXiXtxvhKhgxoJYE5QCM2C/DlU9TipWJRU+m9Qd3tHfE3hnVTBF31cJlHn0jsuzl1We/GQ5D04ggSFgmG/jUxg0jJakyAneoKBo0PJd/tmLgQbiASH0jQ7Y3l2WbvBKHKDcxU8wN1T6fBMfp72g0HDgfymKJ9f1wk8VFsJPSjpmSTZF+pqOR3NilcT+azVgFtXwDn967SGaxGIxpW0bUB6Y2KCua+o6f4au58Eo1eo2iWIH9O+flYtlAVtiPN2sETJQAAoowJYOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dHCrUTtASyUi+btWBIr2VEl8wZCzkGrTJ3hmdbOZLKE=;
 b=HXqvzzlvSx9udEx3ztLS5LdvcyEoQkc15cvYbxZcg5C77Uf/ug3pcmIOrRuYo/ZAEqfNvoSV6nK/h75WG1yBcZWFhHU14GGw7L49kGeXqq81G7O6eflbc5Yh8SoHKTbu1NDDEOaoEqQ228dW0280xC3FTtWVChT0aDU5VTc9v5+AS3cN2YsNTjx338HY/cdnOLBf49pg70JsQIVEfehLQU15hcHgm34ZbaxG7rqIEVralq7PaqC/ODIjWpzOPUk8GefaHX5rWriQS3OWW2hMlCJktI4yADmcfwFaT7LUj/e/hezqe0wli8jXGFfSoqty6um1KbipImT8xuSCQG7i7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by SEYPR06MB5718.apcprd06.prod.outlook.com (2603:1096:101:ba::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.18; Fri, 13 Sep
 2024 06:33:18 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%6]) with mapi id 15.20.7962.018; Fri, 13 Sep 2024
 06:33:18 +0000
Message-ID: <64865e62-ba07-44fd-81a9-8e86447b0f2c@vivo.com>
Date: Fri, 13 Sep 2024 14:33:15 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/7] udmabuf: udmabuf_create pin folio codestyle cleanup
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "opensource.kernel@vivo.com" <opensource.kernel@vivo.com>
References: <20240909091851.1165742-1-link@vivo.com>
 <20240909091851.1165742-5-link@vivo.com>
 <IA0PR11MB718500FE884B40F8E765E484F8642@IA0PR11MB7185.namprd11.prod.outlook.com>
From: Huan Yang <link@vivo.com>
In-Reply-To: <IA0PR11MB718500FE884B40F8E765E484F8642@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR01CA0029.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::8) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|SEYPR06MB5718:EE_
X-MS-Office365-Filtering-Correlation-Id: 047d7c8c-b235-40e3-1c89-08dcd3bdf4a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|52116014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TWp3alVrWmo4bS9tb0phWVBLMFFTbEVkazhaZVA0dE1WbFVqekpzZjNKRnh3?=
 =?utf-8?B?MmQ3N0xMZEVJZ0ZPL3FwTEtUb2M5QXNqSlErRHNaM1RSUG9DWTJWY1VJQnE4?=
 =?utf-8?B?UDZ2WEpiUkFpcjVWWUNpVmRKOERaVmtwdUNLK0RXQ1N5eDA0LzdLcitwMVhw?=
 =?utf-8?B?VFZ4dlVCWUFJTDdVUW9WVW1Wc3ByR0lmWjFVQktBZkF2T0xJQUI0NTJKaHhP?=
 =?utf-8?B?c3NqSSszcWRmNUhEV2xhSlRiUERZQ0FldmxVdkdyazByOXZDd2ZiSWkwc3FH?=
 =?utf-8?B?RVl6QnU3dUVmME5LaVN4YnBuRllxdnZhcXBjSk9TUUJRVHZ1UUF0ZFNicy9Z?=
 =?utf-8?B?UWVqMVp5Tmgra1Y2WVJHVmVHamh3UUlVYVBUOXdWRVNmZHUrVkFCaXl1N0U5?=
 =?utf-8?B?UWJNMFpGRHhKZW5kT0R5OHV3anBTSTBxaDBpUExIclFHS28zTmtPSVJobmtl?=
 =?utf-8?B?Rm1NcDh4NWsyMWkxOFlkZ0dvV09BT3RmallFaHRPWDRpRHBNOHcrZGN0bG1O?=
 =?utf-8?B?Z25EbG9EN0oyOTFFRUFwaEhVRkg2QStLeTNKcjJYMjdkYUtFQmtoL3JvUUt2?=
 =?utf-8?B?V01HalBBWWtDamttT2hmSzNsSGNjV2tremxWYzhpSzBORmxHNnhncFEwVkJs?=
 =?utf-8?B?VHF6V3QzeDFtaWlmdGNjbmk3VjRnaFR5NFNoRWhmRWhZeWNlejMvV2hxUktP?=
 =?utf-8?B?UnBpNzZud3dsMGMxdk1NRDRmSU8yY2RrYzZRL1dPMWtiOExxRUJINkZNNkpa?=
 =?utf-8?B?dzFsS3YzQWNhcjZRSWw2WXRIYUV1VEc3TFNveGw3a21Zb3RmTEJhMkhudUMx?=
 =?utf-8?B?d2VaNUlRb1lBZkE4TE9rUmMwU005bmg4cG45UGt2TGR4aE9SWlduV0VaQm4z?=
 =?utf-8?B?WERUUTZrLzJLZ3pxU0tFYnk1UHdFMFNlTHZ1dkNSYXhBN0p6dm9RZS9Pa0Ew?=
 =?utf-8?B?Q1FkSkFpaFVDWU9hSS9VMWVtTC9VT0JOcVV2R3FDZkVyZk5mb25wMFp0anht?=
 =?utf-8?B?TG1pcGlPZkMvVlNCazFQdDJibUZCeFM2NlM0VVpVd05TdkFaY01lZVJONzRu?=
 =?utf-8?B?STMyTEY4bElDVzI4bTh0eVhoY05PODFjVnJqZmg5T2JZMWlHSWJZMEhkdjNC?=
 =?utf-8?B?RU93bGdzRDhRdWxKeFVLaERtQ2FwL0RuaEtoT1dvR3pKSUthREdHZDFRR3Y5?=
 =?utf-8?B?WHp3Ti9SUk11MzZMM1VXMEtyTWZsUzMxU000VXVOQThKVFQ2VlBZbzFDeVBR?=
 =?utf-8?B?WW9MS2tjZWRsUjhSVitkVDFNOG82cUk3SUUwWXRYL1JWaHRqNjRJYm9LQWxP?=
 =?utf-8?B?YTRxdXpVWjR2RWNOQWlSRCtsT2ZJOWNMWGpoQ3RRejlaQkRtTkV4VGZYWmZr?=
 =?utf-8?B?RXpTdFZKcDJ2cDlYV2dldXJUS1FQRUMxbERTOXdESU1EVG4vUTdZQlFDeFhF?=
 =?utf-8?B?QnBlWldRRWVCK0xZaFBuNXFmbFNxWU5GZ0VMbXIxdVBwQkJCZCtMd0FyZEd2?=
 =?utf-8?B?QkRBUUJYV2xoVzBrZzlYS202bUZVdER3bzdEdWYzdlFxSnA5VWZ4SER0VWNm?=
 =?utf-8?B?N3J3VXlma2YrbkcrbjBLZVB0bUgyWml2Z1ZMb0Y2cDBXTUdZNjIza29kZTZt?=
 =?utf-8?B?Z3NUcTBrYnhpRXNrNU84WjAwQ1pPandCbWZ1YjNzWXhkR08xWmZpVWlTbTFN?=
 =?utf-8?B?NUZscnl0OFAzQUFhckgzUWdlNmFxT0VjMFB3T3Y2aTJKQjZ4eVZRcUJTNzVF?=
 =?utf-8?B?alkzcnZ0QnhTWXJtblhpelVXVUoySTVBU0U0RUduNEM1R3Bmb2xWeDE1ZXp1?=
 =?utf-8?B?d0NCbWluSmJwZ25tNVVPV3Z6MEVmelVQbTI4ZmJSWnVYVncxV2xnUmZuSE5t?=
 =?utf-8?B?WkN1NUNZaU0zQy9yaG5IMGlYcU5SUUNnODBibzdoWnBiVXc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUhxb1VxV2M5Y2V1ay9RYnhPa3UvZ1h4eHZSWVRvSWVuR2lkalM1Y3B1RE1E?=
 =?utf-8?B?eFoyeHdIVVZWbVZpckNnWEpyeVNWUzQ2a01DU1duOFgvamVrT0RPZnQ3ZWFp?=
 =?utf-8?B?K2xiS1QzeFhjWitHcjQ2aWQ1enAzNnFWVXhyUzA4Q1lWbklUNXV3bkFwdTlU?=
 =?utf-8?B?WGVOeGlvdjYwTiswdVJPcnMxRXcxMTBwenR1VElyOVJOc3E2TzJEaFJBblMw?=
 =?utf-8?B?YXFwYkhiaHJQaStsMWRxdnM2VitocU0wWlhUZzhTZWdLWFRKRGFHc1VhVzJl?=
 =?utf-8?B?cmw2cUZoTDRCVzNjVlRUWjZGaDBqeDRHTTlXUElNVEJZbms0ZWxNVkpBWWFi?=
 =?utf-8?B?cnl5QWFwNzRTWEc5dHEwZGpVWHI1MjUrUDJ1RTJYRGp1MVE3ME1zc3E1R0FT?=
 =?utf-8?B?UzVVaVhnOHp1WmxYcUpIR3VSOGVORU9tc2FxQ3RhSGhKVndxOWU0a1Ntem0v?=
 =?utf-8?B?OE9SYnBHWHBYdktkVTRLM1JmYlg0RlRDTlpGS2tPSys5MnZCeUxXSlZQSUdP?=
 =?utf-8?B?VGZ3MGQzS1d5TmFxS0h1RWRLZ3hwV29Zd3lSQ0dFdDVvRXdzejJxQjFkT2hU?=
 =?utf-8?B?ME5XaW4wcnlvYkJTT1BVMkFYYndSYm92dkd3MzRxZStFaWJEaWZiY2xieDkx?=
 =?utf-8?B?ZU9uV1JSamVwZTJITjZnR04rbVZFZVU5YzVJZk0zcnQ4b3ZyUElVTk9ocm02?=
 =?utf-8?B?TnFXTzZ2bjJveGpBbzVSUjd2ellBVTNxT1A4M1dob2RsY2tvY2RDL2hUdXh1?=
 =?utf-8?B?L1lIRGhvZTlBeVozVFJzSGpUMVhzNmVGRDlSYitsTVRPZmpGc3RUV09keEli?=
 =?utf-8?B?aUs2ZFYwckVKSWRWelQ3bS96dXBxSGRkZXNsK3ZLVk5XNm5jeXpVVWFmZDFZ?=
 =?utf-8?B?TXFocUhXell0VWUxNDZXT3Nkamczd0VjTWZOdkpXT3JSSGZudWp1L3RUdzRj?=
 =?utf-8?B?TDJoazg0aURMcmI3Sm9DS2lkTmg4RXZlYjZDbUh1cXVIYWZMMEg4YWJrZXY0?=
 =?utf-8?B?RnpPcDdXZFowZXJlT2Z3b1hUUlErL1ZXWVJEUlhXZk1VWklGUG9kQU02dUc5?=
 =?utf-8?B?RDh5bXJKdlhnMkErcUhXRFkrNHJHSStUUGdiVEFzaWlHZEVKNnFUaTA1a0sz?=
 =?utf-8?B?Kzk4aEU4TWx1b0V6MGhnTnVMbEpoNG9KTCt1NmM3WFBJRFN1UHg1ckF4dWhp?=
 =?utf-8?B?WWhSU0NBYVRXM09NOXJ0NE84V2NhRzQzN0F5b3l1MWRQSGtDekkwV2tsOVFX?=
 =?utf-8?B?Tkc1MjNyaUc2cGJLRUVzdStXdStxVjd6YmFVOGtGRlhIVEVVOExHQjdkTnZD?=
 =?utf-8?B?RGNVZzM0VnZxWlczQVp5ZW54NXB4YStjVEVWQVdTUTN6SStrRnQwRVVLdnF4?=
 =?utf-8?B?bVVxOTVKRTBRZjBRaWdVc0oxdGJUZGs3ZDUzOWhNVW52OHYxREJ4SXVlakk5?=
 =?utf-8?B?ZmlVSjBmTVJWcDQzYXU2VlFQdGlrVDNUeVg3a1JGWHg0K2pRY1ZwU0tJVjRM?=
 =?utf-8?B?N1VvU2tvV3dYVHE2aFBXR2VmcGR5QUVob1hxcnQzSnNhMUVkb21xVXRHUWIv?=
 =?utf-8?B?QjdLaG9FKzlsWUpTbnNFWVJBR0NQZFVGK2tjc3gvUXhiQlkrZXZCUUwvc2hk?=
 =?utf-8?B?Q1FrV2RaZDVGS283bHlhQWlETkkzemhhc0VDbWtOYnNTeWlnT05QTDZJd3Rr?=
 =?utf-8?B?WTFhSnEwalZvTmo4N0dsWVBmc3g1Mk54dS9oa2FwSkc3ZENqTmttMCtiSy85?=
 =?utf-8?B?M2pWT29jTEcydmplMmNNaUg2blczZ3Q3R254VWtTWFh2OTN2bVdnblo3SkVX?=
 =?utf-8?B?T3hIbWxLdnp3MzkrOExRQnhxM1RBbllMSVU5bUw4M25nc1NHWjFtNVoySnlr?=
 =?utf-8?B?UmdMT0lZajRYNDdoZXNwdDZOVG81WWxGcEthU1FWRVRHMmpucU9vaXNQeGpv?=
 =?utf-8?B?cjFTWjdLWUppL2Z6RWFGZnNOVHdTNTZkWVR2VXk1NjRxRHJrR2x6K1Q1Y3lj?=
 =?utf-8?B?bFlDY3JVbGUxZG5tVWJ1dld6L1Q3Z1gxOEpVU0dYNnVBR0RwQXl6UnFLdUlZ?=
 =?utf-8?B?ak50Zm5iWTNyTFFNZGNPbjBBbXY2VitWVURudStZTkhRdDFJaFZCVXZ3YnpJ?=
 =?utf-8?Q?yAVyB8uMgmqh4rTY2sFP2ZAut?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 047d7c8c-b235-40e3-1c89-08dcd3bdf4a7
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 06:33:18.8385 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bW+/3vhsXuIWPyr+CCHfNipnH/zVGlb3o/Pr//Z8ze3ork1X2yEfygypnwjUK7RA5UY+Y+Yp0svfcFLLH4b9xQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5718
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


在 2024/9/13 6:43, Kasireddy, Vivek 写道:
> Hi Huan,
>
>> Subject: [PATCH v6 4/7] udmabuf: udmabuf_create pin folio codestyle
>> cleanup
>>
>> This patch aims to simplify the pinning of folio during the udmabuf
>> creation. No functional changes.
>>
>> This patch moves the memfd pin folio to udmabuf_pin_folios and modifies
>> the original loop condition, using the pinned folio as the external
>> loop condition, and sets the offset and folio during the traversal process.
>>
>> By this, more readable.
>>
>> Suggested-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
>> Signed-off-by: Huan Yang <link@vivo.com>
>> ---
>>   drivers/dma-buf/udmabuf.c | 134 +++++++++++++++++++++-----------------
>>   1 file changed, 76 insertions(+), 58 deletions(-)
>>
>> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
>> index aa182a9dcdfa..fe1466f7d55a 100644
>> --- a/drivers/dma-buf/udmabuf.c
>> +++ b/drivers/dma-buf/udmabuf.c
>> @@ -328,17 +328,68 @@ static int export_udmabuf(struct udmabuf *ubuf,
>>   	return dma_buf_fd(buf, flags);
>>   }
>>
>> +static long udmabuf_pin_folios(struct udmabuf *ubuf, struct file *memfd,
>> +			       loff_t start, loff_t size)
>> +{
>> +	pgoff_t pgoff, pgcnt, upgcnt = ubuf->pagecount;
>> +	struct folio **folios = NULL;
>> +	u32 cur_folio, cur_pgcnt;
>> +	long nr_folios;
>> +	long ret = 0;
>> +	loff_t end;
>> +
>> +	pgcnt = size >> PAGE_SHIFT;
>> +	folios = kvmalloc_array(pgcnt, sizeof(*folios), GFP_KERNEL);
>> +	if (!folios)
>> +		return -ENOMEM;
>> +
>> +	end = start + (pgcnt << PAGE_SHIFT) - 1;
>> +	nr_folios = memfd_pin_folios(memfd, start, end, folios, pgcnt,
>> &pgoff);
>> +	if (nr_folios <= 0) {
>> +		ret = nr_folios ? nr_folios : -EINVAL;
>> +		goto end;
>> +	}
>> +
>> +	cur_pgcnt = 0;
>> +	for (cur_folio = 0; cur_folio < nr_folios; ++cur_folio) {
>> +		pgoff_t subpgoff = pgoff;
>> +		size_t fsize = folio_size(folios[cur_folio]);
>> +
>> +		ret = add_to_unpin_list(&ubuf->unpin_list, folios[cur_folio]);
>> +		if (ret < 0)
>> +			goto end;
>> +
>> +		for (; subpgoff < fsize; subpgoff += PAGE_SIZE) {
>> +			ubuf->folios[upgcnt] = folios[cur_folio];
>> +			ubuf->offsets[upgcnt] = subpgoff;
>> +			++upgcnt;
>> +
>> +			if (++cur_pgcnt >= pgcnt)
>> +				goto end;
>> +		}
>> +
>> +		/**
>> +		 * In a given range, only the first subpage of the first folio
>> +		 * has an offset, that is returned by memfd_pin_folios().
>> +		 * The first subpages of other folios (in the range) have an
>> +		 * offset of 0.
>> +		 */
>> +		pgoff = 0;
>> +	}
>> +end:
>> +	ubuf->pagecount = upgcnt;
>> +	kvfree(folios);
>> +	return ret;
>> +}
>> +
>>   static long udmabuf_create(struct miscdevice *device,
>>   			   struct udmabuf_create_list *head,
>>   			   struct udmabuf_create_item *list)
>>   {
>> -	pgoff_t pgoff, pgcnt, pglimit, pgbuf = 0;
>> -	long nr_folios, ret = -EINVAL;
>> -	struct file *memfd = NULL;
>> -	struct folio **folios;
>> +	pgoff_t pgcnt = 0, pglimit;
>>   	struct udmabuf *ubuf;
>> -	u32 i, j, k, flags;
>> -	loff_t end;
>> +	long ret = -EINVAL;
>> +	u32 i, flags;
>>
>>   	ubuf = kzalloc(sizeof(*ubuf), GFP_KERNEL);
>>   	if (!ubuf)
>> @@ -347,81 +398,50 @@ static long udmabuf_create(struct miscdevice
>> *device,
>>   	INIT_LIST_HEAD(&ubuf->unpin_list);
>>   	pglimit = (size_limit_mb * 1024 * 1024) >> PAGE_SHIFT;
>>   	for (i = 0; i < head->count; i++) {
>> -		if (!IS_ALIGNED(list[i].offset, PAGE_SIZE))
>> +		if (!PAGE_ALIGNED(list[i].offset))
>>   			goto err;
>> -		if (!IS_ALIGNED(list[i].size, PAGE_SIZE))
>> +		if (!PAGE_ALIGNED(list[i].size))
>>   			goto err;
>> -		ubuf->pagecount += list[i].size >> PAGE_SHIFT;
>> -		if (ubuf->pagecount > pglimit)
>> +
>> +		pgcnt += list[i].size >> PAGE_SHIFT;
>> +		if (pgcnt > pglimit)
>>   			goto err;
>>   	}
>>
>> -	if (!ubuf->pagecount)
>> +	if (!pgcnt)
>>   		goto err;
>>
>> -	ubuf->folios = kvmalloc_array(ubuf->pagecount, sizeof(*ubuf-
>>> folios),
>> -				      GFP_KERNEL);
>> +	ubuf->folios = kvmalloc_array(pgcnt, sizeof(*ubuf->folios),
>> GFP_KERNEL);
>>   	if (!ubuf->folios) {
>>   		ret = -ENOMEM;
>>   		goto err;
>>   	}
>> -	ubuf->offsets = kvcalloc(ubuf->pagecount, sizeof(*ubuf->offsets),
>> -				 GFP_KERNEL);
>> +
>> +	ubuf->offsets = kvcalloc(pgcnt, sizeof(*ubuf->offsets), GFP_KERNEL);
>>   	if (!ubuf->offsets) {
>>   		ret = -ENOMEM;
>>   		goto err;
>>   	}
>>
>> -	pgbuf = 0;
>>   	for (i = 0; i < head->count; i++) {
>> -		memfd = fget(list[i].memfd);
>> -		ret = check_memfd_seals(memfd);
>> -		if (ret < 0)
>> -			goto err;
>> +		struct file *memfd = fget(list[i].memfd);
>>
>> -		pgcnt = list[i].size >> PAGE_SHIFT;
>> -		folios = kvmalloc_array(pgcnt, sizeof(*folios), GFP_KERNEL);
>> -		if (!folios) {
>> -			ret = -ENOMEM;
>> +		if (!memfd) {
>> +			ret = -EBADFD;
> Nit: with the above change added, please remove the redundant if (!memfd)
> check from check_memfd_seals().

Yes, right, I'll do it.

Thank you.

>
> Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
>
>>   			goto err;
>>   		}
>>
>> -		end = list[i].offset + (pgcnt << PAGE_SHIFT) - 1;
>> -		ret = memfd_pin_folios(memfd, list[i].offset, end,
>> -				       folios, pgcnt, &pgoff);
>> -		if (ret <= 0) {
>> -			kvfree(folios);
>> -			if (!ret)
>> -				ret = -EINVAL;
>> +		ret = check_memfd_seals(memfd);
>> +		if (ret < 0) {
>> +			fput(memfd);
>>   			goto err;
>>   		}
>>
>> -		nr_folios = ret;
>> -		pgoff >>= PAGE_SHIFT;
>> -		for (j = 0, k = 0; j < pgcnt; j++) {
>> -			ubuf->folios[pgbuf] = folios[k];
>> -			ubuf->offsets[pgbuf] = pgoff << PAGE_SHIFT;
>> -
>> -			if (j == 0 || ubuf->folios[pgbuf-1] != folios[k]) {
>> -				ret = add_to_unpin_list(&ubuf->unpin_list,
>> -							folios[k]);
>> -				if (ret < 0) {
>> -					kfree(folios);
>> -					goto err;
>> -				}
>> -			}
>> -
>> -			pgbuf++;
>> -			if (++pgoff == folio_nr_pages(folios[k])) {
>> -				pgoff = 0;
>> -				if (++k == nr_folios)
>> -					break;
>> -			}
>> -		}
>> -
>> -		kvfree(folios);
>> +		ret = udmabuf_pin_folios(ubuf, memfd, list[i].offset,
>> +					 list[i].size);
>>   		fput(memfd);
>> -		memfd = NULL;
>> +		if (ret)
>> +			goto err;
>>   	}
>>
>>   	flags = head->flags & UDMABUF_FLAGS_CLOEXEC ? O_CLOEXEC : 0;
>> @@ -432,8 +452,6 @@ static long udmabuf_create(struct miscdevice
>> *device,
>>   	return ret;
>>
>>   err:
>> -	if (memfd)
>> -		fput(memfd);
>>   	unpin_all_folios(&ubuf->unpin_list);
>>   	kvfree(ubuf->offsets);
>>   	kvfree(ubuf->folios);
>> --
>> 2.45.2
