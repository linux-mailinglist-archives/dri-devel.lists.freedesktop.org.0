Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF69AA783C0
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 23:03:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D14D710E67C;
	Tue,  1 Apr 2025 21:03:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gQGqli/d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2087.outbound.protection.outlook.com [40.107.244.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBC2510E673;
 Tue,  1 Apr 2025 21:02:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iUjxeO+Y0SunH7gVAG9UJr1euwNbrizMZSmCfTS7Q1/i3tet08cnPv38UBkLbLO1qaAB+Jim4T1BeFYuTPvNCyqOzvXlSfEE4c/fryTcImhp3Q/tTcYR7IWXWZAoNsfMIzsUO1mp6dcn+ZLuMzFxGGMwj07aMP8zFd34ZlRFAUA6oiT9UyvSUdbIK7k+vOQfCVJK2FkwtHTTdnE0xmgnbyhblaHBgNueA91dKEyO1kpjgegwhn3DyJ3AxHO9MDMDO+AVYnDSRW4YYLg+PV+sxU/m8Nb1PVtQw39bYERlJW3GSVIsORqFMZEl/CnZ+kXVihBvtBCGvT32kT/xZG5qbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g7/nl9wcJckZsrPr5/cUrTXlv8vSYxWGHjKWo2Qdpqo=;
 b=BGLV7Keeq7ZVBtAOwkHhmzd7RJdzDMBXqH7Ie1EyrjgNY112ASWR/HPdSrIT6F3lEzChkeSpkp6cKQQ2zOR52ZJcPBgoMwdBZxSeUi2T1O8TC771uyHDc+DCXPmE40u/T/nmJAiqRXTBc++8t/0B0QEJYJZZCuT0AIH2as6sn+BtNKqDhdtl7xUXISjhT4p9pXa6yig5gOsjGyCN7hdlCzKs7JTdzYCa075JTBT5x1mOdzgvzUdMCcIhDhJpVLPSxbPYvRCWQawxBzvT4XE2JrL4mtlTIlfEvchblivf2v/tRjUypT4s05xKgsQ7XEqaZFXLAnF4wjRIEP4POcBTMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g7/nl9wcJckZsrPr5/cUrTXlv8vSYxWGHjKWo2Qdpqo=;
 b=gQGqli/ddezR8Y8ei5aGCHTZUkJDtxygUCQ+nRbg7h7jZ7TNHgJ1w+CW5r671BjpHOv+PRC7WtJu+rRZTrcL5rYCdOsKEg4G5LU3dFX3sPV4y4HbGuRW87e62ps/GUkMOQMtsuRH/ARdBK67ywR75GTKVuq1AuMb3CTp26HN9G8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by IA1PR12MB8406.namprd12.prod.outlook.com (2603:10b6:208:3da::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.41; Tue, 1 Apr
 2025 21:02:56 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%5]) with mapi id 15.20.8534.043; Tue, 1 Apr 2025
 21:02:56 +0000
Message-ID: <9a6165c8-f87e-4f08-8546-c8e8e5ff96fa@amd.com>
Date: Tue, 1 Apr 2025 17:02:48 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V8 06/43] drm/colorop: Add 1D Curve subtype
To: Simon Ser <contact@emersion.fr>, Daniel Stone <daniel@fooishbar.org>
Cc: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, wayland-devel@lists.freedesktop.org,
 leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, mwen@igalia.com, jadahl@redhat.com,
 sebastian.wick@redhat.com, shashank.sharma@amd.com, agoins@nvidia.com,
 joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 uma.shankar@intel.com, quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, marcan@marcan.st, Liviu.Dudau@arm.com,
 sashamcintosh@google.com, chaitanya.kumar.borah@intel.com,
 louis.chauvet@bootlin.com
