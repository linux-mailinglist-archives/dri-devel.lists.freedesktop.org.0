Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6409778DA
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 08:31:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A58D10EBA6;
	Fri, 13 Sep 2024 06:31:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="Gzh5uKVF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2060.outbound.protection.outlook.com [40.107.255.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD71310EBA6
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 06:31:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k4+yAt4L2nuBmtREWhSRi9ELYMhvVG+HotjiwmuIp2X+ESCQrAJCvfm66w/XzET8DbU8s/7RLF+ZzDBjEep8wreoFIe6/YT0dIzhLpnxBfswsyPG6T/n2uvSs29XMcDoeGDl+hI+P93uY/ycc0WFGfhKzNZhfxGcmooJOHx++qTYGvf4AGlqR9PLfAaJSVO09zUUmVmSqVzj/CEvtvjRCqpCAYs+k2cvXWrZDUNH/dwIV/L8iJ/fPLWqm7DZ05RaXQi3j2FvSKMFbILYwbgyU9QRtqYC3Ar32hJcVrfCCbvlU+uH6g7Ocln3+4KCmKnL4GG9iagUvtd8GuEUxV+icQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vbYMjrud4zEvIY6c++bulnEs/QmujSjYlOaOEhxEvcY=;
 b=ueOuooJJFm/CB4DMujLVQS7HbXxBSMSchaspc7VfRaTIbnm9QFfel4C89gAUg5C5HOzbC8tAqU9dhQR2gQkFeBvog3DoVW8R7zBRQtDY/BsTIpzjy9qPhZr974pvCtG68+9AJRxfv4myTo4vjhEOzyM2t2m3QKxvdvXs+ZrLRnDt09mQr0mWfCkZMC3V4C88rMPtBoLqnCPzdfWbtvJ3tnyODBA7DlDwd2iPpKNNsErJRAPDgweQaAawZO0Aw5I7LTtHUSazrmqDLj5V1j7I1I5C8InXjrDZq9axvhIFL5QxqK/4XesdOGVLfxjEBSJZrBlhBPjBBQ3thE9dyJ/UcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vbYMjrud4zEvIY6c++bulnEs/QmujSjYlOaOEhxEvcY=;
 b=Gzh5uKVFkeqcqMdYR1zCKAQWWF7oV0xmavjG1Zfto2bsDLZHiIggGxDyigvAD3F76FKHaK4bl7LO+sh/zlj05IpKFy3P/wwBtWemUFBY0GXOIRQEWk5SbQdzaFRP3B6mOUG8RifDvE2VXlvW6xsrPdG4CsLSxmgH2hLnSVXZfoZDCs/ECBWcyjmvgAE4CUogq1hBPcGDsaaHcHqg/GWEycHmOctGWhP3Z/U5lmGnSxCAXjxcpczbHDm0qWeO+q5ENd1eqfJivKG+RRBoV+v79ilq3/aw7jbHhxP0JjuJkqpLkT3Gs18QWI9ys4i8RGTHP41DHRrYCuSeH+j0vF1Cdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by SEYPR06MB5868.apcprd06.prod.outlook.com (2603:1096:101:d1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Fri, 13 Sep
 2024 06:31:42 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%6]) with mapi id 15.20.7962.018; Fri, 13 Sep 2024
 06:31:42 +0000
Message-ID: <37e1f8a7-aa94-4a2b-9cd0-cb788a4f0b01@vivo.com>
Date: Fri, 13 Sep 2024 14:31:36 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/7] udmabuf: fix vmap_udmabuf error page set
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
 <20240909091851.1165742-4-link@vivo.com>
 <IA0PR11MB718549B45FCA4C85C1C99CA4F8642@IA0PR11MB7185.namprd11.prod.outlook.com>
