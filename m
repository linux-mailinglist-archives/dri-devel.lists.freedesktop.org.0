Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9A7A5D438
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 02:52:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 507E310E6A5;
	Wed, 12 Mar 2025 01:52:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="ce5gsVex";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sg2apc01on2083.outbound.protection.outlook.com [40.107.215.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9C3A10E6A5
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 01:52:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YuRhPXUa4Wn2fav8DWH08/lBBZen5xcSwk2m8yt0W+YEbwQjstrOiv69xU6PfKTnpdcqdnztKEauHcspAYBb8JAlzzW4DzhwLqyTQSxC6NEVjTikGR6e+phIrlZ3ws1YFOlFT6fCeu7D/5fo/t9jV1T4IQ+DKbguRtggznmqysYBF1/q3ZzoFt5qgc+bIwIiUAQ7R1v4rctbkzbBCCuSh9rAISXB9ioasAI7JDlMqggBlXeEGD2Jt2u/DBHAxKmRKotG8JEFSLYx719rHxkYM7cIkElM9cB0nQ4blfLiZ/ZSqGwYiyVGtYFTxDe6qjCv4CQCv4sIGtRJvYIA2URDQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NdJ0asZKRnBxtaToArlkwyW/WX5hnskt1CQY/mitPB4=;
 b=lJSZmd/VYGfZdYALRSohJvt0UjWaI0UojNpPv00fVgPwtlvTipcfAC4gHItVSAtoX31j9qZwrVmOudvytCRR8inGMF8JJls1Xa6kJwD2STZ7eKMqRAJWEqjuX+y8HEcUvc6x0FQ/h9u8hcG1AcCSh6eUBETcmmBYLLSQrL95ES3wIUdE08ZmiUwKtBNyOCxjQK5zVVaeo1zG7EAMmjTQ0UqFkekpVSdArd+3rsXw+PGNZmW/TfaYQzwBOHqhs4U7DXF/0PzFe0t5A3d/EEz55NNQlchaUc8Dq2IRQn9NCnBtj5mIGXiFyc8eJ4xFi0J0mkrHoVqq9SuznJG2gPIrMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NdJ0asZKRnBxtaToArlkwyW/WX5hnskt1CQY/mitPB4=;
 b=ce5gsVexqP6QkbSpD1VEFVZvdSlUx7+zn6l5lgrtOIcHdMEb18vp0VYr4JEc/iSzlDZdskhoijvbKFJ/tSDYx/5SDU7MoZR2Jv9Pb0RcHBOgNOZ2iWh2/Jptdb08KR+efQanPJR6KPYGp8J8fnscjLFcsIRFVznqcN582bNuZcAB8nc9IWZDuPdsBNoYr8PePzNcVQCKAAHfHKolHu1z6lRV75xE+m56E4BX5/C18M4mWG4ndOSqCuekFGUAP/715cAmO+tQg0HQ0V6N89nXqdPMWxvhkFqlQPGyV6Ls5gQpchyojeG0ceH7tiGKBxcFMn977hN6Ta9hidw2hegYtg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by TY0PR06MB5627.apcprd06.prod.outlook.com (2603:1096:400:31e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 01:52:15 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%3]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 01:52:14 +0000
Content-Type: multipart/alternative;
 boundary="------------oRjMd29PYHJ3z4Vphmb2Onyi"
Message-ID: <eb7e0137-3508-4287-98c4-816c5fd98e10@vivo.com>
Date: Wed, 12 Mar 2025 09:52:09 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: udmabuf vmap failed (Revert "udmabuf: fix vmap_udmabuf error page
 set" can help)
To: Ryan Roberts <ryan.roberts@arm.com>,
 Bingbu Cao <bingbu.cao@linux.intel.com>, vivek.kasireddy@intel.com,
 hch@lst.de
Cc: linux-kernel@vger.kernel.org, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org
References: <9172a601-c360-0d5b-ba1b-33deba430455@linux.intel.com>
 <d7a54599-350e-4e58-81b6-119ffa2ab03e@vivo.com>
 <ab468ce7-c8ac-48eb-a6c0-386ea7aa9a0c@linux.intel.com>
 <78cd737d-5e85-4d3c-8bb5-0b925d81719b@vivo.com>
 <29445257-b8df-72bd-0650-44c8deb1506c@linux.intel.com>
 <5da7bd8a-c6db-4995-b947-444e2c78aa7c@vivo.com>
 <32814695-359e-4c4b-90a4-c7c34421a1d5@arm.com>
From: Huan Yang <link@vivo.com>
In-Reply-To: <32814695-359e-4c4b-90a4-c7c34421a1d5@arm.com>
X-ClientProxiedBy: SI2PR02CA0027.apcprd02.prod.outlook.com
 (2603:1096:4:195::14) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|TY0PR06MB5627:EE_
X-MS-Office365-Filtering-Correlation-Id: ecbca831-6a52-4ce7-5358-08dd61088302
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|52116014|38350700014|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cC82d08xVHpSV2wvdmNpc0s5aWdVRUJFZmNVbXFqdkdhMmhqUGNBS2VqdS9R?=
 =?utf-8?B?bmZDblFQc2xNYkFpNjg4bmhRN1ZrOVpZa2l1b0I3ejZzdGZHRE9PZHRmdDIw?=
 =?utf-8?B?Tlo0eGdtTXVuWTY4czBRK1N2QWZjRDVyZXBodTNyVlJzbXhjcDFiVGpwVlVq?=
 =?utf-8?B?MGNOdGtZVGNOR1pyYmdKVDljc0lrNURCMzhKTGJNcDJsem13dkNLMDZIMXN2?=
 =?utf-8?B?UzFJWnozL3BHa1Fya1pEN3Z3djV5TThGeXlLS1cvUXc1T283dVdrRjZGSWs5?=
 =?utf-8?B?UWhpbTg0Ny82TldNQ3FPK2VGU3UxdjVtN3FBK0xsYzJrWExMWkFGdXNWQVBj?=
 =?utf-8?B?TXZxNWx3QkJFUkVNTGd1MHU1VDQvN1Q3VnJ0K3VpbURIb2lNMTJMbXcxTGhN?=
 =?utf-8?B?STB3R0F4RWVGNW5YcENJTTNLT0l2c3lxaVZKbzZUNE45bVFITzlUZStJaVBL?=
 =?utf-8?B?bTRpNFI2bWtYc0lRMGJVN084OUpNcEkxbStISnNSRW5VMFdQOUNRcFY1K2cx?=
 =?utf-8?B?YjlwSFIxTnhYL0srdGFKNTgyVldSeXhET2pRNEsvTGc1SzEvSkcxNHhwWFZu?=
 =?utf-8?B?SWszQW16VnhBL24xR3UwUjZ4bzg4TGZqREVGM1JrY29zRTRYd0FXZDQyN0hU?=
 =?utf-8?B?bk9uZGFqUGJ2a1dUY2ljcmpnU0dPQzJOYmkxUmFUMU1SZHhlR004bWpRMXZL?=
 =?utf-8?B?eDVKUFdBV0NXQ1NNMEdKN2lJU24vTU1xQTVDcFYvYXNGK0sxWTVhcnllUFF6?=
 =?utf-8?B?OTZhdzJ5ME10MXFENVVSTml1dURjZzNENCtRWTM5OEdoa2FaZjI1TnhXSklQ?=
 =?utf-8?B?cVB6ejJ4WmNlM21Hek9YN3RhRjdiNkV2Q2twQTR4aUtLTGZBa0pOVmUrR2FT?=
 =?utf-8?B?a3dvMitTZUFBU0JCSmthRHQrWm9BbnhLMkkyaE9wNjhBRzhjeWtVRlBoM2Vo?=
 =?utf-8?B?c1BRSUpXZ2tBMzlmTWxpWXdsWVdsOTE2R2xKTHNGU2ZIOU10UkVZaEQ1MkFZ?=
 =?utf-8?B?bWEzT3o1VGJNM2hETkd0R3pwY0s3azVKbHByYjZoUEhEZUdndEkvWEJYdjlo?=
 =?utf-8?B?N0JML2kyL2xNKzk5WTdKdTNsUlZWVVJyM2dPT2RML3lVcmRIZVlVR0dYeEVn?=
 =?utf-8?B?dFdvYVd0Qm8xOVgxZXlsbjE2WktoWGw3dm43d3JQd0JtZmV5a0pabnBCZGti?=
 =?utf-8?B?YTZOei9saDF1dTVEU3o1K0RnTVBWY1pXS0ZUWEVMRG1pSXc3bDYyL2lGSjND?=
 =?utf-8?B?MnFpTytXbDB6VzJLMFViRStkdkVNa0JVVTBScFFBVW9qb3ZveUIramJVL2g4?=
 =?utf-8?B?dVE1UEpIZ1JhNDdZL0NuWS9ib3RUUWZzT3h5b1BWUmFmNHZ0MjRWa0o1eVhm?=
 =?utf-8?B?NXJJNnJObFJ0UDg2b2RTRnZQckFpcnBJUFVmeXNsdWdsTXp6VzlaOGt0MlhH?=
 =?utf-8?B?RThIVVRpSEdZWmNoY3A1R21hNzlySEhkczEzYS9tbFRoNUUyOTRySXNyeTAw?=
 =?utf-8?B?NzF5UHVaSG5EUmp4cGtOdG1sekkzNUZBYVRlNTJrNk94c2EzNGlsVk5oc1RR?=
 =?utf-8?B?MlFJcFJWTVF0amhRZi91VmZ6NFNTNVJxU21zRTlyaDd6WGZKZjhtd3NlRE11?=
 =?utf-8?B?YlRBdXliOU5udnpuZTVVemkxTTI1ZXZuREoreHU4RjVqY2k0dHdvL1Z5bFNF?=
 =?utf-8?B?QjJaWGN2RzhUekhpQWhPR0Zmb2pvbzRodnQxdUVrbGlTaFFvNW9waFpNQ1o1?=
 =?utf-8?B?a3hQa0FUQmtSbVRNcWVyRVYxOUp2L0JmYWN1QnBvaFdKejF3eEhwL1VCTWtR?=
 =?utf-8?B?c1RmSFNpekNZelZmVGJlVU1pd1p0NG5GM3ZMcUpZM1dCV2ozQ0hLQzkzQWZX?=
 =?utf-8?B?U1cyMzZyaGI3cGpnV3pjQjlhQ25xaFZOdDkzUmtmTFlVYUZ5UEFab1FSRm1U?=
 =?utf-8?Q?qSEasNllzUIgDjXV63RvXbawEHcT5IW1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014)(8096899003)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1BRMTFpbW93UEVZc2hKY1V0eGFyakpDNFVuK0dVTjFMemhXenRrV1RzblhV?=
 =?utf-8?B?U1FVYzFzZ2FQcFh0VlFlVXJEL2ZmQXhBUDM3OU5malJqaGFWUHVLSmczUHNM?=
 =?utf-8?B?R3kyNUhqMm1vTFNZUUFnRGtRK0RvT1lkR08ycmJOMXBNbnA2VzR2NzNuU0kr?=
 =?utf-8?B?Z05DTk5aNjVqZ0VPYVhuUnk3WlA0VDBjMk5iVEpyS2JRczZ1cTc2SkhkMmhv?=
 =?utf-8?B?dGpQa2FudXhVM0hXT3N6SXhTeTZ1QnRSZDE1aUJVRzY2a0dPZ0U4YlBYaG05?=
 =?utf-8?B?NXlHR2NyU2pMbXd5S3l6aFZIQmk1S1JwWmt6NWFQWmpRVXArV2h3SmlvS05q?=
 =?utf-8?B?M25Gc0hGM20wajZJT2w5bEYxZjlCaGVkeTRBRmZyUC9aZ3VvK1o2Y20vVVVT?=
 =?utf-8?B?N2YrR0pmMEp2UW94NVd5MWprRG9lTloySm1sUSt6NGRoUWFNREVpbFdza1Rj?=
 =?utf-8?B?aUdZVVQxQkdnRzRhbXduWEh5M3pJZGs2OUdVUFBLdUtVMFZIMXV5QklKV2xC?=
 =?utf-8?B?bS9uQmM0TWpGUkxNNEEveXRCQVpPdnN6YXhQWVBIR2hlRThrMGI2SzVXNCtZ?=
 =?utf-8?B?Q1cySzJHV1hmdFJ2MngrNjJhL0xrTWQwVmhKeUowVk95d3FWVUdwUllLN3BY?=
 =?utf-8?B?L0JCa2hHaTMvQlc5R3dLMWRGL05NOXJBekJ3TDZyU2RubFhWR2xMYmdmZFFD?=
 =?utf-8?B?ZzFUaXNQb2t1Wnd1OWwwemZ6aTMyMEw4RWxmSDJDN3FiTUxtNzhLRmExN2RU?=
 =?utf-8?B?bkZiKzBmeTVnREVIclNxTEtoU1pSa1lsZ1QreVFGbWN2MTZJbE5hbmw2VTVs?=
 =?utf-8?B?TmticWN2Z2FjOVY5cFBGdmdJOEw5Vlk1dFlNaDFwMG5KL0pnRS9seDdIL2hu?=
 =?utf-8?B?RkVSOW5ROFdHWXR0MjVSQTVpV05yalIwVUNjNDAwdk9aSHFhUXVtV2pFWUhv?=
 =?utf-8?B?Szk1a2IwM3c1eUx3UDhQVHcycnBMZkQwKzRZVzBtdTk1WkF1K3lqcnNjOW9U?=
 =?utf-8?B?Z3ZCLzFvcEwvcGgrNnhGblNJY2haQzhCUVltNTIyUzVZS2g4OGhUQ0xRMHFC?=
 =?utf-8?B?ZkJOVTF6RVFQZ09TMWdka3FxM1FmckdjYXVyc0JoZ1UwR1Jicys5OUdRdVVa?=
 =?utf-8?B?RW41V2FpRFZuUFY2enpzOVh4eWJxbW1ta0dla3oyRUJyTWpzcnhzU1AxeE9K?=
 =?utf-8?B?Ri9yV3lGKzdya0hyTVRDSmZPaGc5aG14V3RHZ3U3bnd3L0FZSVdqd095OVRI?=
 =?utf-8?B?YVlIMXFIUXI1S0JOQ25IblR2SERBWVZGYmJ2VHN2MG5adGp0NEhxN0VjK3lV?=
 =?utf-8?B?UEp2aWNjNjdBL2hDekRHOGJDdkNHKys3dE9XNTBlOVJzeis1OVE5UDBQZ2cy?=
 =?utf-8?B?QmxxRGdHT3BWMW9XOWt2bzhjZXFldG80YVA1ZlZmeE1XNUJtVVpUYlVqaHR1?=
 =?utf-8?B?Q3QrczRmNHFFK29jdFBCVktSQWpxcThZRys1V055TnpGZjBUbFBhNVZoTEYx?=
 =?utf-8?B?VTN3TUFZcW9LQkZlN0huU0MwbHdQREIxUmFpcFNSQnlkVWhhK1dFRVhaQXVv?=
 =?utf-8?B?emNRUGJ1NnVhSGVFeHp4S1Y2cjN6dXgzMHVYd1pWNFlZOXprbXF3a1lJa1Zt?=
 =?utf-8?B?KzNoaVJTM0ZPRkszYmlsYUNOMklGTVZ0bmNaZUV6U09qdUx1VHZIeG9YWGFK?=
 =?utf-8?B?aElvSEJlZjhJVWplOEEzTW9SWTRzcFVKcUQyNzdCNEQvK3hJUjZ2L2UveVlz?=
 =?utf-8?B?U0RtMDRrRXQ0MStNSllwMGRqZXpCbW5RWGV5bXhqcUhZTHF4TW9nOVdKRENU?=
 =?utf-8?B?VDdJbEVkYlRmVUdHQjdzaG4xUXQ1SElTVEVzTmczeHpZamk1YVRMcFZTaXgw?=
 =?utf-8?B?TEEvRXJQK3pXbnY5dXVrc0FybHE1cnczMGtCN285RVA5YzM2c1Y1Uk0zRllv?=
 =?utf-8?B?SndyOUh1VkQyUkVaeHhjOGRoRmdGRmNtYTRBTEIwL2VySW55aUlnUm8zdW1m?=
 =?utf-8?B?QjMyamdRcjZFaTl5V0hSMVp5NFhES250eFJRTVBaOUZqM21jWjJqclI1bGYx?=
 =?utf-8?B?b3hwTFBRdzdIai9uL3VwWUpaNEFZc3I4Ly9xT242RFAyQjQ1MUtrV3lyZnRH?=
 =?utf-8?Q?5s8glElOkTjsjM+2mGrb9yia/?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecbca831-6a52-4ce7-5358-08dd61088302
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 01:52:14.4552 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kx75tzg5c0YYODa6r9G1rO+Ghk7ojsHj2FTiF/7v+a2lEebbpKjU9dDQ4GB+k+bmx0QPIAHi3w1a8d6mcI2oug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5627
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

--------------oRjMd29PYHJ3z4Vphmb2Onyi
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2025/3/11 19:14, Ryan Roberts 写道:
> Hi,
>
> On 11/03/2025 09:34, Huan Yang wrote:
>> Hi Christoph and Ryan,
>>
>> Can you help us check vmap_pfn's pfn check is right? Did here mischecked pfn_valid?
> I'm no expert on this piece of code, but I believe pfn_valid() is checking to
> see if a pfn is valid *memory*. i.e. does it have a corresponding struct page?
Yes, so, why vmap_pfn abandon a valid pfn when invoke 
apply_to_page_range? That's wierd.
>
> I'm guessing that vmap_pfn() is only intended to be used for non-memory pfns,
> e.g. mmio regions. You probably want either vmap() or vm_map_ram()?

Original invoke vmap, but with HVO(page struct may release to save 
memory), if udmabuf use page struct to

record which page need to vmap, will cause some problem. So we record 
this folio's pfn to map.

Each pfn **absolutally** valid, As this test report, it enter 
vmap_pfn_apply then valid is true, so trigger WRAN_ON_ONCE and return 
-EINVAL,

I think this is a mischeck, Normal rule should be:

If a pfn is not a valid, warn and return, else set this **valid** pfn 
into vmalloc area's pte.

Thanks

>
> Thanks,
> Ryan
>
>> Thank you.
>>
>> 在 2025/3/11 17:02, Bingbu Cao 写道:
>>> Christoph and Ryan,
>>>
>>> Could you help check this? Thanks.
>>>
>>> On 3/11/25 4:54 PM, Huan Yang wrote:
>>>> 在 2025/3/11 16:42, Bingbu Cao 写道:
>>>>> [You don't often get email frombingbu.cao@linux.intel.com. Learn why this
>>>>> is important athttps://aka.ms/LearnAboutSenderIdentification ]
>>>>>
>>>>> Huan,
>>>>>
>>>>> Thanks for your response.
>>>>>
>>>>> On 3/11/25 3:12 PM, Huan Yang wrote:
>>>>>> 在 2025/3/11 14:40, Bingbu Cao 写道:
>>>>>>> [You don't often get email frombingbu.cao@linux.intel.com. Learn why this
>>>>>>> is important athttps://aka.ms/LearnAboutSenderIdentification ]
>>>>>>>
>>>>>>> Huan Yang and Vivek,
>>>>>>>
>>>>>>> I am trying to use udmabuf for my test, and I cannot vmap the udmabuf
>>>>>>> buffers now. vmap_pfn_apply() will report a warning to complain that
>>>>>>> the pfns are invalid.
>>>>>>> I dump the pfn numbers as below:
>>>>>>> [ 3365.399641] pg[0] pfn 1148695
>>>>>>> [ 3365.399642] pg[1] pfn 1145057
>>>>>>> [ 3365.399642] pg[2] pfn 1134070
>>>>>>> [ 3365.399643] pg[3] pfn 1148700
>>>>>>> [ 3365.399643] pg[4] pfn 1144871
>>>>>>> [ 3365.399643] pg[5] pfn 1408686
>>>>>>> [ 3365.399643] pg[6] pfn 1408683
>>>>>>> ...
>>>>>>> [ 3365.399660] WARNING: CPU: 3 PID: 2772 at mm/vmalloc.c:3489
>>>>>>> vmap_pfn_apply+0xb7/0xd0
>>>>>>> [ 3365.399667] Modules linked in:...
>>>>>>> [ 3365.399750] CPU: 3 UID: 0 PID: 2772 Comm: drm-test Not tainted 6.13.0-
>>>>>>> rc2-rvp #845
>>>>>>> [ 3365.399752] Hardware name: Intel Corporation Client Platform/xxxx, BIOS
>>>>>>> xxxFWI1.R00.3221.D83.2408120121 08/12/2024
>>>>>>> [ 3365.399753] RIP: 0010:vmap_pfn_apply+0xb7/0xd0
>>>>>>> [ 3365.399755] Code: 5b 41 5c 41 5d 5d c3 cc cc cc cc 48 21 c3 eb d1 48 21
>>>>>>> c3 48 23 3d 31 c0 26 02 eb c5 48 c7 c7 c4 3c 20 a8 e8 5b c0 d8 ff eb 8a
>>>>>>> <0f> 0b b8 ea ff ff ff 5b 41 5c 41 5d 5d c3 cc cc cc cc 0f 1f 80 00
>>>>>>> [ 3365.399756] RSP: 0018:ffffb9b50c32fad0 EFLAGS: 00010202
>>>>>>> [ 3365.399757] RAX: 0000000000000001 RBX: 0000000000118717 RCX:
>>>>>>> 0000000000000000
>>>>>>> [ 3365.399758] RDX: 0000000080000000 RSI: ffffb9b50c358000 RDI:
>>>>>>> 00000000ffffffff
>>>>>>> [ 3365.399758] RBP: ffffb9b50c32fae8 R08: ffffb9b50c32fbd0 R09:
>>>>>>> 0000000000000001
>>>>>>> [ 3365.399759] R10: ffff941602479288 R11: 0000000000000000 R12:
>>>>>>> ffffb9b50c32fbd0
>>>>>>> [ 3365.399759] R13: ffff941618665ac0 R14: ffffb9b50c358000 R15:
>>>>>>> ffff941618665ac8
>>>>>>> [ 3365.399760] FS:  00007ff9e9ddd740(0000) GS:ffff94196f780000(0000)
>>>>>>> knlGS:0000000000000000
>>>>>>> [ 3365.399760] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>>>>>> [ 3365.399761] CR2: 000055fda5dc69d9 CR3: 00000001544de003 CR4:
>>>>>>> 0000000000f72ef0
>>>>>>> [ 3365.399762] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
>>>>>>> 0000000000000000
>>>>>>> [ 3365.399762] DR3: 0000000000000000 DR6: 00000000ffff07f0 DR7:
>>>>>>> 0000000000000400
>>>>>>> [ 3365.399763] PKRU: 55555554
>>>>>>> [ 3365.399763] Call Trace:
>>>>>>> [ 3365.399765]  <TASK>
>>>>>>> [ 3365.399769]  ? show_regs+0x6d/0x80
>>>>>>> [ 3365.399773]  ? __warn+0x97/0x160
>>>>>>> [ 3365.399777]  ? vmap_pfn_apply+0xb7/0xd0
>>>>>>> [ 3365.399777]  ? report_bug+0x1ec/0x240
>>>>>>> [ 3365.399782]  ? handle_bug+0x63/0xa0
>>>>>>> [ 3365.399784]  ? exc_invalid_op+0x1d/0x80
>>>>>>> [ 3365.399785]  ? asm_exc_invalid_op+0x1f/0x30
>>>>>>> [ 3365.399790]  ? vmap_pfn_apply+0xb7/0xd0
>>>>>>> [ 3365.399791]  __apply_to_page_range+0x522/0x8a0
>>>>>>> [ 3365.399794]  ? __pfx_vmap_pfn_apply+0x10/0x10
>>>>>>> [ 3365.399795]  apply_to_page_range+0x18/0x20
>>>>>>> [ 3365.399796]  vmap_pfn+0x77/0xd0
>>>>>>> [ 3365.399797]  vmap_udmabuf+0xc5/0x110
>>>>>>> [ 3365.399802]  dma_buf_vmap+0x96/0x130
>>>>>>>
>>>>>>> I did an experiment to revert 18d7de823b7150344d242c3677e65d68c5271b04,
>>>>>>> then I can vmap the pages. Could you help what's wrong with that?
>>>>>> Sorry for that, as I reviewed pfn_valid, that's someting wired:
>>>>>>
>>>>>> /**
>>>>>>     * pfn_valid - check if there is a valid memory map entry for a PFN
>>>>>>     * @pfn: the page frame number to check
>>>>>>     *
>>>>>>     * Check if there is a valid memory map entry aka struct page for the @pfn.
>>>>>>     * Note, that availability of the memory map entry does not imply that
>>>>>>     * there is actual usable memory at that @pfn. The struct page may
>>>>>>     * represent a hole or an unusable page frame.
>>>>>>     *
>>>>>>     * Return: 1 for PFNs that have memory map entries and 0 otherwise
>>>>>>     */
>>>>>>
>>>>>> So, if pfn valid, it's return 1, else 0. So mean, only 1 is a valid pfn.
>>>>>> But vmap_pfn_apply in there:
>>>>>>
>>>>>> static int vmap_pfn_apply(pte_t *pte, unsigned long addr, void *private)
>>>>>> {
>>>>>>        struct vmap_pfn_data *data = private;
>>>>>>        unsigned long pfn = data->pfns[data->idx];
>>>>>>        pte_t ptent;
>>>>>>
>>>>>>        if (WARN_ON_ONCE(pfn_valid(pfn)))
>>>>>>            return -EINVAL;
>>>>>>
>>>>>>        ptent = pte_mkspecial(pfn_pte(pfn, data->prot));
>>>>>>        set_pte_at(&init_mm, addr, pte, ptent);
>>>>>>
>>>>>>        data->idx++;
>>>>>>        return 0;
>>>>>> }
>>>>>>
>>>>>> Do it give a wrong check? maybe should fix by:
>>>>> I guess not, it looks more like warning when you trying to vmap a
>>>>> pfn which already took a valid entry in pte.
>>>> No, I think here check need pfn is valid, then can set it. If a pfn is
>>>> invalid, why we set it in PTE?
>>>>
>>>> Also, I can't make sure.
>>>>
>>>> BTW, can you fix it then retest?
>>>>
>>>> Thank you.
>>>>
>>>>> However, the MM code is so complex for me, just my guess. :)
>>>>>
>>>>>> static int vmap_pfn_apply(pte_t *pte, unsigned long addr, void *private)
>>>>>> {
>>>>>>        struct vmap_pfn_data *data = private;
>>>>>>        unsigned long pfn = data->pfns[data->idx];
>>>>>>        pte_t ptent;
>>>>>>
>>>>>> -    if (WARN_ON_ONCE(pfn_valid(pfn)))
>>>>>> +    if (WARN_ON_ONCE(!pfn_valid(pfn)))
>>>>>>            return -EINVAL;
>>>>>>
>>>>>>        ptent = pte_mkspecial(pfn_pte(pfn, data->prot));
>>>>>>        set_pte_at(&init_mm, addr, pte, ptent);
>>>>>>
>>>>>>        data->idx++;
>>>>>>        return 0;
>>>>>> }
>>>>>>
>>>>>> Please help me check it, also, you can apply this and then check it.:)
>>>>>>
>>>>>>> -- 
>>>>>>> Best regards,
>>>>>>> Bingbu Cao
>>>>> -- 
>>>>> Best regards,
>>>>> Bingbu Cao
--------------oRjMd29PYHJ3z4Vphmb2Onyi
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">在 2025/3/11 19:14, Ryan Roberts 写道:<br>
    </div>
    <blockquote type="cite" cite="mid:32814695-359e-4c4b-90a4-c7c34421a1d5@arm.com">
      <pre wrap="" class="moz-quote-pre">Hi,

On 11/03/2025 09:34, Huan Yang wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Hi Christoph and Ryan,

Can you help us check vmap_pfn's pfn check is right? Did here mischecked pfn_valid?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I'm no expert on this piece of code, but I believe pfn_valid() is checking to
see if a pfn is valid *memory*. i.e. does it have a corresponding struct page?</pre>
    </blockquote>
    Yes, so, why vmap_pfn abandon a valid pfn when invoke
    apply_to_page_range? That's wierd.<br>
    <blockquote type="cite" cite="mid:32814695-359e-4c4b-90a4-c7c34421a1d5@arm.com">
      <pre wrap="" class="moz-quote-pre">

I'm guessing that vmap_pfn() is only intended to be used for non-memory pfns,
e.g. mmio regions. You probably want either vmap() or vm_map_ram()?</pre>
    </blockquote>
    <p>Original invoke vmap, but with HVO(page struct may release to
      save memory), if udmabuf use page struct to</p>
    <p>record which page need to vmap, will cause some problem. So we
      record this folio's pfn to map.&nbsp;</p>
    <p>Each pfn **absolutally** valid, As this test report, it enter <span style="white-space: pre-wrap">vmap_pfn_apply then valid is true, so trigger WRAN_ON_ONCE and return -EINVAL,</span></p>
    <p><span style="white-space: pre-wrap">I think this is a mischeck, Normal rule should be:</span></p>
    <p><span style="white-space: pre-wrap">If a pfn is not a valid, warn and return, else set this **valid** pfn into vmalloc area's pte.</span></p>
    <p><span style="white-space: pre-wrap">Thanks
</span></p>
    <p><span style="white-space: pre-wrap">
</span></p>
    <blockquote type="cite" cite="mid:32814695-359e-4c4b-90a4-c7c34421a1d5@arm.com">
      <pre wrap="" class="moz-quote-pre">

Thanks,
Ryan

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
Thank you.

在 2025/3/11 17:02, Bingbu Cao 写道:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">Christoph and Ryan,

Could you help check this? Thanks.

On 3/11/25 4:54 PM, Huan Yang wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">在 2025/3/11 16:42, Bingbu Cao 写道:
</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">[You don't often get email from <a class="moz-txt-link-abbreviated" href="mailto:bingbu.cao@linux.intel.com">bingbu.cao@linux.intel.com</a>. Learn why this
is important at <a class="moz-txt-link-freetext" href="https://aka.ms/LearnAboutSenderIdentification">https://aka.ms/LearnAboutSenderIdentification</a> ]

Huan,

Thanks for your response.

On 3/11/25 3:12 PM, Huan Yang wrote:
</pre>
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">在 2025/3/11 14:40, Bingbu Cao 写道:
</pre>
                <blockquote type="cite">
                  <pre wrap="" class="moz-quote-pre">[You don't often get email from <a class="moz-txt-link-abbreviated" href="mailto:bingbu.cao@linux.intel.com">bingbu.cao@linux.intel.com</a>. Learn why this
is important at <a class="moz-txt-link-freetext" href="https://aka.ms/LearnAboutSenderIdentification">https://aka.ms/LearnAboutSenderIdentification</a> ]

Huan Yang and Vivek,

I am trying to use udmabuf for my test, and I cannot vmap the udmabuf
buffers now. vmap_pfn_apply() will report a warning to complain that
the pfns are invalid.
I dump the pfn numbers as below:
[ 3365.399641] pg[0] pfn 1148695
[ 3365.399642] pg[1] pfn 1145057
[ 3365.399642] pg[2] pfn 1134070
[ 3365.399643] pg[3] pfn 1148700
[ 3365.399643] pg[4] pfn 1144871
[ 3365.399643] pg[5] pfn 1408686
[ 3365.399643] pg[6] pfn 1408683
...
[ 3365.399660] WARNING: CPU: 3 PID: 2772 at mm/vmalloc.c:3489
vmap_pfn_apply+0xb7/0xd0
[ 3365.399667] Modules linked in:...
[ 3365.399750] CPU: 3 UID: 0 PID: 2772 Comm: drm-test Not tainted 6.13.0-
rc2-rvp #845
[ 3365.399752] Hardware name: Intel Corporation Client Platform/xxxx, BIOS
xxxFWI1.R00.3221.D83.2408120121 08/12/2024
[ 3365.399753] RIP: 0010:vmap_pfn_apply+0xb7/0xd0
[ 3365.399755] Code: 5b 41 5c 41 5d 5d c3 cc cc cc cc 48 21 c3 eb d1 48 21
c3 48 23 3d 31 c0 26 02 eb c5 48 c7 c7 c4 3c 20 a8 e8 5b c0 d8 ff eb 8a
&lt;0f&gt; 0b b8 ea ff ff ff 5b 41 5c 41 5d 5d c3 cc cc cc cc 0f 1f 80 00
[ 3365.399756] RSP: 0018:ffffb9b50c32fad0 EFLAGS: 00010202
[ 3365.399757] RAX: 0000000000000001 RBX: 0000000000118717 RCX:
0000000000000000
[ 3365.399758] RDX: 0000000080000000 RSI: ffffb9b50c358000 RDI:
00000000ffffffff
[ 3365.399758] RBP: ffffb9b50c32fae8 R08: ffffb9b50c32fbd0 R09:
0000000000000001
[ 3365.399759] R10: ffff941602479288 R11: 0000000000000000 R12:
ffffb9b50c32fbd0
[ 3365.399759] R13: ffff941618665ac0 R14: ffffb9b50c358000 R15:
ffff941618665ac8
[ 3365.399760] FS:&nbsp; 00007ff9e9ddd740(0000) GS:ffff94196f780000(0000)
knlGS:0000000000000000
[ 3365.399760] CS:&nbsp; 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 3365.399761] CR2: 000055fda5dc69d9 CR3: 00000001544de003 CR4:
0000000000f72ef0
[ 3365.399762] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
[ 3365.399762] DR3: 0000000000000000 DR6: 00000000ffff07f0 DR7:
0000000000000400
[ 3365.399763] PKRU: 55555554
[ 3365.399763] Call Trace:
[ 3365.399765]&nbsp; &lt;TASK&gt;
[ 3365.399769]&nbsp; ? show_regs+0x6d/0x80
[ 3365.399773]&nbsp; ? __warn+0x97/0x160
[ 3365.399777]&nbsp; ? vmap_pfn_apply+0xb7/0xd0
[ 3365.399777]&nbsp; ? report_bug+0x1ec/0x240
[ 3365.399782]&nbsp; ? handle_bug+0x63/0xa0
[ 3365.399784]&nbsp; ? exc_invalid_op+0x1d/0x80
[ 3365.399785]&nbsp; ? asm_exc_invalid_op+0x1f/0x30
[ 3365.399790]&nbsp; ? vmap_pfn_apply+0xb7/0xd0
[ 3365.399791]&nbsp; __apply_to_page_range+0x522/0x8a0
[ 3365.399794]&nbsp; ? __pfx_vmap_pfn_apply+0x10/0x10
[ 3365.399795]&nbsp; apply_to_page_range+0x18/0x20
[ 3365.399796]&nbsp; vmap_pfn+0x77/0xd0
[ 3365.399797]&nbsp; vmap_udmabuf+0xc5/0x110
[ 3365.399802]&nbsp; dma_buf_vmap+0x96/0x130

I did an experiment to revert 18d7de823b7150344d242c3677e65d68c5271b04,
then I can vmap the pages. Could you help what's wrong with that?
</pre>
                </blockquote>
                <pre wrap="" class="moz-quote-pre">Sorry for that, as I reviewed pfn_valid, that's someting wired:

/**
&nbsp;&nbsp; * pfn_valid - check if there is a valid memory map entry for a PFN
&nbsp;&nbsp; * @pfn: the page frame number to check
&nbsp;&nbsp; *
&nbsp;&nbsp; * Check if there is a valid memory map entry aka struct page for the @pfn.
&nbsp;&nbsp; * Note, that availability of the memory map entry does not imply that
&nbsp;&nbsp; * there is actual usable memory at that @pfn. The struct page may
&nbsp;&nbsp; * represent a hole or an unusable page frame.
&nbsp;&nbsp; *
&nbsp;&nbsp; * Return: 1 for PFNs that have memory map entries and 0 otherwise
&nbsp;&nbsp; */

So, if pfn valid, it's return 1, else 0. So mean, only 1 is a valid pfn.
But vmap_pfn_apply in there:

static int vmap_pfn_apply(pte_t *pte, unsigned long addr, void *private)
{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct vmap_pfn_data *data = private;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned long pfn = data-&gt;pfns[data-&gt;idx];
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pte_t ptent;

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (WARN_ON_ONCE(pfn_valid(pfn)))
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -EINVAL;

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ptent = pte_mkspecial(pfn_pte(pfn, data-&gt;prot));
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set_pte_at(&amp;init_mm, addr, pte, ptent);

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;idx++;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;
}

Do it give a wrong check? maybe should fix by:
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">I guess not, it looks more like warning when you trying to vmap a
pfn which already took a valid entry in pte.
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">No, I think here check need pfn is valid, then can set it. If a pfn is
invalid, why we set it in PTE?

Also, I can't make sure.

BTW, can you fix it then retest?

Thank you.

</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">However, the MM code is so complex for me, just my guess. :)

</pre>
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">static int vmap_pfn_apply(pte_t *pte, unsigned long addr, void *private)
{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct vmap_pfn_data *data = private;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned long pfn = data-&gt;pfns[data-&gt;idx];
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pte_t ptent;

-&nbsp;&nbsp;&nbsp; if (WARN_ON_ONCE(pfn_valid(pfn)))
+&nbsp;&nbsp;&nbsp; if (WARN_ON_ONCE(!pfn_valid(pfn)))
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -EINVAL;

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ptent = pte_mkspecial(pfn_pte(pfn, data-&gt;prot));
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set_pte_at(&amp;init_mm, addr, pte, ptent);

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;idx++;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;
}

Please help me check it, also, you can apply this and then check it.:)

</pre>
                <blockquote type="cite">
                  <pre wrap="" class="moz-quote-pre">--&nbsp;
Best regards,
Bingbu Cao
</pre>
                </blockquote>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">--&nbsp;
Best regards,
Bingbu Cao
</pre>
            </blockquote>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------oRjMd29PYHJ3z4Vphmb2Onyi--
