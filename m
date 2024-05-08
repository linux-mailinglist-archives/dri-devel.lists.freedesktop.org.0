Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8068BF3F0
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 03:11:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87606112A48;
	Wed,  8 May 2024 01:11:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MovCKT9Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 551BC112776;
 Wed,  8 May 2024 01:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715130701; x=1746666701;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=H/l7jxdB6l3NqlJXr8T7DpIYyBMS7FihfEy1HVvRQGk=;
 b=MovCKT9ZYAfSvtgHeDOWzkAhU/F0brj4yIOYtOtzBpNvomS3q5r1nm+y
 8yF7DDpn+gCF4ZyCrX61gdUYnZc3IoidyhVyigYC4/oim3p0vzPE4hI0c
 xQpQ/RTENKtQ16YWr4s96qYsDtIE4jclx1Flexi3NW3qn6YXglg3n3pnh
 6N5EVuMwmtuHDLkylh7xHe5qjjJtfWjms2TFPkE+Mq3Prrdg/Iz4BB9GC
 MoM53Wb2w/6+vkJjVciQqS2jRv0Uflau7TGikoMAIylTqRETt6MhuMHLB
 jCXSekZjfJsK3AeVWmwfA0QIxIOd5NrYl1AjCHq03nZrdvO5AlJlOfrvx A==;
X-CSE-ConnectionGUID: OrKR9iJWSjCTcO4HgLXk4A==
X-CSE-MsgGUID: gTpxTD+aTn6xOKFtu/nApA==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="33474248"
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; d="scan'208";a="33474248"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 18:11:40 -0700
X-CSE-ConnectionGUID: 87dy4Q6fSdOwRyAKvyYsGw==
X-CSE-MsgGUID: LXrJ7wwfQkW9+K48Q5bStQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; d="scan'208";a="33538927"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 May 2024 18:11:40 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 7 May 2024 18:11:39 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 7 May 2024 18:11:38 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 7 May 2024 18:11:38 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 7 May 2024 18:11:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LlcbirfFiqoAwNyrOywb185FInVDpi734rhokhivzypQbP1XU5FjyP5lPEsJeJ5Ro4XwR4J0VgIAmKz6BklkPrKtrAf2sufuAZuIlo1O/Bj4jLJEHMbEUCcZXUq9hHjnsWPp4Y0imy/HWeKgx838VZpoE0OZ0kg6wJP93hFpb7Bq7ydXvz4egD0a87PcpelrmyPGjDSLD3jnFGrRvT7UpsvttvZ7jNmAHHMhzU86WJvXrhDHq46apwQ6uSF8Q1H8foT4pYmiC55V+wK9kmTOPGqqHrMxKgaLfIZOcl/enmWu114TnxOy+2piYiINLXMHVedQBzwy8ojvdPwqUMg+xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sob2Nw0rQuHNw7KTZ1Y6IasVgCD5Cr4/ND+wafiIk80=;
 b=CVzwCJbOHDKvYSUrGH8CT0tjOeS0tM6ofu9HEXSCzrqNJ+oe1g3S9FOTjO5/zlRC+azRBhhbo5quCJra3b4zGS8/vu38TemZMRt3Lgby12pKy4r61vhW4q6h9nvR98nuLc/dsgCgBHb1teH+DHrI1Jb82ABc9N1USWcBvDqeIRVgYmbspr6Mp44qyR5dpeDU7RuO5/hlEoHlvVyg8MNky3MOoMv79zIE4N0zQAlQSSvKnii9//vVTPyGUE5ombfXs9F2jgCcHnbw3VEw9cVYTWhRyL6vZfNnJ3yoJ5I0LclP2i6Dfw4ruK6UvimQnrWaTwVAKxkpp9eRJ+UzgdzlYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by MN0PR11MB6111.namprd11.prod.outlook.com (2603:10b6:208:3cd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.45; Wed, 8 May
 2024 01:11:35 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::24f2:8bf0:3dbd:dc8c]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::24f2:8bf0:3dbd:dc8c%3]) with mapi id 15.20.7544.041; Wed, 8 May 2024
 01:11:35 +0000