References: <20250326234748.2982010-1-alex.hung@amd.com>
 <20250326234748.2982010-7-alex.hung@amd.com>
 <CAPj87rOh=1OuASau+fjL_z+XBs-P=jUiQgjJjWXQZt1FYFC==w@mail.gmail.com>
 <46R4JuwCeyu56R2FsAN-j6n0Pu5VSeLdju8KUycQ3PF5cVQrlUO3C5SX8CgpRJ-QL5_-XS2ds94pPjhzEl6hOo3iyLl0y_d0Syzinn7BxSY=@emersion.fr>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <46R4JuwCeyu56R2FsAN-j6n0Pu5VSeLdju8KUycQ3PF5cVQrlUO3C5SX8CgpRJ-QL5_-XS2ds94pPjhzEl6hOo3iyLl0y_d0Syzinn7BxSY=@emersion.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0014.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00::27) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|IA1PR12MB8406:EE_
X-MS-Office365-Filtering-Correlation-Id: e3ad52cb-227f-4e38-dd5a-08dd716093b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SXEyeE9Nb003S1hjMkZrRlJZWFpWS2JleWY2ZHdNOFFnLzRxSzViOUJMREtG?=
 =?utf-8?B?a1F2aDVwOHFwSmMyUE5USUFUYlRaZlU3bkJvcSt0aFJPU2FXbitUSCtXZGUr?=
 =?utf-8?B?cWRmYXRJUytOcng0RlJTUCt5cjNWTDIwMTRMUnhtTkkwSTMvbDNTVHhZK3hZ?=
 =?utf-8?B?QmE0VE04ZVdJazg3Z21MR1dHd1BDRkE2UTM5RFNLb3h3NklkSGpmQzNZa3Bv?=
 =?utf-8?B?RVgzZGNJRFJwUUc5YnZuOWx1cXorZ3QrNWdvNkFRMXBIQzJiWkNWR2ZrMEhx?=
 =?utf-8?B?WnlkSkZjK3hnVHRYLzVqY2RRUnluLzh5TDY5bW1XbGQycktLYXJ3S0ZEcFgr?=
 =?utf-8?B?dUxqTERrL25CMGR5L2FOWkNuVGwzZTJpaC92VG9mSFNpemZPeXpuTVlxWW1L?=
 =?utf-8?B?NHl3YWhGcTFEMHp5WVYwVDQ2SG9lZG1jVjVjQktWMnFhcGJGWlphTlNYMWI5?=
 =?utf-8?B?TFhScWVFOFlGdk5GbXVON3NMdzZLUml3ZzBWOVk3aXZCMmE3WFNTZm1sb3ZH?=
 =?utf-8?B?UjluZDgzOGpxM0ZaV25GZS9hNmZGSUlGWnZjYUJvZHhZNUdKQXpzYzEyRzNX?=
 =?utf-8?B?S2xRSEIvQS9MUVZMM1BsbVB2Wk80VHd0QXBlZzlQaEdGenRBd2ErbjlHMzRZ?=
 =?utf-8?B?RFRRUlUxd2xucEowRXFNdHJlQVFEK3o0WEMreHAxT2ZVODQrMVcxQWVmVyt2?=
 =?utf-8?B?bmJBZ2NETDZPZVZVZG1lQlpPVFVSa1JDNnZnak1GbjB2YmJ6ZVc3bUloK1dB?=
 =?utf-8?B?VUc5WVI5eWMxNUljQ1puMys2QSs2VE1xMzFTN3hlbFN6ckpQdmRSR1hEOWdV?=
 =?utf-8?B?RjhqNGlhaTNMUnV3TDFzeWczZWg3RW9wa2VJWkV2TFpNRHY4cFcyR1U4TUZP?=
 =?utf-8?B?R0x0aHhKL2p1VkZTUExiWlE5VEFMZ0FvZy81NnpWRnF1bHg3SVVCdmlwdjh0?=
 =?utf-8?B?ZEc4c2U5RmNESUZWdUF0enE1NjNLZkpyb0daeXFub3lKcG1BMWd6WGNUd21Y?=
 =?utf-8?B?MGVHaWs0UkRMTGYrVlZ5M25SdTBuRnEva09sRmxCL3Y3NDgxNUc5TEl5SmZK?=
 =?utf-8?B?S01XclJabUFUekkrMHhQcnpoOHZITEJ3b3Nkd2pWR1BKYTc1K2FrMkhhdEY5?=
 =?utf-8?B?bXZoTk5jYk9haU40TUVXdFVYbXJ4R1hMQnZhVlZjT1NQMWJZbHpIdEFKM3pR?=
 =?utf-8?B?Sml3TXFZaVhpVngycjluTStmNGtYYnJtcURhSlQxejN0VnBmZlVqbE9xeE5l?=
 =?utf-8?B?dUpSS0NCcnJWN24zM0hHcUNoRnJCNWJtRmpRWmZncUdSL1FpVFRUZjhlVkQ2?=
 =?utf-8?B?S091UWZnUGxmUnB2ZUNNejR1M0RqYXViQnVDdnJHa0QwQnhMYWpvaEdMK2RX?=
 =?utf-8?B?dktKWStLUFV6UGNVQXh5UEVUbVFKUGZwMXVjSllwdHJzKzRZejZRRTA4WXF5?=
 =?utf-8?B?MEdxZ2FyQ0FTQWF0ZlNnVGhNcmtkcVJVc3BHQmRBN0tDejVuNXVOS3AyZTZu?=
 =?utf-8?B?djgyVUx1UGt1bVl4eFR3d3ZDYm9QY3BjTnUxOVpKVW9WZ0YwYU82ZmQwalNy?=
 =?utf-8?B?UHJ3ZEh5b0ZJUUpXckxhWTltbndZbjBuT040V0dsOTc5YmVaek44Yzh4N2NQ?=
 =?utf-8?B?NkJYRkIwUkNQcGVXSGFNdFNQSFIrR2lqRHR0SDhQSnBQRllVNHNsa0VSOHVZ?=
 =?utf-8?B?dC9EMjUzVHo1OE05OW1BcmxRNUFPVTlYUjczbTI4ZXVObERZNlhCbldOdDB0?=
 =?utf-8?B?czBJZXRicXNHa2pmdzBSbUZOV0xnY2ZlL2x4TFp4U1FVRitXUExoKzFTYmti?=
 =?utf-8?B?RkhsQ0xtU1Ara2lxN2RKMVFxUFJwNXVNM2xiZGNES3ZwazBlVG02cHBpT1hI?=
 =?utf-8?Q?yNpMv3+JCDpne?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVlPZ3J1ejR0dHFFd3FCc0dOcERCR3BKWmM1aDJLcFpzbCtxbSs2dXFOUjhO?=
 =?utf-8?B?a090VC9FMGlWa0ljNkVJY3FQZGRvdmtyUU1QSkNwWVE4Mmw5N05FY25IbGpC?=
 =?utf-8?B?MGRMczNHS0Z3Z2tPY2YweFJCekFyVEdnbnorK1BROGtxWDJweXBxVXdML2di?=
 =?utf-8?B?dUlWTk9SUGhMbWRCNHN1TzhMbDI0QlVMZ1gwdE1DSVVCcWFMZndudEN6YTlz?=
 =?utf-8?B?UmlKNUVud3JMODRXTW96bWJQU1krTHhyRmVFUWFFV1hlakNvYXBic2FlMysy?=
 =?utf-8?B?ZkMyeVM0TFRnZDIvcTR2OTlPeDlMVmxFZGlhWEJhK2QyV1pmTzhFbzNDbmJp?=
 =?utf-8?B?V2VjY1krcmdWWEhycHEyUmdzU1dNdUFmaGo4ay9nSmtXV2FkeTBFbzdxZWdW?=
 =?utf-8?B?S3VwOXlmSld6R1Y1djR1WHJpWWErVGNON0Z0K2hTU2pycXNIamlMU29iMEJ3?=
 =?utf-8?B?OHhkOWFVRGl1aTA4RE05M29waklqeHUyQWk0cVRSUmF5N0NzSTc1c0dRaTBT?=
 =?utf-8?B?RzhsVThFNExHcElLdXVrc1NKUjFGN3pKTEozVWVxQlpWZEcyOFpJNTY0Y0lF?=
 =?utf-8?B?NDUySWdkbGNMbk96M2xrVi9PK0t3bFpPMzZxNndSNk91TWxLTVRLVURCVFdW?=
 =?utf-8?B?QXpFZExXS1Z1czNiY0dmNGMwVEU5UjNDZ3FYR2RuRlQ0eFJna1ZmYnlYQjh1?=
 =?utf-8?B?UVBzK1orT0RLbXAzemFCZmEwN2tqY0ZGbFllK3Arb1BvTmRSU3VKK2FxdU9M?=
 =?utf-8?B?K1NRQ3FIdklsNXAwM3BtV3RFR2lCTHBnK1JHVWlQWTlSTWR2V0Rld3QySkQ0?=
 =?utf-8?B?WmRHSnJOWjVvb1pxcm9qOHM0Sjd6Tmt2MnVZaERROVRtOWoyOWhlY3pxM296?=
 =?utf-8?B?MDJmS3RaR1NtczZjWCtCRk1FbE0ramw3RkJkWVArWmpEVjZrbTlrdHgyWGh2?=
 =?utf-8?B?bXR0bldiRkVtTGVNcnJuSm9JaG8ySEtwdzlVU0phMmd5OE1KOE5vUlhMRjRs?=
 =?utf-8?B?T2N6ai9KZ1R6RVRydU9YeWpKeDFYRDBVQUU2Q2NUN0Y0UENUL2lkdWZsRkZ5?=
 =?utf-8?B?aS9yVG8yYXUrUnZzVmZhWnJXSVExNDMxdkZacGFEWDRUWlhqYWcyM0d0YjRR?=
 =?utf-8?B?S0h6aXRNMUltcGNjbENYbGhqZjdEblRXZFcwMWhGdFhvcVRrM2lhdm15empp?=
 =?utf-8?B?b2hFejVXb1JKalNzUzRhZjdyOWJzQ3A3WTBGN3ZIdkl3L0hiOUxHbE96bnJS?=
 =?utf-8?B?S3l1Vis5bzZVZk55VGlTcVJoMXQ1SE9BWmZoaFJ2dFpxN1U5TXNDUldCRGxk?=
 =?utf-8?B?eWVPc2JWcTNsWTZ4QVhLTlhSbmdHTmNyUkR2eERBTDFsY0k0U1N4U3d5blRk?=
 =?utf-8?B?NlZzUVVGdzlTdjRGTXpXNTR2S3NUU0JqbGptOW0xVHZBN1grSjBmR2U0Ykkv?=
 =?utf-8?B?U2d5NTdBc2JrNnljNlVRd2VOaFZPdzhsY2ZkRmZwZFo0UmJNWEtYUzdYdTZ6?=
 =?utf-8?B?VkhGajdYeDBwd014TmJYQmdKdFkwMTBMRHlCZjJPOXJ0eDRxdysyZTRWc0Iy?=
 =?utf-8?B?N1I2anE5djNxb2RGZ25iTlkxYkFBT2tXZndPOUdUMXNPdVFuc29rYmlGNXU0?=
 =?utf-8?B?V1MzWXFwdXIwa08wRXJIUWx1SGdITTZUdWt4UHhsSkx1TkRwTjEvNjBadGk5?=
 =?utf-8?B?TzZyc1JaeGY2dnhyOTJCTFdET3AwOHl4ekpOQWdoc21HYURnRkNweVpVWmlW?=
 =?utf-8?B?NGIyV0tFQzBCblhhU2lLUU1NT0pHYkdMOWVOVlZrc1JNZUk4ekVZellEZjlE?=
 =?utf-8?B?cDY4Q0NDRkhTWWRWZU80by8zZDdVaGwyTk9lZlE0TEdsc1Y5cDlhaXRLeDgx?=
 =?utf-8?B?NEJCMm5zdkpmU21pdSs3Q3d5d0RHeDkweW1wcStZUHgzTkpPeWJ0TFpEeFg4?=
 =?utf-8?B?R1NYRDM2d1d3aitadWFDVVdJRmx4Qkx0SU9ZV0NMVEI1dlROMXlIdlBEUUoy?=
 =?utf-8?B?cEMrZTdSNlB5cWdOL1lkTS83NWhvSkZtM0NhY1NxVzdJc1RETVdlYlVzbnBT?=
 =?utf-8?B?RHlZblA4aUl2c29LZERodjEvNmhvaC9BeUN1RjduZUt5SW5ncVFnVDRxaEpi?=
 =?utf-8?Q?eIWp/dtcUbwnGQOpODCaI9ycq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3ad52cb-227f-4e38-dd5a-08dd716093b6
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 21:02:56.7699 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UtBMqR8ZlWSzB4EKXmseJDRISEaq65R0X1zB+tvZW55NMfPX2MYi1DpKS7doKsTi+jSDOOv2IDziN941IJtMXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8406
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



