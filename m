Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLP/AvWte2lOHwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 19:59:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E9CB3BF4
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 19:59:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFE8210E275;
	Thu, 29 Jan 2026 18:58:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="aqsfQZS/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010028.outbound.protection.outlook.com
 [40.93.198.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CAF310E275;
 Thu, 29 Jan 2026 18:58:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YpzcxBXwzocauAip/y0z2UgTYdTOHESw6Qaj1p6uTcJERBUFReLw/tzvm1SKW+wJ14rRqTVnCmNVNHINk4YlaK8uplsMTdSwQsaQ4ne2vQv0WdWEKEkqWd8BgmmgC0ZDZXFuwtn7am0Ciqetvzezt//U6Mxh66w8WMy55KOTBkS4KLkTs8lfas8fs7dFBaMmNk76sSMYYFzWaj+CzUKvXNsCsNjSZutSY3hU0EeX6QeeFoZO1SyDdmfM+Mcpu19PW6ANA+FRjQD6atSR4L+ZArZXRfHaYrWxJ5TP5r2C1WvURFqNL7uZ02JyWgeMnOH9AQt+dZMNcDl5BFqjbwWi1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g7zwgOU899h4pFfdaLrc7fu56ZsCGsdCFXBVBNl/jbM=;
 b=PKQn8XmKpyuU0hunYf2FPsGLwlBM5rRF3MtM+nmrp0xRJYJtCwFm6eZbHbhkLDSLrHWhHG0+bvBy81sx8i6aoLACi5Q1vbalGoIbVb13vZjPrinWXEypmKqI270nef0ikqODeDD4E+/6fYgMJJsxt/B4hFJD/5ht1sy9TPWG9vIMPC1ZjtYYH80dZW1pLi1D/SHIe3jEsgOl0ptBfmPDRhUn4yog/GwUwMT8Xui8fCTxU99B8lDJOWyTGAOCZj+jCIeQ45fje+Bm6FezDUMEkdnpqwUau5kd4IPpzvkjrwQmSz8FYGfRFtlIBYO6MtFHBcsVx3py/u8vm/f6A2hDUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g7zwgOU899h4pFfdaLrc7fu56ZsCGsdCFXBVBNl/jbM=;
 b=aqsfQZS/kl8tk4cSGs4JRFAAxChjygucZCSTQ7Hi/DEyZM4Pi4PSEHDDJfPoeKcXGiTB1E0I42bXvToJC21zjoc0fNKrJUe/UbFmB/FMgfwNet1H0VnY+KPVoafKmlwJ6RHcysvZKsM/kpsT18iqdALRJRCk8vYZKWK6Eu2pZKopEDdS35RCz+i9HgcK1g0F7+AQu4/XF1cJHksMvKBMHGTMsJHrbp087VtWfAPTfSIZz3mkuet1DCX0ShYxDWn4x9Qvst9jONOk/ob9e3yIl/J0TeUyiimM31G2bVLLkm98NieK9FilUplt4+nJMwJ4QKxOHtTBwOB/3DjTr5F5Bw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by CH3PR12MB8260.namprd12.prod.outlook.com (2603:10b6:610:12a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Thu, 29 Jan
 2026 18:57:33 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9564.010; Thu, 29 Jan 2026
 18:57:33 +0000
Date: Thu, 29 Jan 2026 14:57:31 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 leonro@nvidia.com, francois.dugast@intel.com,
 thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com
Subject: Re: [RFC PATCH v3 06/11] drm/pagemap: Add IOVA interface to DRM
 pagemap
Message-ID: <20260129185731.GA2333318@nvidia.com>
References: <20260128004841.2436896-1-matthew.brost@intel.com>
 <20260128004841.2436896-7-matthew.brost@intel.com>
 <20260128151458.GJ1641016@ziepe.ca>
 <aXpYrfUmEaaOsse8@lstrano-desk.jf.intel.com>
 <20260128193509.GU1641016@ziepe.ca>
 <aXpwecQRovIurYKV@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aXpwecQRovIurYKV@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: BL1P223CA0014.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:2c4::19) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|CH3PR12MB8260:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a7baaab-542b-4d03-a8ed-08de5f68425d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bHl5VHNKL1BaMFQvZ0pTd0dZZVJsTm5USzlvSWUzT2VsQ1JlSk5lV0JSaE9H?=
 =?utf-8?B?MkVCenpZeUx0VlkybzBPUHVub1pLT0VFQjNhSmtxTDFkMVIyb2x4VTJ0M25G?=
 =?utf-8?B?ZXZhais2aHVEMXBpY3crS2tKZHFSWWJ1Z3YrelhLRDBXN1ZJTnk4QXlleWdn?=
 =?utf-8?B?OXJibkZpYnlVeFhzTmdnSzhpYXRRSVA2bFBzK09NZko1QTNJVHpONU9ZQzU3?=
 =?utf-8?B?aVJVcW5zN0F1YVo3aGZ1TWVGclFTd1lhRkxrTFNoT0hjbVFHUWhreWdTdGNM?=
 =?utf-8?B?aFNFeG1hYkpyNHpVM1BwQ21kL0hQYWZENDMxM3RVNm80RDUva2pmdVdYY3FD?=
 =?utf-8?B?ci9MQkdXRWFpMHFseHJDaWNqVS9SYXhVNjhLT05zYmtDYWlaT2o5K0J1UThx?=
 =?utf-8?B?eW5xUzBpVjMvQnhtd2lpV25qOXJuTzRGQUpCbW1qbjFyVXRSb2puZURZazUr?=
 =?utf-8?B?YW1nemFidW14ck9BTkRGbFphR0NuUFdyLzl4Rk5Fd0R5ZFIwQXdCNzdXVWFM?=
 =?utf-8?B?VVpwa3FkVUsyQy82TkpxN2xWMzZ6Q2Z2dVNzMVpiRWxZRXlhSDhSYjVyU2I5?=
 =?utf-8?B?Tkp4ZTYrSGY3YWhuNHQ0akFXbndUSFZTMW9zN0F6MDBnak9ZQm9uWEdmMUlh?=
 =?utf-8?B?M3FQZ2F3VDFWR0I0THlub3ViYjBnNlE3Y1FaQlpyQkpid1owMDlNMUxyUjd5?=
 =?utf-8?B?MjlRVWZiaGNCK1BxUEc4T29RRzJqRm1ZaGM0bzFabFVzRDc0d1g1a0lJU09i?=
 =?utf-8?B?VWdVWStKSllBNFU5QVVYaTMwK01WUFFubkJqVWVNdFdMcEZqNEwzQ3J3cmUx?=
 =?utf-8?B?Z2RjZk9FNE45YWVCQ1R3NFNUZVVYUVJWV0pHSnlOaGV0NnkyeHNBekxvMjJB?=
 =?utf-8?B?eTRaYzVxS1hNTjdtVzVGR2RZRHpVSlM0V2xJUDJibzF0YzVTbFZyc2FEcEcr?=
 =?utf-8?B?SHpsOW1FWVAwYzhJeEpMMFhXM2p5WmJad3MyZnI5OWlUWExraVlGWG9yeWR1?=
 =?utf-8?B?SHlqR3BBU3hHdThkZjlSZmFkUkNRUWZIWHhSSjN1azE1cE10L1BvL0RnV0Vs?=
 =?utf-8?B?L0RxSVpVdnIxQmJaWDZJdEl5SEFBdXJWUXpFaEc0Y1JuQWJOK2lhMHUwSUhI?=
 =?utf-8?B?MVZyd3Y4eDBWd1YvMzVYRjkvOVZLd01LNFJ1MVZNUGFMaFBXK0FpcVRTNEVH?=
 =?utf-8?B?aVI2eE4wcnNETDk2RW5id0ova3BnSUtRdWlibUFWdWpXT2dtRFQ3eDRGT09q?=
 =?utf-8?B?V0RnZWJCREhqS2NwVmxRYSs2VVNvV3k3ZEtrU3RvVlpkTzVYdlkzc0RueHVH?=
 =?utf-8?B?K0p1dTkvcUdhZldjNEc2eXB5Nnk0dm0yV2hvYlE4Nk1hVi8yUmpFbnRXenVN?=
 =?utf-8?B?V1VWNzI0ZXAwbWFYc0pKMnJ1elFHRWZJOXdpdlZqUURZeUpJaXFuTmkweFFF?=
 =?utf-8?B?MzhJako1enRVd0NHQjVCamROejdkTy9qcjRmcUVodjRjd2lFVkt6L3hjcUIw?=
 =?utf-8?B?dUpnYTN6MEpCZU04clN2ZkFySEN0Ym9XVWNHMnBvQlgzNmwvcnJtR3UzMUhz?=
 =?utf-8?B?K3FaRE9EMVFncVdjeFpqVFgvTWJKUnFQNXNzalBhUnZyMk9ycDJaRzExNUJS?=
 =?utf-8?B?RmlLVGZHTzJiVzh1N2tlZktyc0VhU1pCbVhsbVdBeXV4Um15eW83MWx1eVdz?=
 =?utf-8?B?aHpPVDNLSlJOTzRoTDg3MFF3alk2Z1lhS3pBQzQ4ZjBqY25oOEUvYVFlOWo0?=
 =?utf-8?B?T1NVYVNXa1NsZ1gwVzVtQWsyZXdrTjRQV3VKTUFZVW1EblBEUnZVWDlzM2w5?=
 =?utf-8?B?a0g1YUZBY0ptaEZ0SEpkbTFsb0JmSGRidHQvN0MzN3FaK3dmUzYrS0g2bGV6?=
 =?utf-8?B?dVJNeStoaWw5dHE2eUNzR0pCbVZOcW4yaTVxL0dNeWdtYkRUT0ZIbnlkM3Ez?=
 =?utf-8?B?eTA5L2lhVlB3WEVkQy9GMkYxb3VHc2l1SjhMRXI5bVJFV1Fsbjk1cGxjZHRB?=
 =?utf-8?B?UFFiZjIyUit5dHpEa1d1dWJHZjRKeXJGY2dBZjdxRGwwKzRSWkhDWnBqeWdv?=
 =?utf-8?B?bWlxVE9WeVRqNHY4TlAxMm5xakc5SlRwT1g1UkFzNlJRRThaM1BSNHhQVkxi?=
 =?utf-8?Q?Hi0s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR12MB9620.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2RkYkIwYjk5dUhacG95VUtJTUF1N0hYcEJnU0Y5RmVZM1ptUEJvV1VKVzZa?=
 =?utf-8?B?aTY3UVFiMTg1SVlLbEhXTWkzNndyRlVNT0NFYzllaUEvY01UV1pkdmc0elhl?=
 =?utf-8?B?eDNYL2xab3hVRWc2YS9OSjdDdnB5UFhmdFZSWkZsSmVna2xuaUlwckg0cTY5?=
 =?utf-8?B?K2hUM25BZXIrbzRuZHkzTGw3SzhkT0t1aTBtaFkxWmE5dmtuV011Wk5FeXZJ?=
 =?utf-8?B?OHFEanZjT3RzSzNnOEw0YjVnYXEySG9uRVpvdTkzdkNSbG5JK0Jpd0VRWEo2?=
 =?utf-8?B?aExtMGl6dngxZGZSUkZ4VU9ZeUdRd2tOVkNTZ3YrYUs5NHlKWXZDaWoraGhW?=
 =?utf-8?B?U3BmdVcxZzU4eVpiT2ZTSWd3Mkx3aERDUHBQR0xDSHgrSEpIdFM3WXd0Yjhl?=
 =?utf-8?B?M0dUeitJMEsreHlVb1FmTnhTK0hSb2FzUTRTdHVValpSNEVBNFRDYU4yL3cx?=
 =?utf-8?B?RUYrcWVjVHRuYVBiQzZnYVR1dk9QRHgwMS9YY1Q0U0U4Sm5CeHN1S1RYMitS?=
 =?utf-8?B?ZkhYUnRLUVFka1E2RXZ5VzkvenJVNVM0TjNHdlAyU3lsbnlHQlYvejQ5QnVm?=
 =?utf-8?B?amJxMENjT2ZzQlNzbzVQOThJc0R6SmlBN2dYb1AvdjhHQ3ZMOVFPTjhkS1VK?=
 =?utf-8?B?ZjNFcmVsY1R5bUh0TDE2dm5hZ0tua3RvRUwrN29Bb1FIYzlqQ011Tmc1Q0pR?=
 =?utf-8?B?cFJoOHRNV1ZsWTBRQ1lXUWh4NU9wdFlrcU9rcCtVaFJNZXI2SUxHbVRmT1di?=
 =?utf-8?B?d3B1dVdFM1g4ajNVekRlZWgvYWtsTVlrK212bXdERGZRa3RpZXdEYTgrakVx?=
 =?utf-8?B?cnF4bWh0M3V3RGovVDNvRlF5bzBTdFcwQldYdEp3WjdhVEg1S1hGSktyL0Ju?=
 =?utf-8?B?Nks0QTFGUWJTbjBCZDBQVmtsNlhEUlR0d1hwdVRZK0diZFhPcVZIMWloQ0R4?=
 =?utf-8?B?S0d2and0NmZXMzRoTmRldWt6bitKUXF4a3VDS0JvbDlqMmZTdzZZcG1Pa3ly?=
 =?utf-8?B?eEpHNXRLM05MR3lUWHc1VnNDL3hPTlVDR3JPY2FFMmFMV3VWL1ZyYVF1VjYw?=
 =?utf-8?B?WE10dzBiNHJ0WDBUMGRQdWxydU51V3RYRTNiQXhKOHF3Z1lrZ3BMS0lVTzNX?=
 =?utf-8?B?WFUya0NROUQrdTdoRDRtbllUTFBDRVpZTFFRblZxeE5tR3RsZkx4aFF1ZmNB?=
 =?utf-8?B?VUNPUHNuc1EzN1FmN3M1Rk9OMGhjN2xpSlhKOHp4TG5HVFFUOFRKeVh1SVEy?=
 =?utf-8?B?NGozdzZxK1E0SW8vK3h0dGd2L3FLKzc5disySjFqSXQ0SzIrOXZ4RUlDZG1T?=
 =?utf-8?B?TXVlTmk3cGF2TWttbERyNVRjRU5DNStPSkJGZW5ScEFIdUttTS8wM0FJVlkv?=
 =?utf-8?B?TWZaYjRvckdiRFpQaTF3SGQvYVJmWFdpTkZlWXFibHF5U09WUVV1VEJwbmhG?=
 =?utf-8?B?cjlaV3FWVTVrTWkxQ0J3eFRrbmF0Mms4TDZHV3lLQ3QxNGJ6TGR1TXlHampa?=
 =?utf-8?B?V0hVUG5aZW41eEJaRmU3blhjbGhmQ2JqNFFVNmhTUzFyZnVUa01rSEFGK2Qr?=
 =?utf-8?B?QXpUbzdlT2tMOFIyZWFOS3ZlZmVQekhrRDhUK1RZMnp1S0hjMy8yRkovc2VE?=
 =?utf-8?B?eUMvaTFZZVZESUJQWFVaVHRJRHNiRDk2L004UGlVdit4MXhPRUxSTytON0hu?=
 =?utf-8?B?Z0NweXBFbDJFc3NTZzY3UmVQaHNPMHlOcWZJdU90Z3JYTjBKYlI5TFJrbTJU?=
 =?utf-8?B?Z09zcUFzZC81cThDcUhNY0ZMbndLcTc0VGdTZFFjYXM1Z0p2TDNCRmtOUkZO?=
 =?utf-8?B?NWdneWdDNGZvMXFRMGRqWnNOV1BwS1RmK09sTXJaaTBsd3paSm5GaEY0YlVZ?=
 =?utf-8?B?dmhoMkpzSmtPQjRDTmFGTU1sWFJUT0ZDL1hOYm1JY1lGeFM2WEhhblpsU2sy?=
 =?utf-8?B?aEpFZFJwWXBvd2s5Qi9hNjhGZGR4RXRJWkRtSEcvTFFOdGZpUDErMk1BYVlQ?=
 =?utf-8?B?ckN2aWtNbTRudGFZMDVueFZ3T20yR2lGdGsyUDZ6d3VNb1phVU4vSTRnakNn?=
 =?utf-8?B?T3krMXFaSjZ2UDhVTTF6Y0loQllHMDhiNnM1Q0tsNE14aDZPU296Skw0dGNE?=
 =?utf-8?B?a0RvbG1lWHovNkN2bkhBeTR2ZmQzQW93TjRFQnA3MXZNODBOM1p5bEJyMUYr?=
 =?utf-8?B?d1MvMmJQRmpXWHI4MzhMU1dTUXBFM1pwZU5zMXRiYUF5RnZQZlhDNU84Ukhl?=
 =?utf-8?B?NWlwT0RzMjJzMzJIMXo5NXI3ejdZSGhBaEZTMkNHTEZuQklQaEUwSnhkdHJw?=
 =?utf-8?B?ZThqQTJWTTFibUlZUVJrS1BPcDNCaUxHbk9JckpHcS9WaGg4eU44dz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a7baaab-542b-4d03-a8ed-08de5f68425d
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 18:57:33.0965 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y3R03Gmr1VDbC6CVQIxXBoVRoWziKdX4cbiWNFaWaDuMmkVGaZD4yy9OlzDb+vy2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8260
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[jgg@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim,nvidia.com:mid]
X-Rspamd-Queue-Id: 69E9CB3BF4
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 12:24:25PM -0800, Matthew Brost wrote:
> On Wed, Jan 28, 2026 at 03:35:09PM -0400, Jason Gunthorpe wrote:
> > On Wed, Jan 28, 2026 at 10:42:53AM -0800, Matthew Brost wrote:
> > > Yes, this is exactly what I envision here. First, let me explain the
> > > possible addressing modes on the UAL fabric:
> > > 
> > >  - Physical (akin to IOMMU passthrough)
> > >  - Virtual (akin to IOMMU enabled)
> > > 
> > > Physical mode is straightforward — resolve the PFN to a cross-device
> > > physical address, then install it into the initiator’s page tables along
> > > with a bit indicating routing over the network. In this mode, the vfuncs
> > > here are basically NOPs.
> > 
> > Ugh of course they would invent something so complicated.
> 
> Why wouldn't we... But conceptually really fairly close to IOMMU
> paththrough vs. enabled.

Why do you need address virtualization on the scale up fabric :( I can
see access control but full virtualization sounds like overkill,
especially considering how slow it will necessarily be compared to the
fabric itself.

We are already in a world where even PCI can't manage untranslated
requests and a scale up fabric with 3TB/sec of bandwidth is somehow
going to have address translation too? Doesn't seem reasonable.

> > I'm not convinced this should be hidden inside DRM. The DMA API is the
> 
> 
> Well, what I’m suggesting isn’t in DRM. A UAL API would be its own
> layer, much like the DMA API. Of course we could stick this in the DMA
> API and make it high-speed-fabric-generic, etc., but I do think the
> fabric functions would have their own signatures and semantics (see my
> explanation around device_ual_alloc reclaim rules, what locks it is
> allowed to take, etc.).

DMA API is already bus agnostic, I think there is no issue to plug in
a ualink_device or whatever under there and make it do something
sensible, and it would be *particularly* easy if the address
translation can slot in as an attached iommu.

Jason