Date: Tue, 7 May 2024 18:11:29 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Tvrtko Ursulin <tursulin@ursulin.net>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v3 6/6] drm/xe/client: Print runtime to fdinfo
Message-ID: <ZjrRQaIKmMtooCH9@orsosgc001>
References: <20240507224510.442971-1-lucas.demarchi@intel.com>
 <20240507224510.442971-7-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240507224510.442971-7-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR03CA0323.namprd03.prod.outlook.com
 (2603:10b6:303:dd::28) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|MN0PR11MB6111:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ff869e4-8387-4289-46c5-08dc6efbcdeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d3YxUHFSODNjQ1llSUJCVXVZWUVxQlhZbGdrMkFBRDNsZk82WWphS2ZJSkZG?=
 =?utf-8?B?czBaQmsxbVJQVkVvYVZBVUd6MHJ1SmJaQ29TL0JZQW05cGo4bjBqZUJucFlx?=
 =?utf-8?B?RGUzTmJsc1loTWdYdWc3SHFOOENNSDdhcy9UMmdjY0RXZWxYbE5GTGJWNWhV?=
 =?utf-8?B?ZTBpdm5XUG1nZkJTWTRyVlNnR0UwMXV5MDh5SXBlYnRqT0RWK0lCZ3VlckEx?=
 =?utf-8?B?OW0xeHJIM0xMVkZ3R2V5ZmdmQ09uczZwRXI5RE96eFBUKzlINml5TFlpSldR?=
 =?utf-8?B?WGlKcnFWUTFocDI3RlozMU0vbVo2V0t6em52bWJQbHZQWFVia0NyYm9USmJ5?=
 =?utf-8?B?LzQvQXZDVFhId2h0YWZIamlYYVVzT0d3VWJudEhTNGVTaWxFU2o0Kzk0c0lT?=
 =?utf-8?B?WVZOSDJYTlc1UVdNV0hLeG1JajRZR3hTdkljM0p6ZWJQZUJsTzE1Y3NmRWVI?=
 =?utf-8?B?dVd2dGxUWWpJOVFteThQS1U4SWxXakthSStYUS90cVdnOXVzOHc4TEZpSktr?=
 =?utf-8?B?dnJEeEg0cmd4bWwvVm41cFNrd0Rycm9KQndkWFYzc0cyclRMd3JscUh5RHM2?=
 =?utf-8?B?RUhnRGhjNjRDSkozRHErRDRmY2pLQUI2UzUyR0VCeTNsOWlTblpNdWlUUjBq?=
 =?utf-8?B?dVRzOEF4bjZoUVVEWm9VM1p1M2JnL2s4Wk9JdUZONkNpYUNUVWpuVTdNT0o5?=
 =?utf-8?B?cVAvbi9lc1lFWU5vejFSSExpNWlMamNyTXhMK2tPZkxYNWZnYzBneS9lVjUz?=
 =?utf-8?B?U081YlNJQ3RsT1VwemxrcG1aWFRNUG5uYzF3UzlCVnZwZUk5Z2RLVXpZaHYz?=
 =?utf-8?B?bG8yR2RGdGU2MDg0WHJGdTBSSjJjbGtVeVVaZlFTNjMrRno3WFpTMHlRVlMz?=
 =?utf-8?B?S0t2czk3aG1aNW9RNnpFYnY0OE1INlFCUnh2cE1jK2tEYzUycWd6ZkFRUFBj?=
 =?utf-8?B?NWlyRVlJc09pRmxmbWpPdFErVWZ1Z1BNME9GUHNGTXdReXZYQkRQSTY0UDlR?=
 =?utf-8?B?TDVSWkVjb25ySGxWWFhxQ0w2ZjlPTldoYXJ3K29WWjN4Q2NoRWhiTDN0MVVa?=
 =?utf-8?B?dFRQYkYvZldEUTNPNVpLdnAzQVJjQnZhbDZJazJHOHkwRnJ2SW8rUzZnNkNN?=
 =?utf-8?B?bzhraHRyUEJ0aFlOSTNyanNHeHlmdVdiRWNUUDZKeEpOMHRIMmNDMnhDOGdr?=
 =?utf-8?B?LzVBWTJIYTRMZStSOTZYNnVScXhZMHNZdXBaOENKU1Bwak5JU3o5azVPYzhK?=
 =?utf-8?B?NzcyYWt0MW1zS1gvYXEyQW5OV0lmTXg3MERTZVhIdXVDcCt6R3BhT1hETVlW?=
 =?utf-8?B?c0poVHg3MFBNL3YzUS90M1VhY0wvUTNjbGV2K2dYVEVzQmlJYlcxR0VXTkhV?=
 =?utf-8?B?M3hmSTJsSzdTaHFLM0QwRUJ4TWlpWXROekd6QmNndFk2OE8rcWt3ZkM0TGQz?=
 =?utf-8?B?eXR2ZTBwNVNTeGJYREovK0NnbDdrNTZRTXV4aDBubklyT1FiUzU5Yk15WnQ5?=
 =?utf-8?B?M1RhQkhiS0RLbmhCbEZSRUZSRFdmeXBFYWlBcnVnTmRTOXZHUk5qY05IVlVi?=
 =?utf-8?B?MUhYU3FkSnY3bjl0QVYrYjFSRlEvcHZ0YlVZNFNwOTJjMS8xYWtFSkFzbUdp?=
 =?utf-8?B?bHNtZklZdzBOWTZSVzg4MHNUVUZQNVNDWHpiaTdBNHkxVnJOWFJmZnAxeDdo?=
 =?utf-8?B?N053RzBBaGNWMUs1eks3bERrSmk2aE40akJ1TElPZlAwQ3VSbDloZy93PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmhScVFwZzFtb2dnLzZabWRVQVZwWHFJTFVaeWtaU29PVDdxRzZ5dS9TbG5m?=
 =?utf-8?B?K1AvWE00dkMrN3dtcmdCbm9nbU9EaGNoRnJIZGtPajg1aWFvZCsxcXRxQUMw?=
 =?utf-8?B?VzBNcGo2QnA4SU1wc2tWdDQ4Mktoa0Ivb2I1VHRCSWlPemlsbnl3S3hxeW8r?=
 =?utf-8?B?bG5hd3RDdmpwTERmYnRpZ0hQdHBpSjNhWis2RE5ZVm8vSXcvU21sMHpITW1E?=
 =?utf-8?B?Vm50YnM3Q2Rrb3hEVnJWblowRm1RMGZDRXlDZStlV2hUb3IyNC84TitSVG5m?=
 =?utf-8?B?SmdrTXZnQy9EL1pPY2JWU0lEZGtSOWFtZzBoaXRNRmtiZFk5RUtESitUSEpm?=
 =?utf-8?B?UUpJc2VwdldKMSthWGd1a1B6MTduTzZ2YUlqYlF1U09SVEx2WGZJaGN3ZzNm?=
 =?utf-8?B?THpIYW84ak82QiszaTFZWUlGQnNhUGZPT1RuQXcyZFBONmdFRE1tVHJVZ3dP?=
 =?utf-8?B?Vi9UTEFtaFF3Vy85SHBibGMrYjZxYkEvbDhPZXZPZG8vUG1PSUp3Rk5wTzI0?=
 =?utf-8?B?SU9HdzJDS05BNXhyOW1JR0NveVNzTS9CTE9UV3JmRTF2cFlnaHloU2Voei85?=
 =?utf-8?B?TkFaK3dNelNhNVIyemg5RnR6TjNienNaeHNXcXVIT1ZEbTZmQnNLbE10UnJJ?=
 =?utf-8?B?WmJ3M2pRbktxNlNwcWtjeGFWTERqU3BtcmQ0MG80dThLN1B1ZG9handUNHpv?=
 =?utf-8?B?L0tzMFNKa2Q1SDJ6bEdkT0Y1Mm10TUdNcVcrZ1FxejNvUVc3anJGdExaNVRJ?=
 =?utf-8?B?dzZpL3c1RUJWbEtPbWlSbkZTUDJjMFFBcUx3cVl4THVXVmVjVXhpK21oL216?=
 =?utf-8?B?aytOcGZRWDZ3WnBQSERhenl3ckQxK0ZDSkZXS09VVzE1bHRJMFdXeGpEMW8v?=
 =?utf-8?B?dXhFVTlINDY5eC9Pa0VoSCtMbjVVMzltaHRacGVHSkJ4SWpDWjcveWJJTlZX?=
 =?utf-8?B?RUR2RTJtaTA3VzJORDBCQklLU0ZpQWNDOWVPNFk5RFVaaEZIbTdSclNWQnQ0?=
 =?utf-8?B?akxVVmhkbUllTUFxdWZiT0xtVWJSQ2w5VXRyeHFVOEgvRHB1elZ1OEpzV2F6?=
 =?utf-8?B?WVZGbFNsWGlTd3d5cmU2TUpzRWpXUlc4c05UWDZNcHhkVy9IU29Walp3Z1I1?=
 =?utf-8?B?S2lNRUVtdmpYZHB4bUVIdTVlZUJWUlZuVy9jYmVGV0N6SnIySkVpdnduTnhh?=
 =?utf-8?B?T1FWTTRmdUtVTkVwS091Q1FIV2lMa2ZQRVFudmc5ZzlNaUlPZFhvd2pEOHBT?=
 =?utf-8?B?Nk0ya1hXMklUYndVSm9NbGJra2tMVjA1MU1qTnh5V2dqTXlHQjlXTXBuMDJG?=
 =?utf-8?B?eGNjejR0SDN1Zm5yZmNUMFVMM0thVlh4TGZYeGszYUJlSTFlanlpTFZoMXVm?=
 =?utf-8?B?WlN3a0Vsa3FMTkZDNEJoWVc0dnR4ZEJLWEsvRHRteC9oM3FQclh3ckdLMnlW?=
 =?utf-8?B?dmhRdXBQdURQdFdsd3ZTOTgwenBZRGdrRXU0ZEwrTjhSRnNaWHNzdEdyYjRJ?=
 =?utf-8?B?YXlpemIzcUNrdEJqVnVZSHdZaWV0V2pQVUVma1RVanBSN3BKYVdOVkpsb1I5?=
 =?utf-8?B?V3BYbEtmdXh5SGpveDRUNi9YaVZGQUkrcjNIeWNOdTRtc05XWkJacHFJdm1P?=
 =?utf-8?B?aXdDS2tjSExxL3ZHb3d6WEs4TU9FeElveVJJUlNFWTdRdGRtNkt0MndoRlM0?=
 =?utf-8?B?MldMempldHkxYmlRNWNGQlR2RHZxRzJua3FZTmpVTC8rQVlEZXRLSDg5UjZl?=
 =?utf-8?B?TnlwNll3cHl3aFZocUR4M1BJWWYzTXdMVlZGaEZNWWk5UzRnSXB6ek5qYk9v?=
 =?utf-8?B?SXI2K1cyaTVpU0F4SUMvdU90ZUdiWjFHZkhWS2NXbyt6OVRWaWM4WkFjeTBp?=
 =?utf-8?B?TWRPOG1MRnVzaGZiV1lYdE13ZkNNRGQ0Qm11c1hJOWsrMVh6eWpZSVo1K1d6?=
 =?utf-8?B?bGlpNWc4M1AvTm1BL3BhbUFuckhFd1ZnZWFDRGtZRWRzZExkL3FVUW5BRklM?=
 =?utf-8?B?aWRtQ3JkYlptMEw5cU1JdWxRcFFwUmxZMVFOeHJZN040R0VmejFhak9yWk5q?=
 =?utf-8?B?MnA3RUlhK1NSdjJqZjFNemlXeHNBN3NIMi90czRaWEcxZUxjY3JjWEZJdm1t?=
 =?utf-8?B?UjJpL0c1NHYzV2o1anJkS3B1ZWw4MHZENEpaaHBCU0lBYVhjZDE1UU9pNGJO?=
 =?utf-8?Q?tyTDJ0C96P1yxUwvz3+vmmk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ff869e4-8387-4289-46c5-08dc6efbcdeb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2024 01:11:35.3162 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G4kJasfonlBwg6+bfJeHCVzpxrJBRPyhhyvrDG2vaxnaON9/zs479qXE7uPFHZDaULy8pAcZwFCdlaIWwhg9onhBlUF4iUMa5YNmapVA6VE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6111