On 2025-04-01 15:53, Simon Ser wrote:
> 
> 
> 
> 
> 
> On Tuesday, April 1st, 2025 at 17:14, Daniel Stone <daniel@fooishbar.org> wrote:
> 
>>
>>
>> Hi Alex,
>>
>> On Wed, 26 Mar 2025 at 23:50, Alex Hung alex.hung@amd.com wrote:
>>
>>> +static int drm_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
>>> + struct drm_plane *plane, enum drm_colorop_type type)
>>> +{
>>> + struct drm_mode_config *config = &dev->mode_config;
>>> + struct drm_property *prop;
>>> + int ret = 0;
>>> +
>>> + ret = drm_mode_object_add(dev, &colorop->base, DRM_MODE_OBJECT_COLOROP);
>>> + if (ret)
>>> + return ret;
>>> +
>>> + colorop->base.properties = &colorop->properties;
>>> + colorop->dev = dev;
>>> + colorop->type = type;
>>> + colorop->plane = plane;
>>
>> 'plane' seems really incongruous here. The colorop can be created for
>> any number of planes, but we're setting it to always be bound to a
>> single plane at init, and that can only be changed later.
> 
> I don't think the current design allows a single colorop to be re-used
> between planes? I think as-is, drivers create one set of colorops per
> plane and never share them between different planes?
> 

Yeah, with the current design a colorop always belongs to a plane.

In the future when we introduce crtc colorops they could be
associated with a single crtc instead.

>> 1. Is it guaranteed that, if any plane on a device supports the
>> COLOR_PIPELINE property, all planes will support COLOR_PIPELINE?
>> (Given the amdgpu cursor-plane discussion, it looks like no, which is
>> unfortunate but oh well.)
> 
> I don't think so. (They could all expose a COLOR_PIPELINE with the only
> choice as the zero bypass pipeline, but that sounds silly.)
> 

