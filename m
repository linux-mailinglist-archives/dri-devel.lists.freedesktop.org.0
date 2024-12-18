Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CC99F6247
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 11:01:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75F0010EB33;
	Wed, 18 Dec 2024 10:01:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Bde7/eqC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2043.outbound.protection.outlook.com [40.107.223.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D68710EB31
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 10:01:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IzhD15ylB/mlpR3+ly/fEXBBBceEgk0bmPfjrQ952SmwOLhX3Uz/4MXgU1MLvqhuJmHK1C1WqJUJW3nycacwSM97CX+TT80pUtqXfRicJYI1CQAs6ceaRoYrrQjs7ueFxEe8/RivnLbFcvoSU82s7rq8ah5/W4Da2r6A/NpQ67T3KXH/tfxMVWKgjp/1jvCCBUfM8IGtSbCAGshDw0TNMFWVmgiKb+0Xop0W9nZ1Cad9423C4YdpkTDemh4kGEbnAGNTKiuPNm9pNo6Lt3LD6L3nX+YRgLJS4lzjjt1kRUdPO1mChc213BBbQJfOzjA0ar9OmduZVWEnR32BKnMc1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W9B5o493u540D1ip9lfoYemYerlaLtoJ53R2gw3pt50=;
 b=w6dDJ0eKiFE9vU/+gjq2/EK6j+pN2iupB1kakp4hPBB9E0A5E0DAJHkHYVWM7MjKSJzdPZ9TNRcWJyD/HrZUE+gj3BdTRRKrA/5mFUcdaNZEzn8MW/QhxUHvh0DDjtn5hNLU0fwqZe/4kUaM+Pljqs/tc7gy/e9m63y5cUiKyjNISWe9VxxHMbeJ8dlqNM4J6H1cjSsExR+PRaM66gWyCIQ6285zfy9Uds4SBAlqmpnGbE39a98+J/+CslScvDyUuIpFc2N0NBP8d83YDVmOHkXw2Te5owpm9eegRQBwD/DDQjKD+ejHYcs8D3onAwTXWgaz7wqKiY5W3ND4INinGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W9B5o493u540D1ip9lfoYemYerlaLtoJ53R2gw3pt50=;
 b=Bde7/eqCPdnXIsmXMSjQ0p6KJ1Ps8Fw726JkNlSUWQA6lThMAp7JOy6ISRCgpWLKFhEy/Fhp3HPRhStsRvDaRX38mR9QVT1gq7GYdJWS/OfDsUWyszPAg7z3HONC3Gbu8mzw/fjXoQvWSF2WmM4lP4BEy5Yj7FQCGqdLfwig8Sw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY8PR12MB8339.namprd12.prod.outlook.com (2603:10b6:930:7e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.12; Wed, 18 Dec
 2024 10:01:24 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8272.005; Wed, 18 Dec 2024
 10:01:24 +0000
Message-ID: <0c7ab6c9-9523-41de-91e9-602cbcaa1c68@amd.com>
Date: Wed, 18 Dec 2024 11:01:17 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] cover-letter: Allow MMIO regions to be exported
 through dmabuf
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 Wei Lin Guay <wguay@meta.com>
Cc: Keith Busch <kbusch@kernel.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "jgg@nvidia.com" <jgg@nvidia.com>, Dag Moxnes <dagmoxnes@meta.com>,
 Nicolaas Viljoen <nviljoen@meta.com>, Oded Gabbay <ogabbay@kernel.org>,
 Simona Vetter <simona.vetter@ffwll.ch>, Leon Romanovsky <leon@kernel.org>,
 Maor Gottlieb <maorg@nvidia.com>
References: <20241216095429.210792-1-wguay@fb.com>
 <89d9071b-0d3e-4fcd-963b-7aa234031a38@amd.com>
 <Z2BbPKvbxm7jvJL9@kbusch-mbp.dhcp.thefacebook.com>
 <0f207bf8-572a-4d32-bd24-602a0bf02d90@amd.com>
 <C369F330-5BAD-4AC6-A13C-EEABD29F2F08@meta.com>
 <e8759159-b141-410b-be08-aad54eaed41f@amd.com>
 <IA0PR11MB7185D0E4EE2DA36A87AE6EACF8052@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <IA0PR11MB7185D0E4EE2DA36A87AE6EACF8052@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0096.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY8PR12MB8339:EE_
X-MS-Office365-Filtering-Correlation-Id: c3756258-aee1-478d-e7c2-08dd1f4aee6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cWNxTTVLQ1diS2g4QWZTWVcxVGlkdEhPOHNqblBlTDYrVWpTejN2K3ZDYlRY?=
 =?utf-8?B?Y1BYR3FIejIvWGNyUUFGb3RmY2xkdDdRUGRFVVE2SlprNXFhSERzMmcrVFZM?=
 =?utf-8?B?dTNOaGJ1bFBrQk9Va0FOc1AyWW1KdHNYUVFXYnRaTW8zS2Rqd3dpNndnK2Zy?=
 =?utf-8?B?aStUclY1K1p5VXFmZHFMeVFGL2I0MVc5SnpFUUdPeDRwaHU5bE41WXFvY1Q3?=
 =?utf-8?B?Z2d2bERMM09ia1FKcDg4eUQrdGtaNm90UEFOdWtjVTV3em1xbmtiNDFlbkZj?=
 =?utf-8?B?NHJJbjVDMGtqeWIzZFJVOG9PS1VmRlBtL1JTMzJqZnl1bmpsekJkVWlQYk5m?=
 =?utf-8?B?dVpjWjY1cHhTdlRhRUZQYVNnZzRJcHhxcSt4KzdVUVBQWHkvbkdTSUdEemhi?=
 =?utf-8?B?d0l2QlFwYXlzeVJ0OTZ5dUx4UXdxandrNktYVk5KWlhhUGdLaXcvSUtwM3Zp?=
 =?utf-8?B?QS9CZC9VMzlGVVgwZ3Q3cjIybzZmMTYwREtQMkdRcnJkdEhQZUFveEx2RTd3?=
 =?utf-8?B?Uk9aOVFMUDJ1MjRWa2t3YjZlbUxtbHlLWUdyTHJ4dittQ0xEejVtbExRdkZs?=
 =?utf-8?B?eEV5Ry9jREVlUHdJRDhTcWtxaXA0WWE4NVNMWFU3MjgwUXZLNjJtV0YvdzJI?=
 =?utf-8?B?WVFZOEdrRE13d2UzbWc4Vkp5MHJiVFRqM3Y2SlN3Y3lLOWZFRk44MUdTUmVx?=
 =?utf-8?B?K3ZHdmxobi91UXpsUGU0a1RqNm1NL091TXNvRUd2aWJlV203a0JSSnRCbVlu?=
 =?utf-8?B?MTloOFE4VGN1MXlPTkdFeHE3cm1pT1E3L0k3bUZWT0E5cEFSSGd6YjBFS1RU?=
 =?utf-8?B?b1pJem1hMEtja1dzR2VGNDBCSG5RRFZjdjNYR250disvc2J0bXJacU40bDgy?=
 =?utf-8?B?TGQxVloyc0JzL01MeHU4bXhtTE0vTmp4REM4VW5JanN5d1Arc2VUeUd5bENR?=
 =?utf-8?B?aEs3VW1JTmtsNGFhL1VFejVEaWFGcExRKzlsakc2Yk5GZWk5OWhueWtqL1lh?=
 =?utf-8?B?M0NHd0hPS1Nnd2pxbEJYOWNOaUlOZityWVhYc0JMd2tLa3RELzk4cTNvYlVq?=
 =?utf-8?B?WThxMGpNUGMzbngvaThOZEhoMDBJSW5NWjRCVjRKbnY4NVltYW9NSlBSbnZ3?=
 =?utf-8?B?MTE2djdDUlltc3YzWWJOc001STA2TjBwekc2Z2VsZGNBYzVMQ1R2cGZpMjY5?=
 =?utf-8?B?em8yZmxkM3VpK2NvMFlxS1JKSDdrRUxCNGFoU25lalMwMXZheHZjZEZaYzVj?=
 =?utf-8?B?MHRPK3ZYZFpFcmFIMGdqbHUwVU13dlpBaU5ZZjZpbmVwdUpzMEdnblA5SXBJ?=
 =?utf-8?B?akFTWGZodWVLQS92Nk5OU2lWNkl1ekpxZm9GYUppaWxQMVdKVGhFcDNoVUNv?=
 =?utf-8?B?bDZxZmdGUDJPME01c2R2NFdqTTdhdGhJbEE4K3ZVVVJzb3NHbXRiUTE4VEhS?=
 =?utf-8?B?aU9QVTZrcUE0Z0s5eXEzRDNRa2FvSklmK3labVNzWS9xNnlZaEtSNnhubk5J?=
 =?utf-8?B?ZFAzYzZwRENqSGpOSTN0NGljQWhZdENDUmFiN2VEZk9JMVRNb2dRYjMxek92?=
 =?utf-8?B?YTlwbnNtYkgwdWw1TlkvdGR0aFdyck5kNFhuUERYdDZqNVpJc2IrUlBRZ3Vk?=
 =?utf-8?B?UGltNy96Nkd1bDIxNVN5bEpsSGJlRis1VFlkOXpvMmViUGZQd0dBbFFnSHBl?=
 =?utf-8?B?LzFjTmJTR2hKR2RlRWNRVGdZa0JzS2RYUHdoclpnQXVQUWRrdlVTMXUxRWcr?=
 =?utf-8?B?WnFsNExodXhWeXJiem1Zb01reitpNkk5UENOUEp3TjlpYVM5ek50dHBNc0xy?=
 =?utf-8?B?VDZ1TUtQSHZ5QW1nMWdXekgwM05wYmRIN1N4UnlDS2hxRm43VHVYeUx5UmhE?=
 =?utf-8?Q?mg3oZNgmHewRQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N29XUldTQnpKRzBnQTdvc0JoN0I1OXFvM0lJNEl1TU4raDJLcXprNEZTTFRh?=
 =?utf-8?B?MGNmQ3BTVFZwUGNydlVzWFBjRUlhYVREb1B6NkYvc0poMVdIREVhTVJIQnlH?=
 =?utf-8?B?OUlxRGdESEhEUFhJVEdLSFo0SVpPcTlSeTRYK3k1N3ozbXlqVFcrVGhpTHhB?=
 =?utf-8?B?Nkk4WE1uajROdHU3VVQrdE5Memx6cEozNllFZWNnNnBqU0JXUGtsZEpPdEE2?=
 =?utf-8?B?WUFRVnJiTGxoSEFJWUV5akN3c1RLK2hVUGlQRUNzNHZKZmhadTBoRGY2My9p?=
 =?utf-8?B?ampGTStZNnkzWkFHSzljeVhNRGF1MURINjI1TUp2eG0rNTVJcnBiTjdSdUxR?=
 =?utf-8?B?MTJGOTl4cjlxLzRRT0NrQUhMSUNhOGdYN2k3MTBQMVZscjh3ZU9IMS9jdjFS?=
 =?utf-8?B?WEYxU3NsVGlLeVJydGlRbjFiNmltUHJya2ZwaDZZblFORjlDNmlTTTA2ZDN6?=
 =?utf-8?B?MjRxR0ZrdTRSLzZlOXZwMWgzb0NZdmRITEZSU0xKVHplYlROclB1K1RFdjNU?=
 =?utf-8?B?aVprUGdyUit1cmhZczZ2TGVCSXNNN0IwQS8wUW5WSWhSVDNvMzgxRFV3T2xT?=
 =?utf-8?B?NDgrcWpTeWJTQzlQYlB3VEVHT0FyWmhQd2dUc3l2REI3Rm14YkFhb3FiQ0pS?=
 =?utf-8?B?WXNnczVlaTJFcUdCY1RVSHRCaVFqOW4vbDRqcXlBRTU1eGJZODIyS1liOVNs?=
 =?utf-8?B?R21WdnovRDVzUnR6OEN0VXdJeUZkTVF3VDZISFcvZjZwY0tsNXlRQnJLUkQw?=
 =?utf-8?B?emNwc2hyenRlc1ljTVFyVEN6ZVZuZ0Z3OW1YaVBwRldVUW85TGcxdFJ6NTFq?=
 =?utf-8?B?bGNxSVFsb2JkQzliVThxQnpyb0JiMHNrQnFPdmVzSWFwTEVHSXl5ZU5FYnNw?=
 =?utf-8?B?cU4ybjVhZXZER2FIYmJlYVl4RDdxZ2tiK3MxdGJDMjBtMWZ5cVpCZ05DNTRM?=
 =?utf-8?B?K1psVTBtcXdKZ3FvMm1pck1CZEdjUnl4a3o5bzBXc3d3aE15Mm0xaFFYK3Bq?=
 =?utf-8?B?RXlYc1Z1RFJTSzVxTUtlb21PbmcwRFNZcElhMVlvVDIxMm5WeGZlV0N1RXdW?=
 =?utf-8?B?VlpxTFNubDEyTy9aUjZ1SElHSzZkOTk0WjFoY3ErWVFwOC96TWRKOVpZMHRO?=
 =?utf-8?B?OTVDZzdlVW9ETjA0Y21Id1FJRmU0NVNWbzE0cFc2Z21WNUkvemhVTTZUdzdi?=
 =?utf-8?B?NXd0QjIyNW83dS9ZK244emxRVjl0TEs3V0pTaURZY3pGcm5PVEwvRXZIL0RV?=
 =?utf-8?B?WHova1c1L0ZhSnRSOVpMa2kzVjBsRFIwbWtFOE9iWDBoMVNmaEs5R2Z1RlJU?=
 =?utf-8?B?MVJyWU1nZnZaQVE3V3FMK3F3M08vdjVTaGMyUTV1S3hyN3RDQmhlWVhERGhm?=
 =?utf-8?B?S09zdlNkOXZaN2YrK3QvUHhwbjB2UHZDYW9LTkJzYVAxQlRFQ3ptZGNnRWtO?=
 =?utf-8?B?aklSVmQyb29OcVllUG5ucDRTMnB1NExYWnlKeFRrMmRWUzlGTGFjUXUwMmVo?=
 =?utf-8?B?Z1AydWFqcVJqenVERFlOSVhwV0ZWdldZN2NaeVc1ZkNRcHZpdFdldHplTVFP?=
 =?utf-8?B?M0dpOFd5MTc5S0VnL3JzdjVJV3JHZnZrSnViSzRzbWp6V1JmWENYenNPZWww?=
 =?utf-8?B?cmwyZlUzNVZNL3VwVW9ia0VrbXlqek1ESGtHRC9BK292VDNZdFI1blhTOHJG?=
 =?utf-8?B?cTVpZFQvdEd3dnloZldROTRtd1dNVm9SYXNCSGdQVFM2eUpib2IzYU0reGJP?=
 =?utf-8?B?SWc0Nk5RNzFJczVzZisxNDcydU5SWkZsVkd4c08wYnVjbFlUMk0yMmxRM1Nn?=
 =?utf-8?B?Y2I1YnFPSkU2S3Btc3pjSjVmTG1ackFFWmRrdmFQMUl3OGNQdG9pY0Ntbm0z?=
 =?utf-8?B?RHZmMS9xTTN2b1lidmVhS29zbWlpelE2QkIxUksrUUlHT1hTWjBocEYvT0hM?=
 =?utf-8?B?K0x1KzYvUmJLUDJqaWROR0RMczYyd3JJSFpNNWRaNGh1UEIyeWU0cEtWRGhz?=
 =?utf-8?B?WS8ycmNZVGE1d2ZQbVhSZXdnb2ozcDFMU1J1cE9qM0pqcE05TnJNTWpIU0hE?=
 =?utf-8?B?c21CMEFMcU1CVGdmMDdqTnZBRStma3JWOUNlcjJWUjdJSi9JLzJDV3VJdUtP?=
 =?utf-8?Q?Izg5PsGIi1kc1zy0NJIZJkSUI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3756258-aee1-478d-e7c2-08dd1f4aee6b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 10:01:24.5488 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1bFlAC+2XxKb7vmdUOfiUjwvzVrEmFgxrHNkjH5H7LlUlA4OK2ObDykkByXD2KGR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8339
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

Am 18.12.24 um 07:16 schrieb Kasireddy, Vivek:
> Hi Christian,
>
>> Subject: Re: [PATCH 0/4] cover-letter: Allow MMIO regions to be exported
>> through dmabuf
>>
>>
>>> 	I will resend the patch series. I was experiencing issues with my email
>>> client, which inadvertently split the series into two separate emails.
>>
>> Alternatively I can also copy the code from the list archive and explain why
>> that doesn't work:
>>
>> +void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool
>> +revoked) {
>> +    struct vfio_pci_dma_buf *priv;
>> +    struct vfio_pci_dma_buf *tmp;
>> +
>> +    lockdep_assert_held_write(&vdev->memory_lock);
>>
>> This makes sure that the caller is holding vdev->memory_lock.
>>
>> +
>> +    list_for_each_entry_safe(priv, tmp, &vdev->dmabufs, dmabufs_elm) {
>> +        if (!dma_buf_try_get(priv->dmabuf))
>>
>> This here only works because vfio_pci_dma_buf_release() also grabs vdev-
>>> memory_lock and so we are protected against concurrent releases.
>> +            continue;
>> +        if (priv->revoked != revoked) {
>> +            dma_resv_lock(priv->dmabuf->resv, NULL);
>> +            priv->revoked = revoked;
>> +            dma_buf_move_notify(priv->dmabuf);
>> +            dma_resv_unlock(priv->dmabuf->resv);
>> +        }
>> +        dma_buf_put(priv->dmabuf);
>>
>> The problem is now that this here might drop the last reference which in turn
>> calls vfio_pci_dma_buf_release() which also tries to grab vdev-
>>> memory_lock and so results in a deadlock.
> AFAICS, vfio_pci_dma_buf_release() would not be called synchronously after the
> last reference is dropped by dma_buf_put(). This is because fput(), which is called
> by dma_buf_put() triggers f_op->release() asynchronously; therefore, a deadlock
> is unlikely to occur in this scenario, unless I am overlooking something.

My recollection is that the f_op->release handler is only called 
asynchronously if fput() was issued in interrupt context.

But could be that this information is outdated.

Regards,
Christian.

>
> Thanks,
> Vivek
>
>> +    }
>> +}
>>
>> This pattern was suggested multiple times and I had to rejected it every time
>> because the whole idea is just fundamentally broken.
>>
>> It's really astonishing how people always come up with the same broken
>> pattern.
>>
>> Regards,
>> Christian.
>>
>>
>>
>>
>>
>>
>>
>> 		Apart from that I have to reject the adding of
>> dma_buf_try_get(), that is clearly not something we should do.
>>
>>
>>
>> 	Understood. It appears that Vivek has confirmed that his v2 has
>> resolved the issue. I will follow up with him to determine if he plans to
>> resume his patch, and if so, I will apply my last patch on top of his updated
>> patch series
>>
>> 	Thanks,
>> 	Wei Lin
>>
>>
>> 		Thanks,
>> 		Christian.
>>
>>
>>
>>

