Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4496A81E4D
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 09:30:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 176DC10E7EE;
	Wed,  9 Apr 2025 07:30:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zxO3w5+z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2052.outbound.protection.outlook.com [40.107.236.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5025210E7EE;
 Wed,  9 Apr 2025 07:29:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EFEgYl4s4635V+N4ihqdji7tuJNJY14qfoZQkeVHCQ8mzjTR7cKjIHBHB189twfrlOb5gB8Zd5DQyZ9oSbGxvoyI6zjAv1aLP9I6EAJ95cnrsI1ifEMdBKr35sTBmaxV+WUKuKECEPztR2IJSL63An7JcosPslPhgVTKXzBBPvPzsUaVuPrBHGletDThM0Pd84GfAx5afuBW7/WALWZC9HQLQMEwEAfo2aKsUKzyamGibxtB1q0OAsF2Gf4lb+3sdnf56ocbadCwMX8CX/5C9ntu6KmAcJ7Gzvtn514rtIoLFnInWsVvwyz4DDEFU74Mn1NAb1+bPBEt26ghLOvEkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N6ol8ki9ithBZEHJXS4NpsWfI0rlDRXp8wPfSrkn3eg=;
 b=vpgaM9UhqisdU9Rq2v+dEPvQAb7/4jk4LzUh/uD69QzpeRhowp7F9bUNJhGdybEznh2UMLdk84nXoHdfAP9md3fbQossgIErWyLyDY2znGG9ieNw1fxTQoavKkphK1AQ0L8tzt5kP7VE2DBVYjL4ArYINGsSXp8XeyeBSggwFyZZ5+qAx9KCOpaF3qNZustahSWqGl9D1zV4AEKi/hzWIlZgEWleoGD7W7lztfe8YxO9YI8dRKZL5nBHundLYdm1iI/HsNq7K1AQ4xo+PbXPm4Pj0W+NF/mdDhf3uWD2TP2FWFIzoLACTY9Mplol639aAPYZcsGR9Vyif4eKpiis0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N6ol8ki9ithBZEHJXS4NpsWfI0rlDRXp8wPfSrkn3eg=;
 b=zxO3w5+zI3PjbFVb5jao8t+X+SwOLpgxX2LCNZB1jWCHt9oXOPHaQwAOdTZcYcft8I2uZHcOdw6WcgGHb2eDXL6C3jnGu48lDj6RKNQQadD0n2kUswWeYdY3ONCE8xA2c5ui/8bywAh6yGk7ffS7pebTq9WmDlvKJ3+BIEM2Ifo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN2PR12MB4141.namprd12.prod.outlook.com (2603:10b6:208:1d5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.22; Wed, 9 Apr
 2025 07:29:52 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8632.021; Wed, 9 Apr 2025
 07:29:52 +0000
Message-ID: <437e12e2-ac0d-4a97-bd55-39ee03979526@amd.com>
Date: Wed, 9 Apr 2025 09:29:47 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [lvc-project] [PATCH] drm/amdgpu: check a user-provided number of
 BOs in list
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Fedor Pchelkin <pchelkin@ispras.ru>
Cc: Denis Arefev <arefev@swemel.ru>, Alex Deucher
 <alexander.deucher@amd.com>, Simona Vetter <simona@ffwll.ch>,
 lvc-project@linuxtesting.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>
References: <20250408091755.10074-1-arefev@swemel.ru>
 <e6ccef21-3ca5-4b5a-b18a-3ba45859569c@amd.com>
 <bmdour3gw4tuwqgvvw764p4ot3nnltqm4e7n3edlbtpfazvp5c@cqe5dwgc66uy>
 <f8810b13-01d1-4615-b6e2-2e791c48b466@amd.com>
 <qc72y52kt7vuwox4lhk42zligy5bslttselfoexse42mywtpps@ebqijs2tap2t>
 <edc08eb4-63dd-402c-82df-af6898d499a9@amd.com>
 <pmby7iowvxuomsbuxebttosz245j7ngw5enbl72dq675nrgvve@ugkvzeihbtut>
 <CAHk-=whLixL8-iYt1qH0-YvEnVsYtryZaN5Da0qoBBhKsBnumw@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAHk-=whLixL8-iYt1qH0-YvEnVsYtryZaN5Da0qoBBhKsBnumw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0009.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::19)
 To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN2PR12MB4141:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d0ef98a-ceac-43a0-feec-08dd77385157
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TElqYzkvWHdZQ2FuZXFldFVWSE5pYnJqNGxoVW1VRzlxMEJ4WVZRZDJtRG4y?=
 =?utf-8?B?bUp6Szhia00yY0RJRnZKMktIM3RhUXJPUW1pSDM5MjJNY2FRc1FzN0ZXMlFN?=
 =?utf-8?B?d0E0TE1zM2RtZFFDMktJNHhwQVZVanBuNk85RzZacGQzejJFZEEvOGNWRGds?=
 =?utf-8?B?bzBWbzRBZDNHamVDVUZFWTdMZFlSUWxzbDRjcURLMGVHeG1walg0a3daNTJq?=
 =?utf-8?B?MUd0SzhHRTJ5RFRyVW05S1EvaS84YWFhYk9qRDh0S25xV0JLZDQzcXNERWJk?=
 =?utf-8?B?ckV4Z0oyS1VKRElVNUh0bU1MNGR3RmZaOVNmc3BaZ0hRTW52d0tNT1RvbEtE?=
 =?utf-8?B?Mnd5VytHbWJNSHhZazFINzRwcGM5OHBJbm15TlJoNFh6L0d0cjN5UStkbnhy?=
 =?utf-8?B?eFVvNTh2KzZTRElibTJ0NkpNMHV0eHNkbXlDMkdraVRQdUlFeTU0VllVSFpS?=
 =?utf-8?B?ZnlKR25vMXY0dGZKVWcwRG1sMG5XYk1PNFNnc1l6c2RxZjVZS2R1UkNjSlJP?=
 =?utf-8?B?VUpJV1VVU2FsOHluZXRsdUJPeHgyU2dJWWNncGdaaHpjazg2Y2pFZWQvZjNE?=
 =?utf-8?B?NlA4QXFOR3Z4SSttYllnVG15ZzEvNkFHditBZ0VabUlCSExSekZFcjdXT2dO?=
 =?utf-8?B?UWZNMzRROGJiNXFZYzJpVGxsUjg4amJ6Z1R1NUdxYjVZN0lvTmtFVHROVkgz?=
 =?utf-8?B?U0tiemVmTkZYSkVGbkRyTDdvc2hucGFrWGJWSHloQWR6WnpoWEJod0p5MWla?=
 =?utf-8?B?YTFud3pvZ2pPK3hENzlyRkxQSUV3dWZyNDREUW04cHlIVGhXOXBaSWlMczE2?=
 =?utf-8?B?NnRKbjkrTkQvUFlmYWdHSnpXc04xWTBOZFZ5aEZSaFdBTW10VTlhSG9laU1E?=
 =?utf-8?B?QzE1VmcwdUsxR0doK1B5a3JtRXZXcjg5UmUzUm12UDA3MVRGVnBtcGNqRVdz?=
 =?utf-8?B?Q0w4dit1WWpMK0J4K0JYUlRRaGVPTUJoalozQ3h6aEVYZG8vTmo1bXo0SmdI?=
 =?utf-8?B?NmFOem9RRUhmYXh4UmpnV1YzSDcySnBWRGwvT2F6QlNUMTNjVXlScy9EQzl2?=
 =?utf-8?B?TmQySXEyaUprbTRPblRaajU1TnFHOTFicDJwWjE5bnUzaHBjVGpUOXkzNmVH?=
 =?utf-8?B?WXlOek51NmFVaVFPS2RrSUdBb1hQVUd4YTBWU0ZCODBKWjJoUU9ER3p3RnM3?=
 =?utf-8?B?YUptT28vSEFhRXIvNzAxaDcyTVZoR3dQdUs2aktIRzNDanZ2SGxZbzYyei8r?=
 =?utf-8?B?NWV5VG5SNXhzT05lU3VrUVFxYisybFFMcHZsazlyMWc2Tk5vM3ZRUUlVaEZM?=
 =?utf-8?B?K09Kd3RDR2R6MzNlRk0zVVhVNDQ0RVNreXBDQXV4QWpIaE90aWt1by91bVZL?=
 =?utf-8?B?ZFp0NUtycDd4L0xmVWVUMWhGSldaWDJTbUNYcjV5S1lJczJNelEvOWhFbmx1?=
 =?utf-8?B?aVVTYnBEMTZDOUJXQXF6SnVtdHBvViszb3BIVEhMVFI0Ymd5bVlUNS8xSUdk?=
 =?utf-8?B?T3M1dDBQMkVpTng5enhUVEU5aUdHUXRGZWlHWStXWVg2R21mNWFENXlvYXZP?=
 =?utf-8?B?WGNocktxOTE5YkFQbmU0TzBMekRhZTNOWUN3OU53Zm5sQXpvelZ1dVJWM1dz?=
 =?utf-8?B?NWpSNGJENXpObCs5NmZBK1dzMVF4SjZBc2Rwd3JrU0ErTDVyby90LytyeVhC?=
 =?utf-8?B?azRQR3huZXBYZllBVmVuWnlkTStqZTNGZldEVmExanAxQ3pzR1F4elN5aDBq?=
 =?utf-8?B?Z2wybFMyY3FDN1hINXBybnBqL1JkaUFYSEkwSk9RRW9sZjJKbUdDUVBUZndx?=
 =?utf-8?B?QnR4M1dWVUZhWjQ1UzBBaTNkUDdOU2NzUWxiYWZSVDE4UFlQd1ZHMmhQbFFo?=
 =?utf-8?B?Y0JwTWRyOFlNS3JKNXJKYjBsOHFucnNzSThOMWVaN1ZyMmJjQk9ReHFESmdq?=
 =?utf-8?Q?+XW5kZqcCc4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Znl5QnRya3U1cFdDOEFVOWxncktvVG4za2VGQmRJaGVhRU5wR2pONXd5VHBR?=
 =?utf-8?B?M1lHbkRGL1RnVzQwSnpzdzVWdTgyQWszQUpFdE1yNWRLcWlPNmhzSDVlTlFi?=
 =?utf-8?B?Y2tib3g4THFCbG9mTWY4Nzl1UHJTTkNzdm1ENUJkOVFKMk9uVW9LOTVsQ0hR?=
 =?utf-8?B?Vk8wQVc5LzkraldJbUNxL0pMdHd4VC8wVjVmQ3NOL2srRUMzNnBFV3JuR21M?=
 =?utf-8?B?ZnoxSUdSYVJMRERMSCtBQ0FDc1o3cWxyYzV0c0Roam5JZVowMFhpMFVRK0dS?=
 =?utf-8?B?TmlIb0g4YkptSTRkamNnL1V0a01DRXlvQ3ZhZWljWTQzTGhJZ0VjL0FYYkI2?=
 =?utf-8?B?VlRYMjBzQ1ByQlp5YVdtZFJHdmxXblF3OGljQ1NVM1BlU1RHRTZuMnVyNGR3?=
 =?utf-8?B?UkFiV3R6dlA5YWZRNjJOVCtGUVcvR2UzSC94OUZLdURkZ0xPZ3JlWHVMUUxa?=
 =?utf-8?B?RTFPdnQ4ZUFBa1IzOEdtd1ZGdUMxS3NsZ2ExcERhNlQ5ZllaWDBybm14T1BM?=
 =?utf-8?B?RTZURzZwYXpOTndodmVCQzZTZVF2UlF6eVQ5UHhRMnlIWkRCZUdMS1FDWU1C?=
 =?utf-8?B?NS9ML1FyWEswRnp4RDBqbjFCemlZK3BXVE9UVnpxVmtaRWpOZ2trKzdSeDFh?=
 =?utf-8?B?OUhwM2ZZSzl5dFdMSzNjRHdiU0NMSFhPTCtVZmNGS1BuVDVZa0sxTk5HTG0v?=
 =?utf-8?B?dVNBYlJDenRLWjVWQU1kRDlSbnI2VEU0RHFEcE5FbU5adVk4U2ZYT0tIYU5l?=
 =?utf-8?B?K3ZCSktMRTgreWdmNTFQUDhPZG13Q1ptWnp3T1QvRmFVc29NeVVFUjhiNzFs?=
 =?utf-8?B?U05kWFZEN1Y5UDJvWnNDcGE1czlLSkZsSmZuNGpBVGV0akJpMHR4OXdwTUlw?=
 =?utf-8?B?dExNN21Fbm8xTXVkQ3loYmRSTGNpZEJVcDNjUTVFeGRjdlltYkl6ZGhJY3hS?=
 =?utf-8?B?ZE1sUVc4cnFwV2tvc0w3SnduL0t6aXNTNm8wMmZRY3NhRUFKUElpQlVJSmgw?=
 =?utf-8?B?VzYvS0NyZ1loRlkrTyt3cTVvYlBsWXZTMmI5QThjakdOcjlENVg3dWRuSVJW?=
 =?utf-8?B?b2dsV0g5MWhSNnpCYmFweitUZHBtTjIxY3loVXg4RFhNdTVha00wblZJRE5s?=
 =?utf-8?B?dVFic0VyNCtzNGhsZ0NHaEhidmVpbGl6QXc1OUg1TGQ2K1dXTUhHVWg3RzBL?=
 =?utf-8?B?WWxFSzJsQkFQeUVIZ25BN0UyVGVrR3Z0SHFNSmdDclFlTDRpMmp5dHNpUWl4?=
 =?utf-8?B?NXRxQ096OUhmdis2ZklsL2pjdHdyS0xYM3VpNkptb2xhR1JFbmtRRGxINXR4?=
 =?utf-8?B?ZitueWJMbXBLdFRPcUY3Y2hiOW5rSDVoeDJpc2h6OVhsSHVINlVRZmFWaXFh?=
 =?utf-8?B?QmI5WXFSWFo1OGE3cFBqWFcwWVBSNlNVNkxORGVIOEdQRDk3bEUzZDVpOGRo?=
 =?utf-8?B?R09hMXNQTFA1UUJxOWFQNFVtaTBoTFZlUk0zbDFBRG8ycVJWcHM2b1FraGp5?=
 =?utf-8?B?cFdESStqZjUwTVg1T29BbGs3NXltS3FEYmNDQkJRWHZxZ3lCUDZ4aGJoV1ZD?=
 =?utf-8?B?VU5lRWw0RHdxS0VtQjZvVGFoTElncWhZR3JKNUxST21nMmFNYmZOalhCYmxa?=
 =?utf-8?B?R3grSFlrV1NwT0JXVnV4WVV3Q0o4ZVJkUW5aM2p4S29vYXJGNFIwVkVPMm4r?=
 =?utf-8?B?ZUprbVBpSlZhL3lKTVJJNnBXd3Nrc3BlcWFSemN5VEZIRmNaYTNuL0p5TVZu?=
 =?utf-8?B?WlFhNzVSbC9WaEtaZHlSelk3MlFRTFpiWTc4Z2hocThyWEEvN01hbk9UYlV4?=
 =?utf-8?B?cFpsSlZpQVJaV05Qb1k5RTVmNnlqb0dhdVYrc1dSWnd6dnVZMnRuYXpaTitX?=
 =?utf-8?B?cWVEbXVWSWdRcWY2TzhSeFVCMk1zODVFcnhMdDRSNWt2RzRpd041bTF5S216?=
 =?utf-8?B?dVZmZ1AxYWdYZldOZ0M5amdxaS92a3phQkJlQUgzdW9zTG5mVXpqUDh5VGpB?=
 =?utf-8?B?Y0JqNUlQYW9SNzNhRFpINEZOWVh0aTVHUDNyMVRIQXk0OXJDZnBYRUxUYU9C?=
 =?utf-8?B?dWJhNTgzOWptZDFnb0xwQkRxbmc5RkJmSzZUaGhKQ0RuSHNLUkdHVTdVM1FY?=
 =?utf-8?Q?2cl7xyy/ir7m28WwYcKoUHqjV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d0ef98a-ceac-43a0-feec-08dd77385157
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 07:29:52.4242 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QnioJq8FfdoMA0IGVm2N8kkXx0Wk5D/BGmVZgS3QJrwciwK35gklh0TC/sklII37
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4141
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

Am 09.04.25 um 04:39 schrieb Linus Torvalds:
> On Tue, 8 Apr 2025 at 09:07, Fedor Pchelkin <pchelkin@ispras.ru> wrote:
>>> Linus comment is about kvmalloc(), but the code here is using
>>> kvmalloc_array() which as far as I know is explicitly made to safely
>>> allocate arrays with parameters provided by userspace.
> No.
>
> ABSOLUTELY NOTHING CAN ALLOCATE ARRAYS WITH PARAMETERS PROVIDED BY USER SPACE.
>
> All kvmalloc_array() does is to check for overflow on the multiplication.
>
> That does *not* mean that you can then just blindly take user space
> input and pass it to kvmalloc_array().
>
> That could easily cause the machine to run out of memory immediately,
> for example. Or just cause huge latency issues. Or any number of other
> things.
>
>> [27651.163361] WARNING: CPU: 3 PID: 183060 at mm/util.c:657 __kvmalloc_node_noprof+0xc1/0xd0
>> [27651.163411] CPU: 3 UID: 0 PID: 183060 Comm: a.out Not tainted 6.13.9-200.fc41.x86_64 #1
>> [27651.163412] Hardware name: ASUS System Product Name/PRIME X670E-PRO WIFI, BIOS 3035 09/05/2024
>> [27651.163413] RIP: 0010:__kvmalloc_node_noprof+0xc1/0xd0
>> [27651.163424] Call Trace:
>> That's just
>>
>>     union drm_amdgpu_bo_list bo_list;
>>     int fd, ret;
>>
>>     memset(&bo_list, 0, sizeof(bo_list));
>>
>>     fd = open(DEVICE_PATH, O_RDWR);
>>
>>     bo_list.in.bo_number = 1 << 31;
>>     ret = ioctl(fd, DRM_IOCTL_AMDGPU_BO_LIST, &bo_list);
> Yes, exactly, and that's bogus code in the DRM layer to just blindly
> trust user space.
>
> User space input absolutely has to be validated for sanity.

That's what I totally agree on. My question is rather is it better to do this in a centralized function or spread out over tons of different use cases?

I mean open coding the limit checks everywhere certainly works, but as far as I can see it would be more defensive if we do that inside kvmalloc_array().

Or maybe a separate function which takes a maximum as parameter?

BTW we have been running into the kvmalloc() check on valid use cases as well. For example on a system with a >256TiB of system memory having a single descriptor array >4GiB is perfectly valid. It's just not valid in any possible way if you only have 8GiB in total.

In the past we worked around that by switching to multiple smaller allocations or different container types, but that is actually not the most optimal way of doing it.

Regards,
Christian.

>
> There's a very real reason why we have things like PATH_MAX.
>
> Could we allocate any amount of memory for user paths, with the
> argument that path length shouldn't be limited to some (pretty small)
> number?
>
> Sure. We *could* do that.
>
> And that would be a huge mistake. Limiting and sanity-checking user
> space arguments isn't just a good idea - it's an absolute requirement.
>
> So that kvmalloc warning exists *exactly* so that you will get a
> warning if you do something stupid like just blindly trust user space.
>
> Because no, "doesn't overflow" isn't even remotely a valid limit. A
> real limit on memory allocations - and most other things, for that
> matter - needs to be about practical real issues, not about something
> like  "this doesn't overflow".
>
>             Linus