Correct.

>> 2. Is it guaranteed that, if a COLOR_PIPELINE property exists on a
>> plane, that BYPASS will be one of the supported values? (The current
>> implementation does this, which seems sensible, but if the plan is to
>> not make this a uAPI invariant, e.g. to support planes with mandatory
>> CM steps, this should probably be explicitly documented.)
> 
> Yes. This is a hard requirement, mentioned in the design doc IIRC.
> 

If this wasn't the case then those pipes would be doing undefined
things with current implementations.

>> 3. Can a given color pipeline potentially be used on different planes,
>> i.e. a colorop used to represent a separate hardware processing block
>> which may be used on any plane but only one plane at a time? (This
>> should be documented either way, and if they are unique per plane, igt
>> should enforce this.)
> 
> Right now, I don't think so. Could be a future extension I suppose, but
> I think we need to properly sit down and think about all of the possible
> consequences. Maybe using the same pipeline ID isn't the best uAPI here.
> 

I think it'd be easier to tie a colorop to a single pipeline, which is
tied to a single plane. I'd imagine HW is rarely designed to allow
arbitrary routing of individual HW blocks. Muxes are costly.

>> 3. Can a given color pipeline be active on multiple planes at a time?
>> (If so, the implementation definitely needs rethinking: the colorop
>> would need to have a list of planes.)
> 
> I don't think so.
> 

It's tied specifically to a single plane.

Harry

>> 4. Can a given color pipeline be active on multiple planes on multiple
>> CRTCs at a time?
> 
> Ditto.
> 
>> 5. For a given colorop property, is it an invariant that the colorop
>> will only appear in one color pipeline at a time? (I believe so, but
>> this probably needs documenting and/or igt.)
> 
> I don't really understand why that would matter to user-space.
> 
>> Either way, I suspect that clorop->plane is the wrong thing to do, and
>> that it maybe wants to be a list of planes in the drm_colorop_state?
> 
> I don't think so, for a given plane, there can only be a single pipeline
> active at a time.