X-OriginatorOrg: intel.com
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

On Tue, May 07, 2024 at 03:45:10PM -0700, Lucas De Marchi wrote:
>Print the accumulated runtime for client when printing fdinfo.
>Each time a query is done it first does 2 things:
>
>1) loop through all the exec queues for the current client and
>   accumulate the runtime, per engine class. CTX_TIMESTAMP is used for
>   that, being read from the context image.
>
>2) Read a "GPU timestamp" that can be used for considering "how much GPU
>   time has passed" and that has the same unit/refclock as the one
>   recording the runtime. RING_TIMESTAMP is used for that via MMIO.
>
>Since for all current platforms RING_TIMESTAMP follows the same
>refclock, just read it once, using any first engine.
>
>This is exported to userspace as 2 numbers in fdinfo:
>
>	drm-cycles-<class>: <RUNTIME>
>	drm-total-cycles-<class>: <TIMESTAMP>
>
>Userspace is expected to collect at least 2 samples, which allows to
>know the client engine busyness as per:
>
>		    RUNTIME1 - RUNTIME0
>	busyness = ---------------------
>			  T1 - T0
>
>Another thing to point out is that it's expected that userspace will
>read any 2 samples every few seconds.  Given the update frequency of the
>counters involved and that CTX_TIMESTAMP is 32-bits, the counter for
>each exec_queue can wrap around (assuming 100% utilization) after ~200s.
>The wraparound is not perceived by userspace since it's just accumulated
>for all the exec_queues in a 64-bit counter), but the measurement will
>not be accurate if the samples are too far apart.
>
>This could be mitigated by adding a workqueue to accumulate the counters
>every so often, but it's additional complexity for something that is
>done already by userspace every few seconds in tools like gputop (from
>igt), htop, nvtop, etc with none of them really defaulting to 1 sample
>per minute or more.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> Documentation/gpu/drm-usage-stats.rst       |  16 ++-
> Documentation/gpu/xe/index.rst              |   1 +
> Documentation/gpu/xe/xe-drm-usage-stats.rst |  10 ++
> drivers/gpu/drm/xe/xe_drm_client.c          | 136 +++++++++++++++++++-
> 4 files changed, 160 insertions(+), 3 deletions(-)
> create mode 100644 Documentation/gpu/xe/xe-drm-usage-stats.rst
>
>diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
>index 6dc299343b48..421766289b78 100644
>--- a/Documentation/gpu/drm-usage-stats.rst
>+++ b/Documentation/gpu/drm-usage-stats.rst
>@@ -112,6 +112,17 @@ larger value within a reasonable period. Upon observing a value lower than what
> was previously read, userspace is expected to stay with that larger previous
> value until a monotonic update is seen.
>
>+- drm-total-cycles-<keystr>: <uint>
>+
>+Engine identifier string must be the same as the one specified in the
>+drm-cycles-<keystr> tag and shall contain the total number cycles for the given
>+engine.
>+
>+This is a timestamp in GPU unspecified unit that matches the update rate
>+of drm-cycles-<keystr>. For drivers that implement this interface, the engine
>+utilization can be calculated entirely on the GPU clock domain, without
>+considering the CPU sleep time between 2 samples.
>+
> - drm-maxfreq-<keystr>: <uint> [Hz|MHz|KHz]
>
> Engine identifier string must be the same as the one specified in the
>@@ -168,5 +179,6 @@ be documented above and where possible, aligned with other drivers.
> Driver specific implementations
> -------------------------------
>
>-:ref:`i915-usage-stats`
>-:ref:`panfrost-usage-stats`
>+* :ref:`i915-usage-stats`
>+* :ref:`panfrost-usage-stats`
>+* :ref:`xe-usage-stats`
>diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
>index c224ecaee81e..3f07aa3b5432 100644
>--- a/Documentation/gpu/xe/index.rst
>+++ b/Documentation/gpu/xe/index.rst
>@@ -23,3 +23,4 @@ DG2, etc is provided to prototype the driver.
>    xe_firmware
>    xe_tile
>    xe_debugging
>+   xe-drm-usage-stats.rst
>diff --git a/Documentation/gpu/xe/xe-drm-usage-stats.rst b/Documentation/gpu/xe/xe-drm-usage-stats.rst
>new file mode 100644
>index 000000000000..482d503ae68a
>--- /dev/null
>+++ b/Documentation/gpu/xe/xe-drm-usage-stats.rst
>@@ -0,0 +1,10 @@
>+.. SPDX-License-Identifier: GPL-2.0+
>+
>+.. _xe-usage-stats:
>+
>+========================================
>+Xe DRM client usage stats implementation
>+========================================
>+
>+.. kernel-doc:: drivers/gpu/drm/xe/xe_drm_client.c
>+   :doc: DRM Client usage stats
>diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
>index 08f0b7c95901..27494839d586 100644
>--- a/drivers/gpu/drm/xe/xe_drm_client.c
>+++ b/drivers/gpu/drm/xe/xe_drm_client.c
>@@ -2,6 +2,7 @@
> /*
>  * Copyright © 2023 Intel Corporation
>  */
>+#include "xe_drm_client.h"
>
> #include <drm/drm_print.h>
> #include <drm/xe_drm.h>
>@@ -12,9 +13,65 @@
> #include "xe_bo.h"
> #include "xe_bo_types.h"
> #include "xe_device_types.h"
>-#include "xe_drm_client.h"
>+#include "xe_exec_queue.h"
>+#include "xe_gt.h"
>+#include "xe_hw_engine.h"
>+#include "xe_pm.h"
> #include "xe_trace.h"
>
>+/**
>+ * DOC: DRM Client usage stats
>+ *
>+ * The drm/xe driver implements the DRM client usage stats specification as
>+ * documented in :ref:`drm-client-usage-stats`.
>+ *
>+ * Example of the output showing the implemented key value pairs and entirety of
>+ * the currently possible format options:
>+ *
>+ * ::
>+ *
>+ * 	pos:    0
>+ * 	flags:  0100002
>+ * 	mnt_id: 26
>+ * 	ino:    685
>+ * 	drm-driver:     xe
>+ * 	drm-client-id:  3
>+ * 	drm-pdev:       0000:03:00.0
>+ * 	drm-total-system:       0
>+ * 	drm-shared-system:      0
>+ * 	drm-active-system:      0
>+ * 	drm-resident-system:    0
>+ * 	drm-purgeable-system:   0
>+ * 	drm-total-gtt:  192 KiB
>+ * 	drm-shared-gtt: 0
>+ * 	drm-active-gtt: 0
>+ * 	drm-resident-gtt:       192 KiB
>+ * 	drm-total-vram0:        23992 KiB
>+ * 	drm-shared-vram0:       16 MiB
>+ * 	drm-active-vram0:       0
>+ * 	drm-resident-vram0:     23992 KiB
>+ * 	drm-total-stolen:       0
>+ * 	drm-shared-stolen:      0
>+ * 	drm-active-stolen:      0
>+ * 	drm-resident-stolen:    0
>+ * 	drm-cycles-rcs: 28257900
>+ * 	drm-total-cycles-rcs:   7655183225
>+ * 	drm-cycles-bcs: 0
>+ * 	drm-total-cycles-bcs:   7655183225
>+ * 	drm-cycles-vcs: 0
>+ * 	drm-total-cycles-vcs:   7655183225
>+ * 	drm-engine-capacity-vcs:        2
>+ * 	drm-cycles-vecs:        0
>+ * 	drm-total-cycles-vecs:  7655183225
>+ * 	drm-engine-capacity-vecs:       2
>+ * 	drm-cycles-ccs: 0
>+ * 	drm-total-cycles-ccs:   7655183225
>+ * 	drm-engine-capacity-ccs:        4
>+ *
>+ * Possible `drm-cycles-` key names are: `rcs`, `ccs`, `bcs`, `vcs`, `vecs` and
>+ * "other".
>+ */
>+
> /**
>  * xe_drm_client_alloc() - Allocate drm client
>  * @void: No arg
>@@ -179,6 +236,82 @@ static void show_meminfo(struct drm_printer *p, struct drm_file *file)
> 	}
> }
>
>+static const u64 class_to_mask[] = {
>+	[XE_ENGINE_CLASS_RENDER] = XE_HW_ENGINE_RCS_MASK,
>+	[XE_ENGINE_CLASS_VIDEO_DECODE] = XE_HW_ENGINE_VCS_MASK,
>+	[XE_ENGINE_CLASS_VIDEO_ENHANCE] = XE_HW_ENGINE_VECS_MASK,
>+	[XE_ENGINE_CLASS_COPY] = XE_HW_ENGINE_BCS_MASK,
>+	[XE_ENGINE_CLASS_OTHER] = XE_HW_ENGINE_GSCCS_MASK,
>+	[XE_ENGINE_CLASS_COMPUTE] = XE_HW_ENGINE_CCS_MASK,
>+};
>+
>+static void show_runtime(struct drm_printer *p, struct drm_file *file)
>+{
>+	struct xe_file *xef = file->driver_priv;
>+	struct xe_device *xe = xef->xe;
>+	struct xe_gt *gt;
>+	struct xe_hw_engine *hwe;
>+	struct xe_exec_queue *q;
>+	unsigned long i, id_hwe, id_gt, capacity[XE_ENGINE_CLASS_MAX] = { };
>+	u64 gpu_timestamp, engine_mask = 0;
>+	bool gpu_stamp = false;
>+
>+	xe_pm_runtime_get(xe);
>+
>+	/* Accumulate all the exec queues from this client */
>+	mutex_lock(&xef->exec_queue.lock);
>+	xa_for_each(&xef->exec_queue.xa, i, q)
>+		xe_exec_queue_update_runtime(q);
>+	mutex_unlock(&xef->exec_queue.lock);
>+
>+	/* Calculate capacity of each engine class */
>+	BUILD_BUG_ON(ARRAY_SIZE(class_to_mask) != XE_ENGINE_CLASS_MAX);
>+	for_each_gt(gt, xe, id_gt)
>+		engine_mask |= gt->info.engine_mask;
>+	for (i = 0; i < XE_ENGINE_CLASS_MAX; i++)
>+		capacity[i] = hweight64(engine_mask & class_to_mask[i]);

