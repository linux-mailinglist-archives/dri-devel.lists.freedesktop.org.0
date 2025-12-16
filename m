Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D812BCC0E44
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 05:27:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26FB810E699;
	Tue, 16 Dec 2025 04:27:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="apaHIvkU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010054.outbound.protection.outlook.com [52.101.46.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B282810E697;
 Tue, 16 Dec 2025 04:27:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CTGYYFs64Hj+CSOdkjPTSBtcGRGfOK4UcgK8bro0cTDb3QTGIqBR0wlfDxPIm+4YwMyJ9mgWWjOThB9+OE+yU7oQexxy1DvVtfe0bo8vrLRmzEPfjn0IVrDmaa0PtnSphT1bWwQXdeLjwbfTap/RvPq2xqoJ/hfSQRpIGVOXMjsNOm1HaCbEEkV0hZJVt1FSMPx79nMz1+dphzN7NIU3sNtaEu37hXL99nPMwe8Mr93yz3WEjMbnSW06NU8ibdH54b1siGcZlygi04yj+LCkgHhhsUtC1YOJBv0OKPNJ1H00tVBVGnGBBoDrOC1k9/154YQqImSREl+QMvKSPFjTvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hEG9Z2KFVCudmGeiwE8Z+yULenmuh88vme7oWWDmawI=;
 b=qtVv83Sv4pR7Whf3LlniTvffKZwwdqfLKkYAv1bZqH/DVzmiLjM3Av7IwCzoXN4RHGf1no5/EnWdDBXJCLUHKRdSkCQSHFfX6GqRhgzyQdx+eDkKd81K0GfXpEwsybjGyK/pbSw3lpYeUklv7EnrXXcCSW0kxdQbVt3NVetrihRN+yWjLmuCASJndzcLZ1taGLTwk6ZdjAuTa/5EiDpbJ+uCVXBp/znDJYm3oyUc8KyV9zaKeOAUhpDCOP2En+yxMOUFk2Fp0Qf/QwP/GaUneuAAGfFKNKGmln7LUJAMbmeKuE/cWz9BicxtMF02M9IvqGM5qxvyWZHIJALu7mfvnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hEG9Z2KFVCudmGeiwE8Z+yULenmuh88vme7oWWDmawI=;
 b=apaHIvkUGkPDvFGNuQzsDFq9V46Wr7lTqQXxhx4kmL+tlweDxWI6zc6wqHTDm0KWJO1Wn2Jcs27T7UWZt5V3j5U81iQUZl+ATpintbqHXMXEfpVOfzc2vsZi3CyPAxIO+S7j0KQAHShzrtuoIY3u8LZVawSBTkuof2dWwDPKjZv7nqvgesS/4k7LBJO8pKjiC3Q6wZvxqm1eCc9ClEfQo2sSR96TM8iFMshqaQSSKpodipPHHTRCNz+Fm1BYMQ0qHAET7dyzF0McgliwS2vXJ9mvO1NiS1Z5g87h0UCZ09E9GCUQUfrMEsXAQDfnMzZXXKp1PjgnbEawpuz8i6W2qg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB8754.namprd12.prod.outlook.com (2603:10b6:610:170::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 04:27:51 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 04:27:51 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 16 Dec 2025 13:27:27 +0900
Subject: [PATCH v2 07/10] gpu: nova-core: firmware: fwsec: do not require
 bound device when unneeded
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-nova-misc-v2-7-dc7b42586c04@nvidia.com>
References: <20251216-nova-misc-v2-0-dc7b42586c04@nvidia.com>
In-Reply-To: <20251216-nova-misc-v2-0-dc7b42586c04@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>, Lyude Paul <lyude@redhat.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4P286CA0111.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:380::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB8754:EE_
X-MS-Office365-Filtering-Correlation-Id: dd76eaf0-dbe3-492e-765f-08de3c5b795f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|10070799003|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RjRSd1J1Q2pLUzNVeFQ2akxxa3AvOGFNZ0ozbSt2WW8vL3dXcEk1cVI1cldx?=
 =?utf-8?B?N04xZGF6TW5rTGxIMjkzcFV5QXZqS2orYXI2T1FqYit6czlKeDAyVXltNWt1?=
 =?utf-8?B?NDNDYXlzUEx4K0NDbzNsK3A0c09TR0ZvY00waHJIam9NVVBEWDE4RTlJWk1k?=
 =?utf-8?B?dVBwSkZJU2h5WVd6T3VwUXRHUXVGLzJMOGM3eXljRk9CaXBvMzBqaktCM2Z0?=
 =?utf-8?B?N3ZkSGRtWGo2MWN4YXk1T29kWWlnaEFoYXRrYTBPZ3Q3ZE8wdVhBOU94b0tG?=
 =?utf-8?B?WGI0N29CU1BkU1cvZUY0RkpCT0JyUHB1dUZvajNGcDhiZFNORFQ3NXdoZkgz?=
 =?utf-8?B?NVhxeXRQRmxIelRNSnRWbjlQMlZQc1RmQncrSGd6ZFA2dHFyeWhaRkw2c21Z?=
 =?utf-8?B?RWNrSDZ0N2VDSVp2SVN2aC9kQko4bUkxRG94bGxaRkNmYjByVXhST2N4OHo2?=
 =?utf-8?B?UmNKYXR3c3VjUVRhMzNFb0dPYWlNTWJNRzJoZ3k5cVB3clgrUTQ1NFBld3JF?=
 =?utf-8?B?TTM1d291cnBDL0ZtdnNCNnNDZnd5cUhBSXRQNm52ZWx2eUJPN0pTeCt3K3hG?=
 =?utf-8?B?T2h3S0NrT3F2Z2dzdkNUMFJnK0JZNWdIMjJvaHc3LzFoYXJXcDBJbVZySi9m?=
 =?utf-8?B?bkpxcFhpUitpUWV3aFpuQzNFK2o2U3NpbWEyUnNONGJ5MElEc05JZ1FPa3VE?=
 =?utf-8?B?MW0xMERmYkVwb2RvR052cmhpNEZCRXRPS1hDajQ2TTAxVnBPTjRiRmZCUk5R?=
 =?utf-8?B?Z2JKL2RJbXlSWDFSdWEyWFJ3ODB4dVJWK0lWSU9Id0lUOVppUlNZOERpYmNX?=
 =?utf-8?B?emYxVHJBL3krTDFSOWFtbkM2SVFEdGVVdGFrQnZXc2dzQjZXdG92Q1JtVmpH?=
 =?utf-8?B?TGRVYW1sTGs3Q2tSQ01FYkc0QnZ1NWZWNFYzb1FvV0FsVHJrZWJoR1VkaDJL?=
 =?utf-8?B?UkdGMkFtZS9sbHhvT3lxekdobVVid1dkS2FEWU9PN3ZZWk15aDFHMnVobU1v?=
 =?utf-8?B?bDA0d1ByVXdPYXRBUFZNK3BiVFB6TzI3TG5ldTdRUlNnTzQrdXM0RnEyN0Vu?=
 =?utf-8?B?cjl0N0JjYzVjTVlqYzRNMXVLbFNhZ1NkSG9HQ2N5bG9iV3I2R3NoTXRaYk1D?=
 =?utf-8?B?ZkRZdCtyMWNNZ2RjTDhEVE5WS0hwSmxWYXUxLzdES05BNmRFUFJXUkRnZzB5?=
 =?utf-8?B?b0xLQUhvMWFHN24zWVZRdUkrUkI3S3FtZXVJL0ZmNlBEUkQrT0JycytGbjdv?=
 =?utf-8?B?MG5mQS9Rck5Nd0JlVFRWckZocnAxSDBtR1VRMk9Fc0l4RVZ6ZGxMemkvRDc3?=
 =?utf-8?B?Z01QVENPT2ZuLzZoc3UyM1F6U24vZUg3MHBDNnM2OGtFMWpJc2IwS2ZhQVRG?=
 =?utf-8?B?SVhzTmladFkrdjBWdS8weXljWWJ5QjU2TFVnNmM0Y1VVc0xrZ2paUlVtcUw1?=
 =?utf-8?B?dml2TUtIbmIrZnNFVGpCMS95K3FQQzlFK1krNGErSGI5djhUeXlFWTdtUnRO?=
 =?utf-8?B?R0VudUowZ3BPVFRzMExBQnFTbzE1OFp1NG5QeUozdTlKSWMwQU0wSXJrbzI3?=
 =?utf-8?B?eHo0cGNYa0t0L0NOcnp3SDVQeFpRQ3grVmh2SGlhMkdyR3Y5Z0hBSWI5cDd4?=
 =?utf-8?B?L2JuWFEybEJDWGkzb2dhTnNlN2RCVlNNb2RodWN4bGFHZE9DN0VEeHRPUzVM?=
 =?utf-8?B?RWJ3NWNDaElKbVVwOHhTcERnZjhCcFVqNWRuTXF3czVrZ3hXNkhVZDJ4MFBG?=
 =?utf-8?B?UC8xME5oYUlJWlF5YWE0RDNvSHZoK2NHeENTeWtJTW5qWCtOWkFPMXpLVm5E?=
 =?utf-8?B?L29ycFBmbnlmMzY4dml4V21wK0RvOEdlOGQ2Kzc1UC9Cc09Wa0F3K0d4NVNt?=
 =?utf-8?B?TkZMYnY3N0NZSlE3OUJIU3lWWTlNWkpSWkNaVmVwV2FtMGp1TTVvUExVVllz?=
 =?utf-8?Q?bCEiFSUshbvrTrcgOypNXqcaxAA7MqG+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkVPZzlPNFdFdTB5NWUvSWExYTZvZy9BNHRkTy94NVZWQ0FhMXBNL2cva1dh?=
 =?utf-8?B?akZ5aTJTQS9oRDh5WVNwS0ZITTdFRXZDSnVCQkpvcm9GdFJaTVVMMHFJbFRz?=
 =?utf-8?B?WjJYL1JzWHlYSkJvamtJUThtWi9PQzlMekYwZGN6VzRsVnYrQjdjZW1vc3hV?=
 =?utf-8?B?UC9XZGRrNTNFTzN2MWQ4SS9ZdTFwZHpIeGxlVnFnVUVXTFpnQnBET1NLc3h1?=
 =?utf-8?B?RmFuZHYwRGlVVkFEdExSWkNnVUZtY09ZZmNoRHYxSU1CbW9ndFpXVlFiQk5k?=
 =?utf-8?B?NFdIV1pUN1o1UTIyZ2Uzbk10NXR5Vjhmd2ZhMzg3blJ6Y2NldmN3V1RXb0xj?=
 =?utf-8?B?U0hLT082VnJGLzdaODZGTkFiNmNISkhDT21LT29ob1RFUGxRNWZWYjFkRVlN?=
 =?utf-8?B?bEF3ZUZnRmk3NHdIY1I4a0dVU3dQbC9FZE9XNFFvaXJlRWI4RWs1dVFtdWsw?=
 =?utf-8?B?SGVLc1NyWjJCOU1kT1lpODdGZEJqWC9JWU4zdWVtYk1pOGxCcHlGK2RrVGpE?=
 =?utf-8?B?VkhkcWNtSktIVnI4MHpNenprWFV4d0diSGlONE96S1FSWHhxVmJSYWI2OHBB?=
 =?utf-8?B?OXRBSFNQbG9LK1RYSG8rYUtZVGJkcFpyQm9mUkQxYmlEN1k0UHAwQmNmL3dn?=
 =?utf-8?B?TDUva2pESjNZWVM5U21vRGZZZWRCYU9iVDJsWGlSYklpNElYWmhvKytISU1W?=
 =?utf-8?B?RjdMTTdtV0FBU3NYOGFsOHoxaVpYcW52aTE1NGdnc3BBeU9WbDJyb0lQcWlL?=
 =?utf-8?B?cjJ3SGN2VXE3U1NjUjVMZnQvdGtRQmV6anJ1TUV0TGxrZHRIb2UrY1dFL1Ju?=
 =?utf-8?B?dGR0L1JDYzByU0FKN2VxTGhqdEx4TE5xb29aSXhTWnhXaXBkcGcreVhyUGZm?=
 =?utf-8?B?d1R6SVB6M0kvNEZkYzhnRElOWHo2cmliWkQ1MEdObG5XQXpQMDErQ1lXMG5B?=
 =?utf-8?B?OFQ1MWg4T3E1cGdGb3dnZVIxZkhhZHJiM0tSbHFEWTVjRUpQdExodVlRSlZr?=
 =?utf-8?B?b2wvMzRYU0w2VnJweHpHbGNMQitXUE5QajN5ZksyVzUweVJHcEoxUXZCaVJH?=
 =?utf-8?B?a3JaS0k2TVcxUGhsVnF1VVVwd2ptTFhBd010UVRWQkYyZ1duY3RjOTF6bWh6?=
 =?utf-8?B?SWFRZFpOTXdFeXFoaU1ET0hIeUgvY1N3Uld0TmJ5WE45SEhzYVRNeWJRM2ZB?=
 =?utf-8?B?Qm5zYlNaRW5LMTFxNFdUZHhENkFEV014T1RMNlVTK1E1eW9XUFgzMm5yRUtT?=
 =?utf-8?B?VldvVUVjeHJ3WWlTOGdpYjZkZmFGQmcycEp0elRxNzFHdDU3VTBNQ3FzS2FO?=
 =?utf-8?B?QzRLWFdmTXhXUHlLNDVySFVLVGJRdHZGRzhIdWZCYU5jRklQMVJjbThqUkl2?=
 =?utf-8?B?MzF4TUhGNHNjVmRWYVZCazQyc0lHUmJmdUJXSzZvMEFOZWNpUlExTEZsM094?=
 =?utf-8?B?Y3dMUjYzUnpQTTE5RmFWaUxTNDY2Q2IrbHp6S0Z4bGVYZEgvbXluRTZramhF?=
 =?utf-8?B?WU1oMklYOFpDMEFRN0xUeXJqMkxuZzQ3eXN2Q0VEMU1KMVA5TnVIZWgrM2Rv?=
 =?utf-8?B?dFEwQ0xsUi9WbUdhRWZnaTk2WUU3WjZXRFMrVUlmbjJSeExsRmtzYksvaGFu?=
 =?utf-8?B?TW5UZEpMTDdXTkprRWg3ZW53U1Z4eHlaaksxSGdaN3FJOW41TjFLZUdSeFVa?=
 =?utf-8?B?dzdsZFVGZXIvWkp6K2F0L0FqSHNhd3JSWk13VkEzR2Raem9kMlhvZ2FrMGdj?=
 =?utf-8?B?WnZBdnhXTEk2K0tGSHl1SlVNQnNLamxWK0ZMNGJoTkRINm9Bd1VLbEJNaUNJ?=
 =?utf-8?B?UWcwb3gwcVJWcCtNYkJ2amplTnQyWEk3WnVLSWc1cjJVRTBNWVZXeEVRMDRz?=
 =?utf-8?B?ZUJPZ2NIK1p2V20wYkRSWGJtdDB5SXF5VjlxcVdvMjdzTStwNzkrZStzSmpK?=
 =?utf-8?B?T0t0dktwU1ZzajQvYlprSXVjMk5QTHl1THpZWCtta3RJTW1SMHA1YUk4UVNV?=
 =?utf-8?B?S2hXRnFXbW1ZYkRtV1ZkUG14VWZ0TlEyRDlZWUhrd20zajVJM3lhV3Evc21R?=
 =?utf-8?B?LytiVWhUSzRuZ2d1VjgrcWxSWDBPQjN3eUJEeWlXYzdXQVZyRC9CR010blJp?=
 =?utf-8?B?cGJPa1VBTHJlQ1lIQ1ltM1BTQjhNQk1CL25hdzhDaEhUVDRoa0pWTEFZcy8v?=
 =?utf-8?Q?Rhuy0NHEX9H+7LJKBPFZW7+NybcBnU3KVYHxdSK5lIQ/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd76eaf0-dbe3-492e-765f-08de3c5b795f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 04:27:51.0610 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wr758vOu9byajSnzObIDvtE1/bFfeNUpYZSkTOGv9a16lMZl6v6pLpo0xzXTpLFv1a8yLf+tZgfFUtZkgM8nmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8754
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

`run` doesn't require a bound device as its argument.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/firmware/fwsec.rs | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
index b28e34d279f4..b98b1286dc94 100644
--- a/drivers/gpu/nova-core/firmware/fwsec.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -412,12 +412,7 @@ pub(crate) fn new(
     }
 
     /// Loads the FWSEC firmware into `falcon` and execute it.
-    pub(crate) fn run(
-        &self,
-        dev: &Device<device::Bound>,
-        falcon: &Falcon<Gsp>,
-        bar: &Bar0,
-    ) -> Result<()> {
+    pub(crate) fn run(&self, dev: &Device, falcon: &Falcon<Gsp>, bar: &Bar0) -> Result<()> {
         // Reset falcon, load the firmware, and run it.
         falcon
             .reset(bar)

-- 
2.52.0

