Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7594AC99BFA
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 02:31:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86A5310E4FA;
	Tue,  2 Dec 2025 01:31:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="sQKD/pcE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010061.outbound.protection.outlook.com
 [52.101.193.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8589F10E4FA
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 01:31:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D7OCbHiNfC/m7/utyjSCnYH53K4kk+eFCz1VFBBeGNnuGPub7ueBVuVqLtL9vA47zEK+bfLdB14TxYLwlFsi8dluwgc7kM6+3z6YpLyMD6sjsdLYGAsoMpX1OUTx4UdTiARgDmqj/qGIgf2i0zP87WTWsdsN7kj403RRyu5t7/4AffasF25W7OserEucPvuh8PClHFyjD/Jy9HhhCi9QNGentesBcNTD4j+J/Ax84Z+zIY46HNxyF9mQW5Yj0ZpoSi6JP883BlRaodWdE+j8g9HyztO1Sg666mQd0ycC8TCznEsJyfFGGQr1GgQJhZDhK0kvP+Jz7FNhf5hMXcSjWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xaVvbfIm4KTi/bT2nmqW/tzXl4LVilsCKv3vpm/qRDk=;
 b=b3M3jrIkPOsd0glSd15DrpMBECcgmbDJhEXha8js8+LLg7Rtx5Db38JLmpCMouO0750ICKcPBOCRGcO0rDuXWalClfIZV4fsrlR7KqfAtgl2WNgGULQ3SOz171D7x3yNs9joy+e301v34vC60SZdKIIKe6whjriL+BTFoqpTaiasbYQ29G+bKBO1lCGuQpUMwPfNnpWhQSkFsFd7J3dqV/BSIozJ/BeBgCyytLVczcV0MQBpeLH5JDnSPIHuDshlmPusO3LvhU3amB5Z0paQaLMzpA5sDxxtCwDLnIDAIU7p+KMPgIb2Y+lTHep2CKKL6nGhOdZgmxT2FBCdFldsnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xaVvbfIm4KTi/bT2nmqW/tzXl4LVilsCKv3vpm/qRDk=;
 b=sQKD/pcER5ezXB7B2MPEjvmCOuMJLMtOdXnMuH5J0emeN7eZSZHHOs0gEuAikSX9mij5bR6uRFJk/73ZRG4fFf1lafSREe4ha2jAiHJqvJcMAz2SaiEn9NMFbrJyK58EKg81OXr/iIamLhiUu23m7lqr0oWBDvn90ePTEHF7ZWayBqHqdU2rEwhpTOpDepw+JOtvHz879mHmlEdHg+kaS5jHsL5yXjAtC5jHjd+Nl8McDHGUjC3hylct+h+Fh+/ZSjQvsEAUBAi7UOoQoLWrmL6BsUaZeaF/ju4b2fWBB+EUfaCsGeRWCmGsXmjIjBUO9MV3cn2bbH5xMGvJlgtoUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 BN7PPFDE2ACDA69.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6e6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 01:31:41 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%3]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 01:31:41 +0000
Message-ID: <0414eb13-77ae-4c41-b32f-3ae637e5da48@nvidia.com>
Date: Tue, 2 Dec 2025 12:31:34 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/6] Remove device private pages from physical address
 space
To: Matthew Wilcox <willy@infradead.org>
Cc: linux-mm@kvack.org, balbirs@nvidia.com, matthew.brost@intel.com,
 akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, david@redhat.com, ziy@nvidia.com,
 apopple@nvidia.com, lorenzo.stoakes@oracle.com, lyude@redhat.com,
 dakr@kernel.org, airlied@gmail.com, simona@ffwll.ch, rcampbell@nvidia.com,
 mpenttil@redhat.com, jgg@nvidia.com
References: <20251128044146.80050-1-jniethe@nvidia.com>
 <aSm7NTtNfGcXbuwr@casper.infradead.org>