Will this work if both tiles have identical set of engines? Are we even 
supporting such configs here?

If yes, I was thinking of something like this:

for_each_gt(gt, xe, id_gt)
	for (i = 0; i < XE_ENGINE_CLASS_MAX; i++)
		capacity[i] += hweight64(gt->info.engine_mask & class_to_mask[i]);

>+
>+	/*
>+	 * Iterate over all engines, printing the accumulated
>+	 * runtime for this client, per engine class
>+	 */
>+	for_each_gt(gt, xe, id_gt) {
>+		xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>+		for_each_hw_engine(hwe, gt, id_hwe) {
>+			const char *class_name;
>+
>+			if (!capacity[hwe->class])
>+				continue;
>+
>+			/*
>+			 * Use any (first) engine to have a timestamp to be used every
>+			 * time
>+			 */
>+			if (!gpu_stamp) {
>+				gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
>+				gpu_stamp = true;
>+			}
>+
>+			class_name = xe_hw_engine_class_to_str(hwe->class);
>+
>+			drm_printf(p, "drm-cycles-%s:\t%llu\n",
>+				   class_name, xef->runtime[hwe->class]);
>+			drm_printf(p, "drm-total-cycles-%s:\t%llu\n",
>+				   class_name, gpu_timestamp);
>+
>+			if (capacity[hwe->class] > 1)
>+				drm_printf(p, "drm-engine-capacity-%s:\t%lu\n",
>+					   class_name, capacity[hwe->class]);
>+
>+			/* engine class already handled, skip next iterations */
>+			capacity[hwe->class] = 0;
>+		}
>+		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);

Same question here. Do we support same class of engines that are present 
on both tiles?

Regards,
Umesh
>+	}
>+
>+	xe_pm_runtime_get(xe);
>+}
>+
> /**
>  * xe_drm_client_fdinfo() - Callback for fdinfo interface
>  * @p: The drm_printer ptr
>@@ -192,5 +325,6 @@ static void show_meminfo(struct drm_printer *p, struct drm_file *file)
> void xe_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file)
> {
> 	show_meminfo(p, file);
>+	show_runtime(p, file);
> }
> #endif
>-- 
>2.43.0
>