From: Huan Yang <link@vivo.com>
In-Reply-To: <IA0PR11MB718549B45FCA4C85C1C99CA4F8642@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR01CA0116.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::20) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|SEYPR06MB5868:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dca8d0c-e44a-4b1e-f029-08dcd3bdbb0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|366016|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dS9oKzBHSTdUa3FXdzZ3dGpmdnVvdWdhZGtPYW5peHVReEQ2a00zSHRmbC83?=
 =?utf-8?B?cm1Dbk5FVDhLeGd1OEowa2F6QjkvSVJTZkVSeFpIcVdDME1talJXMkh1amRT?=
 =?utf-8?B?Q0RueUFjRG0waGtCM256ZS8xQjN2Si83ZXU3QUhucmNXbFlhN3YrczJMTzNF?=
 =?utf-8?B?VG9OV1BNNElRUG55UTYxZHNRSlJQalBJL1JBdDlkSW1IWTl5VWtqbUtGa0ZQ?=
 =?utf-8?B?OCttZGRDSGw5SU9Qdm9EcDhKWitnblpiMFVRRDJFQXl3d2RlMldHZ3pyU3E2?=
 =?utf-8?B?bG50blcxczRtak8wUFI3bHYrV3E0T3JYQTFJUjFqMEpaYUVmNVA5WG5QQVZn?=
 =?utf-8?B?N0VtMjBweStDUjg4YnY5d2pvcVBZSHlhdjNzTE9ZdkxsMWQyZXFGSXphNUFY?=
 =?utf-8?B?VVZMVG4yRkR1dUlRN1FYWUFwcEY4L1lXY2ZWeFBHMWFZNXJtM0lpVmlnN2gz?=
 =?utf-8?B?UWR3TW9tekFSNDJpOTgyQTdCRDdwVjBCYVlwMEhaSjFOZmphNnIyT2JzVnJT?=
 =?utf-8?B?NHVhd0ZQRng5VVhBUk1SR0lySHR1TlhDWTVDOHJCdFRZbXhHdEhZcERKM25k?=
 =?utf-8?B?OHFEOUJGVEpQTWx6cGI3aGlKS25za28vRGp5dGdvaDZSOUJsL1FlYzRXUlhP?=
 =?utf-8?B?cUNWL0lrYXdTb3d6cXRCR2IxTmxGRXZ3clZPSHFmTUlONit6aWNRTkEyNGo2?=
 =?utf-8?B?KzVMd2RacUprSDlPZWxYZkZiWkh4MEdlU1pGUjBOU21McUtYNWhtZDNyR2t2?=
 =?utf-8?B?dHhnK2tsWElBdHRrdWlhL001YnI3NjhnTEVGaGxBTVQ2WFVqS0xIZE44ejEz?=
 =?utf-8?B?N2JEUWdoY21HbjIxa3pxNEFkdUw0d0RLZzE5YklPSnFpRXFpMjJ3U0tSMVNF?=
 =?utf-8?B?akVnNkN1alBqM1FlMzMrTnhJbG1ITjhQZEY5Ni9JN1hqZTVvS202aVB0SEZk?=
 =?utf-8?B?a1RxNS9sYmVZc0hnYU5RVDJvb0Yva0pIMEN5ZE9MWXdRUEgwckNsUXgvd2dn?=
 =?utf-8?B?dldGVDVHcjY1b0ZXRHR1NEp4SS9rUFpVZUhib25wUUN3Z2w0S2d2UGIwOGhq?=
 =?utf-8?B?dk1weEFaU0lGNjdySGw3TGozdngzcm85djRPTnJZWVQ1S3JtL1FyVGZGQ2M4?=
 =?utf-8?B?MDl1YkZIcHF2cnl3N1crOUpsU3ZwYWx1RGY1U09RVlN5cUk4eS9wU0Nramk1?=
 =?utf-8?B?TXhtY016V3k1WEpMT0x3UGtSL2pETGpXM096R21vbDFhQlBlRXZlaTZDSDNL?=
 =?utf-8?B?Wjhmc2VjV2lmeS9SSERiSWJyY1FtbVc4TXR0c2ZsNWVtYk5FT1cvZFI2dkw2?=
 =?utf-8?B?V0lia01QS2xIRXlHUTd3eDlqTmdRcStQbUtXc05oN0w4MFVwcEl1cHpiQzVa?=
 =?utf-8?B?STFERkFPVUowSjNaZlNMeUdidS81ODQ1Rm5QMDFhTWxoVEtkdjdqQkExUnNB?=
 =?utf-8?B?LzRJWndUNlpwL05GRjY1M0xjaUR4aFZ3K2JEZkxWSTZQd1hja1pWbHA2Nisv?=
 =?utf-8?B?VXh3Z3ZOd0cwNmVOYUFLcDBtZU4xbExiZld4ZFliZU5zckwxclZheTVXcTcr?=
 =?utf-8?B?ZitzWDlnVDZXNlppRi8wL1MrOGRYeENJdWE0dXRXUUo5dHZpY1llTUcwNElz?=
 =?utf-8?B?UUFhOUpySi80d2ovUzVzcUJNZC8xOXg4Q3RGbEN5V3BHTGQrUG5SZmRIVjZZ?=
 =?utf-8?B?WFUxLzlZT0E3WVByQzA2VGpCR09TVmJydkVVWTkrazR1cldpZVRmeHVqOGN1?=
 =?utf-8?B?VlA0VWpIaDVzd2FEWTFIdjhqNytwcG9BM0wyTG1TWlVpQnBEZTh0Vzl1b2pJ?=
 =?utf-8?B?ejFnQk1Ddkh4dWVvUDZqTkZSQmtIdXRnL041OHBUQzRCVnAxTWFuL1h4Tk9p?=
 =?utf-8?B?Z2xDaXhDU3lMeUdvaGNiVlUrSjJFRTRLYjVEK1lGYWQzU1E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(366016)(376014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?enh5TGJSSGZwSkVCVXVrZzRTR3dnc01hVjVqUTdpcTg0TWMrOFVZTWFxTVYw?=
 =?utf-8?B?UFNMS1VsS0l2VTJVSTNtSzRrRFVoTjFwbE4wbEdxMHJ2ZXZKOFR1S2ZSVlFR?=
 =?utf-8?B?dHA5TUIwajBFUk4xeGVWd2gyUVpRZ0VjQ3NhUlBJWktVa1RQbzNtQS83dmRh?=
 =?utf-8?B?VXpEVk1RTDNlaFVlR1RselNERmRRYncwN29waWNhRUJzRzhIQXhUTlp4TldL?=
 =?utf-8?B?NWRNMGhiMmxXb2FqcDNKWi9ET3R0aUdCS0l4T056L1dMNWNMMnV0bVVIOUpy?=
 =?utf-8?B?RkoxWWhCK2Z2S2t6VTk0c1c1eUFic2U2bUIxZzVKdHUzWjY2b3lPZUVHaCtC?=
 =?utf-8?B?UndITUJBbkhjK25xM1U5ME04VlNqeklkd2NjWCttYmxJZjJGQWh6alA4YzNB?=
 =?utf-8?B?MG9Xd0ppb2tjNnNqMHlNNldra0lRV2pEckVpYWVURU93eXQ5K2x4UEpqa1dQ?=
 =?utf-8?B?SEY4anBnZTNEUzcwcE1TaW1USmZRbmVOSHVOYi9BYmMxNmlRVEY0bHVhLzF1?=
 =?utf-8?B?Z2wzZ2JtV0JFWUpUVjZzYVRuSHZFQVZMOFdCQlFLRUY0QS9MWGlvSmZ0c2dh?=
 =?utf-8?B?a25kOUN4SWt5anB3c3dFTHpOc1JZOHk3WmxkWGo0YklLTWhPNHdLRi9mUmJT?=
 =?utf-8?B?MkhWNGNqa2tucisycUlvVGhIOFpINDJjWGxjMTE1a1lkU2hwblFqSG1iQlJ6?=
 =?utf-8?B?TW1yMUREbmNhSkJ2eHlBdlVEd2lTNWZpN0lCbDRLSkcyVVh0M3pwN3JLWTdM?=
 =?utf-8?B?OFR1enR1dWlZUjUxSjIzTU5uVVNBd0dHOVpkaXpBRTRHMFJiNWhINUtFem5Y?=
 =?utf-8?B?WVM2dnJObWxnQ1pHRkZhbG0yUWNKK2NjSFoyd25jWHZHTm9VTjZaRzhyOUwz?=
 =?utf-8?B?ZDNZb2duUjFWRlJJQkdLL2JNQ2JvcnlVa2RzNUNzdkJtSXRwbENTeEpCbm5h?=
 =?utf-8?B?c2t4Q0dCaHlUWXpuSWlPRnk3OWxFQitSdVgxWE56ekF1WHMwZ2NqSndxMkRQ?=
 =?utf-8?B?RWhUQzdJN2tEWmVxTjBuSFBmVFB1c0ovYmFQREtiV053Ui9oV1dRZ3hVdTdL?=
 =?utf-8?B?MFIyNUxlblFYbHpSZTltK1IyZnJHS3YxWVV0alRnUjJnM2czNWUvM3F6endT?=
 =?utf-8?B?ZmQvaVZIM2RPNyt0d1pHMUY3OWhVQ1RsNEZpVVV4ZllhU0Z1cnZmMHRDMkpu?=
 =?utf-8?B?K0w3YUh2dkFNdlc1UUdOMm9rUUJiSmpEVnorWlZYK3dIVVEvV2RPOVg0UUxa?=
 =?utf-8?B?TEN0eTVlaGtkOEh4SFVtRU9qRlNZM2pGblNaTW84TldLYmxpWFNBQ3NXSVlH?=
 =?utf-8?B?YWNGeUFGWVhrNk9aSE0vdnZWeForMDREZGora1VneDBlYlpRS1VlbmVzRnIr?=
 =?utf-8?B?OEwyQ05XRVhFMWhMYnhMTUFISGF0WjlZemVGSjB6emd5dnBPRXljVzFOSEI0?=
 =?utf-8?B?L3RuYWpKYVJ3OTJzQVhCKzBZdnh6YzRQYUxBdHduTHZ1bU1mU0k1VTdVaFBx?=
 =?utf-8?B?aW1nM04vU2RzbWxoR2ZWTkc3bjZBTmtObkdGTFNVWnNKckM2eVFsVTFrRTB0?=
 =?utf-8?B?R2JZYnA4UU1Yc09zWU5ocVFqazhzNGFwdkg3aGNKc3k4Y21SUmRva3RqUzJw?=
 =?utf-8?B?TE01SUdmT0NhSTBtZCs2WGhlcEprbFhqTVphYjcrVDNRYmU4MmV1cmRFMS9Y?=
 =?utf-8?B?cytSVElFeXRUWmYvcFVnNTJ1bXFjVDhlZGRqczRnUnI1RUxkUWdjbVpBbU9p?=
 =?utf-8?B?eEtuMXFaZnZRMmFFTzlCNDJja0srQzQ3MVVrQ1VOb09YQVN4RnRCZDA4OHRC?=
 =?utf-8?B?QngvZFRiVHZ2d0pJSE9xYzhoS1Fic2treStZUU1FUEFSRjNleW9PeUZNY1Jh?=
 =?utf-8?B?S3I2NUhDN2JwTlVIWUFYeEtWaTl3aENCaW4rQTN1ekNiNGZSeDlMcjZXdXBw?=
 =?utf-8?B?ZHU0QS9lS1NhRldYL0xXcDUzaTJUOURISk5LaTFHeXRTYVNLVzdROWJES0RH?=
 =?utf-8?B?eG5YR2ZOazE0OFU4VGMrT2FRLy9MZGhUeENWL25vQ0dLS1VaV2RBRUFXSUVD?=
 =?utf-8?B?UlJ2Mk15bkJUbTZUWitiSFJRaEdRV2J2NDkwbzUrUWxTRDN6RE9PVnl5MEor?=
 =?utf-8?Q?16eewULiAGTmBodY1TKVLxS91?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dca8d0c-e44a-4b1e-f029-08dcd3bdbb0d
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 06:31:42.2763 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y0I087LjUfNZMPycJzwh7pGUyooirLPiewdrtpZ5jFr01KZsc0msb1hCt6z7K6qYaJOYG8o1OqZplQGPXfNE9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5868
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


在 2024/9/13 6:37, Kasireddy, Vivek 写道:
> Hi Huan,
>
>> Subject: [PATCH v6 3/7] udmabuf: fix vmap_udmabuf error page set
>>
>> Currently vmap_udmabuf set page's array by each folio.
>> But, ubuf->folios is only contain's the folio's head page.
>>
>> That mean we repeatedly mapped the folio head page to the vmalloc area.
>>
>> Due to udmabuf can use hugetlb, if HVO enabled, tail page may not exist,
>> so, we can't use page array to map, instead, use pfn array.
>>
>> By this, we removed page usage in udmabuf totally.
>>
> I think this would probably need a Fixes tag:
> Fixes: 5e72b2b41a21 ("udmabuf: convert udmabuf driver to use folios")
OK, I'll update it
>
> Thanks,
> Vivek
>
>> Suggested-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
>> Signed-off-by: Huan Yang <link@vivo.com>
>> Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
>> ---
>>   drivers/dma-buf/Kconfig   |  1 +
>>   drivers/dma-buf/udmabuf.c | 22 +++++++++++++++-------
>>   2 files changed, 16 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
>> index b46eb8a552d7..fee04fdb0822 100644
>> --- a/drivers/dma-buf/Kconfig
>> +++ b/drivers/dma-buf/Kconfig
>> @@ -36,6 +36,7 @@ config UDMABUF
>>   	depends on DMA_SHARED_BUFFER
>>   	depends on MEMFD_CREATE || COMPILE_TEST
>>   	depends on MMU
>> +	select VMAP_PFN
>>   	help
>>   	  A driver to let userspace turn memfd regions into dma-bufs.
>>   	  Qemu can use this to create host dmabufs for guest framebuffers.
>> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
>> index ba9dbc7caf71..aa182a9dcdfa 100644
>> --- a/drivers/dma-buf/udmabuf.c
>> +++ b/drivers/dma-buf/udmabuf.c
>> @@ -103,21 +103,29 @@ static int mmap_udmabuf(struct dma_buf *buf,
>> struct vm_area_struct *vma)
>>   static int vmap_udmabuf(struct dma_buf *buf, struct iosys_map *map)
>>   {
>>   	struct udmabuf *ubuf = buf->priv;
>> -	struct page **pages;
>> +	unsigned long *pfns;
>>   	void *vaddr;
>>   	pgoff_t pg;
>>
>>   	dma_resv_assert_held(buf->resv);
>>
>> -	pages = kvmalloc_array(ubuf->pagecount, sizeof(*pages),
>> GFP_KERNEL);
>> -	if (!pages)
>> +	/**
>> +	 * HVO may free tail pages, so just use pfn to map each folio
>> +	 * into vmalloc area.
>> +	 */
>> +	pfns = kvmalloc_array(ubuf->pagecount, sizeof(*pfns), GFP_KERNEL);
>> +	if (!pfns)
>>   		return -ENOMEM;
>>
>> -	for (pg = 0; pg < ubuf->pagecount; pg++)
>> -		pages[pg] = &ubuf->folios[pg]->page;
>> +	for (pg = 0; pg < ubuf->pagecount; pg++) {
>> +		unsigned long pfn = folio_pfn(ubuf->folios[pg]);
>>
>> -	vaddr = vm_map_ram(pages, ubuf->pagecount, -1);
>> -	kvfree(pages);
>> +		pfn += ubuf->offsets[pg] >> PAGE_SHIFT;
>> +		pfns[pg] = pfn;
>> +	}
>> +
>> +	vaddr = vmap_pfn(pfns, ubuf->pagecount, PAGE_KERNEL);
>> +	kvfree(pfns);
>>   	if (!vaddr)
>>   		return -EINVAL;
>>
>> --
>> 2.45.2