Content-Language: en-US
From: Jordan Niethe <jniethe@nvidia.com>
In-Reply-To: <aSm7NTtNfGcXbuwr@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0092.namprd03.prod.outlook.com
 (2603:10b6:a03:333::7) To DM4PR12MB9072.namprd12.prod.outlook.com
 (2603:10b6:8:be::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|BN7PPFDE2ACDA69:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cf05f16-13e5-417c-b315-08de31428b89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?enNTbEYwVnY5cmw3OHA2eVB1TnZpeG9FU2dPUStjRCtmbGtXQzEwQUNKYWVV?=
 =?utf-8?B?SkUrN21VeTRxM2xqckg1VEl5a0VpOXlraHZpNjdIZFA3MmlqbEJTUlJKWFpS?=
 =?utf-8?B?VVhhRlhtM1RFMmYxdjZBWGxTU0tBeCtYM2FpWVJYejdqeFk4clVVU3RncHlZ?=
 =?utf-8?B?RkgydkhIa3h5cGZCdmQxdERSSWlSRWVZYVdzYTZvUFQ3dXozNE5jdEVXOHFZ?=
 =?utf-8?B?N1dERHR4eHVGOGZjYXNaQ2hCbFQvbmNWM0hSeVRySVIrcUNHdFZKM2NsY1FE?=
 =?utf-8?B?WG5WWFJDYzV0c0l1RFk0K2lxMjB3YWZac3FqN0x4NnlzdG92Tk42R1hHdTU1?=
 =?utf-8?B?RExlWm9TR1lKYjhCby8rZDJIelRrdmJUYVZNNFhjeVpRNDVqcnU3MUI2dFA5?=
 =?utf-8?B?WENNcElVOHB4Zy92V2gycVIrb2tnQTdWbjZnWFdwL01LZDVpa09YZjJhS0l0?=
 =?utf-8?B?bmU4OGJmK1lGMURPVUp0Unp0YmRoakZPdFhTa0RlTGRrMTlaMG0zd0k1ZWRF?=
 =?utf-8?B?dnJ2Q0FyQldSd3I0dzE2RVlDOEhwUVdSbzF4dmRicDRkRXlwbzd0V1N6RitO?=
 =?utf-8?B?NG9DbENpUmFBUm5NS2IvNHhwOU1mVzNqdFRkUkRra0hFQUIxOW5pQzVmaUFq?=
 =?utf-8?B?QmF5dGpiNnEzdnhqUU1Tb1BwWlkrc0xLcmJKQWcvaVh0NldRWDN1dGN3bjNp?=
 =?utf-8?B?NTFLaXdqL1JEdnE4MTU4RWRRbEdITmNJNElhZGxEVWMwOUNXc21BU3J0blN1?=
 =?utf-8?B?TnJwTEtmdGhDTFdUZWhWS2dIWldYT2x4MmZnejBQbzdJblQ0K3FNVzdGQXJn?=
 =?utf-8?B?b1J3YkFrN2prVWc5OEtjNFdPRlM0bjNNSzBpL3Z3azNLa01GeHpsZVJiSmwy?=
 =?utf-8?B?T3V6eE81N2IxcEtKV1ZmSGZwN3dyWHhaNjNPemRTemhzSStQd1dDamp3TFY3?=
 =?utf-8?B?U1RyQUJVbk0vaUY4cXZOMWlqVmFEcFA2RXBuemFydkh0a09VOFNlaXVxbmJQ?=
 =?utf-8?B?N2ZPUlNnYTFRcW5HbXJYbGcrVmFoSGgzSWhnS05idDE2RzZiYWlwSW12QWhC?=
 =?utf-8?B?K3hJTzRHUnNFVGhhQ2pianpXaUhZLzVEWlVOMmJpOEVZODQreXYwbmhkcFlj?=
 =?utf-8?B?UkxpZWh2L3Zqc3lGa0NrdEZYRHIwcS9LSWlIQjdDU2E3NDRKRHVUd091cXBD?=
 =?utf-8?B?cWJzbGJNcEQ5aVFzQWIrV0hSS1hwUnNTRG1Hb0Y4S0IxRTdRc0JmYk9aUVlS?=
 =?utf-8?B?ekYvd3R5SUQ3cmRTZVBhSTkra0xkRGdjZkRKWklGa3ZLbDB5YkRXVzFGeG5N?=
 =?utf-8?B?YWRLVFQ4KytKNVVjOEN3em9MM29ORmRoajRXOEZsYitxa0hYdUhwQWhoK3Q3?=
 =?utf-8?B?RVJEbUxjZ3pQS05nVzlGVysvTi8yL2YrSGlzeTNiT0xOTzJFR0RieWpvTWlM?=
 =?utf-8?B?Z1I4WDVibXVWeks5eG1XZ2hkWG84Nk5NNlpZekRiTGs1M3NXS3ozdFBqeFpi?=
 =?utf-8?B?c3NKR08vU0g5aHpQOFRzY3FaU3Bibk9qMmx6eWpiWElzSkhrd09jb3ZxUjda?=
 =?utf-8?B?NnlJOHFaU0taby9rUzAycVlsQjR6ZnY0aGFQcHdMV1ZSYmhEOVg5dHY5bWVK?=
 =?utf-8?B?WWduVElUdkhSUy8wZWwxTk9aUG1MRzNRSDNrSVI1UVBGc1gyaklkWC9uam9F?=
 =?utf-8?B?NWRobUROckJWZHpmWXFTWEw3MVRVYWVVNlhETWIwV2NPYXplNjh5NmpLRVEy?=
 =?utf-8?B?UjkwN0VnYTROUzkyd0ZzRDg4VjFINkFPckRKUGNoejJxb05qMXp0Y2VrVzVV?=
 =?utf-8?B?ZWgxc0hVZlFRRDVmOWZBMWRqME5Ec3cweklEMUdUWTZyaGlEMVVKbHNubG5i?=
 =?utf-8?B?RDBqSW44Z2YybXJYTzN6aTZjRk1Qa1VYRWRrd0hvanE5QW1iM0dwTTRCZ0Uw?=
 =?utf-8?Q?gYDrGyKTKrU7Gr3upgUNFwWYw65zbF7q?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB9072.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mm5BOEhSREthV2VVd2JMV1J4Z2duK3J1d2VGUjlWY2ZKSVVnMUlkc2dMOXpW?=
 =?utf-8?B?ajRtNmh4djhqMkJ5UnJBbk9LZ3UrV2hLY2FLUWJLeFhJc3dYZ3JRTzlmdHJQ?=
 =?utf-8?B?dlZETDRzM0c0OVZUenNSbEh1bEUrZ2NMSXpoQWsxMEloUXllUzNnN1lzVXBE?=
 =?utf-8?B?dGZ6dkxpRnh1Q1BpN2pLZ0c5bHVSL1h2SlZ2dnpveXJLek9NWWtqWXlyNmI5?=
 =?utf-8?B?eTRjNURISE9BbERaK0ZoUzhPSnRtTVZJVUtyTTVXaWhpRTlKZGxCOUVGSk50?=
 =?utf-8?B?Y3E1aE5yQjVDM3hyOVdDUWNKaDNGellBUFdvVUlHcERTeTZkTkN5dEpETlF5?=
 =?utf-8?B?bmxtOEVzMzlzKzNwMGNKQnY5cmE3NnBFclVLQ3B4TjQ4QWhmOC9Hd3FTMyt6?=
 =?utf-8?B?c3Y3VHM2dUdPZWEwazV6WkhEUjlTQUV2UmFGM3Jwbm00d3pPWlJmT2syMzRt?=
 =?utf-8?B?d0FDbU5TTTJiaitmc3VzRHgrKzQ5YnJZTDBhZzBsWEtPZnlibGxjZSsxUXJS?=
 =?utf-8?B?SGxHZWxsN2tDbFFhSFB5QUtlTE9HTVNxMW5zL1I2VENIWVcwQU1VOVM3T1Iw?=
 =?utf-8?B?S1NrS0prdkFqLzNwNVRuMXZTWFlDT3hQNGE1TlVnVHIxSWRsaGxvRVF1aWdU?=
 =?utf-8?B?c1BkMUgyRnh1VWtkQm9GM0JBVENkZTFpakZBTFk2cGFaTHNsWUgvZUlZazZt?=
 =?utf-8?B?d3NVeGdQTjd2Tk1UKzFlSkNzZFhyVitIRnBKbk13VFZEUzVDdk1Fci9FNUhz?=
 =?utf-8?B?WjUzUW5wUHJORncxODhMYXdjbm0vWmc5d3VaLzNkNC9aN1F2YlJ6QnhZd3RF?=
 =?utf-8?B?dUpOdXhtUFRCUW1LaGZaN0doUVRKQ21YODZRL05UT1gvM3lJMEgrWTUzb2FY?=
 =?utf-8?B?WDd4alJ4RW14OTdrbnZwQ1NBb0xIRzk1TjVtMitlY01sd0FLUDNMZ1U2cUZh?=
 =?utf-8?B?Njg2UmFkRmhWRi9OOEgrNG1qdmxhaFlISTFudHh2a0J4WEg5TlVyMC9VaEVr?=
 =?utf-8?B?dDljMXZhQW5lanhMNUdFZFpNRklNWFI4L3ROdjBpZ0k2WXRveXRNcTNkN05V?=
 =?utf-8?B?Rm02RWlJT3o5OWhDV0pjTWt6djR0d29SU3lBSThKQU56VTR6Q2xGRjgwdTUv?=
 =?utf-8?B?M0FvZWtWcUd1YUpiSE1URDNoL2RDdnBZTjl0MFNLUFhmSGxJNlpzcFVHZ25l?=
 =?utf-8?B?d0FTbjJXenhPRXB5Nm1ZaWdvYlpQMFYvNlZFTVJSc3hLRlR6T25aOHdDNnRm?=
 =?utf-8?B?NVF0bjd0UTdQcldQK0NBTDRRc0xmRFc5Nm5TN2Y1MWk4MnFLM1ZHQ0lEVTV5?=
 =?utf-8?B?MEtlWHVZSW5DMkMvSVNsZXlPWlMwK1NnZEVVaWplbWpOazM0NCt3UkREdjNE?=
 =?utf-8?B?dm1ZbE5HeHZuejdOamZJUTl2WHI4MkZhVGFmQTBaL2FjOVNBWVM2TGlLQzU0?=
 =?utf-8?B?SkR3aTl6aERUbUo4T0dPVWlpZm1CcC80SFFMaTlOK2pkSHlhWW5JcWVPcmhS?=
 =?utf-8?B?ZG5yeW9IWW5YeE1tTURUcnE1V1p5Y0RtYkNVSy9ZQm9WT1k3cHM2TTlwT2dY?=
 =?utf-8?B?YmU0QS9Ta0NxRFd4bmJiaFM0UHpvWjY5R1pmZ3U5OUE4ZWNNVmFDVjRYU2dP?=
 =?utf-8?B?clZnYkx2YXFTKzZKZ1h3UW10bmRXWDFSQzIxSzJ2RGNoQmZGNWVYVE5wMVNo?=
 =?utf-8?B?SVp4UzBnM0s5eUNyYWtMM1ZsczdnRzZpQUl0cEtUK2hlUnZRdjB5UlgrUkFl?=
 =?utf-8?B?dTF0bHVVVlArR0hHQzJhN0R4NkVxR3Q2dUdIUzlrWW5vZkd2VmpONXBDazNC?=
 =?utf-8?B?bGZ6N0NaVThVdU9DVmV6VTBhOWprMXI4by9XbEliMERxQkRaUE03U0RDeFJU?=
 =?utf-8?B?NGhSR3BsSTNqSGd4TlpZWEc4K0Z4czU4bXB1NG9CcStkWFZaVnpjZWllV2Rl?=
 =?utf-8?B?SmlkdmNaNEp1dDFjWllxdnNQREcyTjdjWVpaQnFleTJ6TVRwbDl3Q3BPUlNh?=
 =?utf-8?B?Zk5YZ2lZTFF6Q0xpaUs5NDE5bHkxVm9hMTBqVWxRYkd0M2xmWnJ6b0xBWVk0?=
 =?utf-8?B?aE5DVm1EdCtveUFmUlhHY24yOUtxbVVOYThJZmRUdVVVeitRQ3U1Z1FOVEVR?=
 =?utf-8?Q?s5lfZMKBPouFOBDhQ2dyXHcZq?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cf05f16-13e5-417c-b315-08de31428b89
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 01:31:41.3672 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: II8DsFFDqG9zPjZqLVm19z1hSABAzBRoLR8DZoT5vlwF9dGKDyfgB3YWhZZv9ruauRn3uuwmzOljGbyHulMLUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFDE2ACDA69
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

Hi,

On 29/11/25 02:09, Matthew Wilcox wrote:
> On Fri, Nov 28, 2025 at 03:41:40PM +1100, Jordan Niethe wrote:
>> A consequence of placing the device private pages outside of the
>> physical address space is that they no longer have a PFN. However, it is
>> still necessary to be able to look up a corresponding device private
>> page from a device private PTE entry, which means that we still require
>> some way to index into this device private address space. This leads to
>> the idea of a device private PFN. This is like a PFN but instead of
> 
> Don't call it a "device private PFN".  That's going to lead to
> confusion.  Device private index?  Device memory index?

Sure, I think 'device memory index' is fine. What I was trying to
express with 'device private PFN' here is that each index into device
memory still represents a PAGE_SIZE region, but I agree it leads to
further confusion.

Thanks,
Jordan.

> 
>> By removing the device private pages from the physical address space,
>> this RFC also opens up the possibility to moving away from tracking
>> device private memory using struct pages in the future. This is
>> desirable as on systems with large amounts of memory these device
>> private struct pages use a signifiant amount of memory and take a
>> significant amount of time to initialize.
> 
> I did tell Jerome he was making a huge mistake with his design, but
> he forced it in anyway.

