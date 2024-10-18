Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 235CC9A34DB
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 07:59:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 243DD10E36A;
	Fri, 18 Oct 2024 05:59:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="iuKNKsHw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2050.outbound.protection.outlook.com [40.107.223.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9DA210E366;
 Fri, 18 Oct 2024 05:59:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kPsz/YNwyReljhO2Dsen2TmvCb6PhW3vGhBMGtjWXFsX6wGdLKHxofOjlTF6LVuk2LbLdQY3gW/qtD7Y6vBx+XekEopLb01cSayWRJZyrz2WSYhvrZSzNljsS79/Tyh2vFkIy7HTHNXt1g7Hgy9WyDSOQ4/q7O4hqMsMKurAi8Ak4YxwcewnNFDqeRIGs0GPYkNvTFqeoQdVUoHEeEzJR69ZRclfPWEEMSM/Q90I/FJWFwJ/mo7FfWNzEw9m1vIVEFf8PZiw7AReYkohDct0Cc9EnoacqypbPbIgzQjRdB3ipGdOaUxOtLAWMNmc5zYoto4ebEqme+kiUS2Ips77Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zb5OpscNAfOjLweTQvw0k2Hkqo+2uG77BMpMZXCd1Mo=;
 b=vVmyFGC67afRyuGBxO0AolVmqxNkF6an0IZo2h7YAej85dCqum05lH7PGMb0THRiu0dc9jAnBNdsc26AgYB5RhGurRlQDv1A9kP3D4z7b0+JDvNHPwk6MXirzZY7zL1dEPD2f28ePw4fbnRiGoGsJhJDBu3mAaQO+XaLxX0K7ewGiGQ/u21/X/sDnIuR+efJ6r8DHyG6UtyMr1WC2Usd7lj71ecSCQPAqvikaZtlHPNbLK9PW/WkrNuWVmdUxcccwfIEIkt+ob2y1tN8CbFRq0i3NreyVeHV518Cbr+dy+4+IG23Ftz68DE5GAWB+OFkyZ1XVH2K/FLqNPkvS7/EaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zb5OpscNAfOjLweTQvw0k2Hkqo+2uG77BMpMZXCd1Mo=;
 b=iuKNKsHwlEkRcYP7CxHI3QD05hK9FoIpymOUyE3yL4dHw8iiJvxKJEiFnDM2jDMAqOFyRTlPVj5bCILARSyRu3RC7wsAfVII56uYmK+n0r00Zd9w5sRlWLo5eMhAwYMqfNv8BA91zdHWx2tSFsI5dWSat9leNE8xpTSKw+OXjVnhcUrWzzaf+Sy+Dbnt/ESCR8qnp16qK0U7ag2zH6Iicmf1NOvMZcgBaSOkCqa0QW+3f1RSFC7MXqc7QkC5qfstBdnklMjjYTUtTEXTSKREh2ERZAvX6wgR8KgR/oSw9g3J3fWriSVmNoDDtP3jSN0r/cCmIif2G0ybDUFOhclRjg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 IA1PR12MB6553.namprd12.prod.outlook.com (2603:10b6:208:3a3::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8048.26; Fri, 18 Oct 2024 05:58:55 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%3]) with mapi id 15.20.8069.016; Fri, 18 Oct 2024
 05:58:54 +0000
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-3-matthew.brost@intel.com>
 <87o73k8yyq.fsf@nvdebian.thelocal>
 <Zw9FPAzlvGVswwxR@DUT025-TGLU.fm.intel.com>
 <ZxBgqc0sRE2Ur2D4@DUT025-TGLU.fm.intel.com>
 <87h69bo5u2.fsf@nvdebian.thelocal>
 <ZxB6NypgrYN1spYc@DUT025-TGLU.fm.intel.com>
 <874j5bo0yu.fsf@nvdebian.thelocal>
 <ZxCNeUqqd7os5fyn@DUT025-TGLU.fm.intel.com>
 <87zfn3mg69.fsf@nvdebian.thelocal>
 <ZxEwAIc4dW7Sig36@DUT025-TGLU.fm.intel.com>
 <87r08emlb7.fsf@nvdebian.thelocal>
 <6f5a335a-1c1a-424d-94b9-96cad6fa642b@redhat.com>
User-agent: mu4e 1.10.8; emacs 29.1
From: Alistair Popple <apopple@nvidia.com>
To: Mika =?utf-8?Q?Penttil=C3=A4?= <mpenttil@redhat.com>
Cc: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, airlied@gmail.com,
 christian.koenig@amd.com, thomas.hellstrom@linux.intel.com,
 simona.vetter@ffwll.ch, felix.kuehling@amd.com, dakr@kernel.org
Subject: Re: [PATCH v2 02/29] mm/migrate: Add migrate_device_prepopulated_range
Date: Fri, 18 Oct 2024 16:55:23 +1100
In-reply-to: <6f5a335a-1c1a-424d-94b9-96cad6fa642b@redhat.com>
Message-ID: <874j5ane92.fsf@nvdebian.thelocal>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SY6PR01CA0056.ausprd01.prod.outlook.com
 (2603:10c6:10:ea::7) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|IA1PR12MB6553:EE_
X-MS-Office365-Filtering-Correlation-Id: bb4e2440-c943-4929-a97c-08dcef39f2a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bktWR044NnVyMElnRE1iZkcySTZXdzEvUUhlY1VUWWVyS3RCVTFVK0x2aG5a?=
 =?utf-8?B?RHBlR0N1NDhMZjdmbHBSeDh0L3B1THFUeHlBbmZJVE1HbFdzeW5WMEZOYUt6?=
 =?utf-8?B?R1FZeGdseDFSSlVMRkxKeGdMTUFvUTNDUmN0UjVOTGd5aHVXSVRMVXJxNndx?=
 =?utf-8?B?YjBqdEhhUGpYUC9pcDFBeFlweitBZm5paUtJK2Z6TjFRTjdQRWUvbmlzbmZn?=
 =?utf-8?B?Z0FDMXk2UGI2dE5xOHJVZ3Rpc3EvWHVtMTdEWjAxQkVteU9ibWF3VzVpZWdv?=
 =?utf-8?B?dzdQQkdLMmxzUmVwYnNMak5wTjdIU1ZvU1hxWlE2dVFUWkw5bWlSd0J1RlZD?=
 =?utf-8?B?ek82RWM5enpERG9nUkhPYTJrNTdvbVltdUlieVNJYzhONGpKSFMrOVpuY3h1?=
 =?utf-8?B?M3VnZ1N3cHJocXJhYXkzT3J5amdxeXpnbkRYYkw1MHlTZlY2R0RZMzIyd2Fh?=
 =?utf-8?B?NnFBM0xJOVd2VVh2ZmxNUmozUXZiSVlWTXhmVFcvUFFwVlZvZHFhbzkxdFVB?=
 =?utf-8?B?aytJM3pMR2E0OWljUkx3Q1hZWi9ER2lSTUVzSEYraXQvYm5xL2RJVDVCTWVp?=
 =?utf-8?B?VnB3WVhVNExYRm5hVzd4V21uQ0E2eFplSmpkN01iMDZvTitrUXB6bTFtODZy?=
 =?utf-8?B?amthbDFZV2RHYmtJNDBZNnVSdE5hSys2TFhTTUZHUS9zcktvVXJrWmtHY0pw?=
 =?utf-8?B?c2lqYmtCL0dTdmZncGRyN0FLN3FMMnNXTFlrdlZ0Vzh4NU81MzdYSWEwQnVY?=
 =?utf-8?B?TDdaTkg5Q09aeGI0K20rY1pYUVFpRmF2NzlUZHFHOXNqSHZEZmJrMFlwOC82?=
 =?utf-8?B?RnRUNngxRUl1N0xzdzhaMFJHbXp0ZmRyMXd4OE1OME1vZVZXaWNJZElJUFFQ?=
 =?utf-8?B?V1RvUWlsYWFaTzBLM3VPSk14aUJKcElwbXVCQXFBTkxJMzNySmJ6U1dqSjc0?=
 =?utf-8?B?dnFuV0JXRkRyU0p2NzZES1NEZVpxVlZTSFFIa3I1MGlYVWRjQzAxZWZpYStH?=
 =?utf-8?B?VU5FUEYvaWRZNEMyYm0xVW5nOCtienBzSVlaTzJCMWFQazhJMXRibXdONzlY?=
 =?utf-8?B?RUJnc096eCtBYzh6Z1E2ejBLUlJyNlNzSjZaVStWUmoyek8vbEw0Q3VMeVV4?=
 =?utf-8?B?YUIwMFl3cVJEZjN6UlB6b3liWC9aajZaYytxNUczVEszTnN1YnhFekZsTFk4?=
 =?utf-8?B?T3kzRTVuRERHeGxpZGZXRFZ0czh6Z2NNdE1PdjdSYUJyVXYyM3llVjVXU0JY?=
 =?utf-8?B?R1ZSd3o0UVAzTms2cGhVbDM0aWJ5ZVc2ckxhbHFxRGZSS3BHQzYvcVhndFZ6?=
 =?utf-8?B?WnFHSFZPdWVWcmdldDA1bzlxa2gyZWNXMDhHYWd0OVhyRkFiM1VXRkdHc2JG?=
 =?utf-8?B?dkU5cjZFejBDSEZtZUVjMFZ0MnVNeUQ5aFd6MC8wcjJnbjVKczEvcHpWdlpl?=
 =?utf-8?B?eUxTNnBVcjFUUDRTZStCSEk4bmxxeldzYWZFY01RNzhuTXQ5OWlUWVJ6c25S?=
 =?utf-8?B?NytZYVpmMjdZWjJock9hWTVCZ1lNWk9KTzh5WWxHWTdKVmlNNDlIVVUzVW1C?=
 =?utf-8?B?SjFoS2lPMStUVHZoOC82V25wNGNUV3V1dmQxNktKVTNMNXlkbUMrekFMRHRE?=
 =?utf-8?B?UzZhbXNDYjdLMWJrM2xrM3FPYnErcHVEVnU0WmVOVVAzTXVUZVpFbUVVaXVQ?=
 =?utf-8?B?Mndwc1ppYmFUYU9mZklLZnI5aXZmRnhCb2RyMjI2Q041ejhNRzJwZ1RSM2Fz?=
 =?utf-8?Q?6Nnwoi84iO7OE68gtbcoZRfC2z1WaJ+/vcdPjhL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dEt1WmQ2c2gveWNaaUpVWmhOVnpjV1pyQm9Pc3FWblFVaTB6RnhDcmFRU3Zx?=
 =?utf-8?B?OVB0bTNRbU5IVUNObVNrVk5USWQyVHJCL1ZuMkZ2Yy9sVmJra3FrenlhUnFO?=
 =?utf-8?B?L3NNcE9Oa0ZSa0puNWltcDNqeXhMMEJOcDZhRVd3RzFzSm02azdENVZPa1hh?=
 =?utf-8?B?bmVGbzFZRXBSNFhrYkRzbS96b1pyRG5UR05Sb09BOUxCUmRzeS82V25CaWFQ?=
 =?utf-8?B?YVpDWTZhZS92YWFNRndPT0V3MytiMWx2M21SakRBZVQ2eFpLZlJVNnZHTHl4?=
 =?utf-8?B?MWxtaGtxaStTTjFjeW96S2IwL1FCV05wUnZPV0lQK0RMRlYvUFcwNTFLOUk5?=
 =?utf-8?B?dGtZOU94dXBBZjk2MkEvSmJOMU5wRVJWdkxmWkxVSFc3emkydWdLRjRSZFBN?=
 =?utf-8?B?VUovL0VrNEYyTG9WVExIdE5kR0FPK09lc2k2bTg0Z2JLSnA2VERGSlU2c2pw?=
 =?utf-8?B?TFF1dkhvVm1PQWYzREJXLy9Lcys3STF4emNPWW5OZG52akpzeHp3TGJuWHgz?=
 =?utf-8?B?M0FJT3BLVEFGYXFJSHN5RkQ5aTVmM0VTRkZUNnQyVHM5dTFhM3ZkejVjVG5C?=
 =?utf-8?B?enFpYml0YnU1b1lsZUFoczhaQ29YTzBpS2x6MzVMd21zNzkvYnpES0JJVmdi?=
 =?utf-8?B?cWk0eEJOMnUzaHRGMVlwZHBWai9TeW5TVTdCZ1RLeUZDU2FmSFRQQjhQZ1do?=
 =?utf-8?B?YXpKZ0Y2dXIrQTlkOTFQZ25wOUdTbS9MUkdPMDhId3lLSEhMOEJBelp1VFM5?=
 =?utf-8?B?WnpnanF0dVBXL0V0ZTlWcFh0Z0lZK2dPdVFxdHh0K2JRc0s3OUR0a2tWdlNE?=
 =?utf-8?B?OXpHT2tVN3hxeEdsbkFwLzZlZE1mLzN2M3I0TE5FNk5RSjdmOUZHUm14dno3?=
 =?utf-8?B?Yy96NWlmcFU1anFDT1M3bUt3VnVlUlhDRkhRY001Zmw5cnpnNm9LR3p4KzQ3?=
 =?utf-8?B?UDgvYjBUK1YyVVRRMVNtSjVuY0JWUCt6RlRNRVlhUFE2emMwVzVqT3o4THhn?=
 =?utf-8?B?c1hCMGdVV1R4bTJ6cUZRWnZCd21OZitDL0ltWUJjV2NlRWJtN3FjQm1waFI4?=
 =?utf-8?B?R0tETTFHNjhFYmRhTGd4Y3VtQ1pVcTlSNlVEamtoUHhUcGFKRlppcWp1QW9Q?=
 =?utf-8?B?SFE4NUE4QjVIbk0zbU1kZi9WNWlTcFY2TGZWL2syYUk3L2Fkemx4ZlZTcGpP?=
 =?utf-8?B?MTdOY0JqU1RITkdGbzR1K0JNMzdZNVlGcmEwZnk4WkxIOGdQRmVvcjZzOWZR?=
 =?utf-8?B?MnM3RkZ5Ykl2Q21US3U0ZVlkZlo4eUVHU2g2ZExQYlJ5MXJvRTI5blhHTnlt?=
 =?utf-8?B?ZTA5RDRSM2p0MDl0cHgwVEFaYnkySlZPQzBXaFo5ZjU4cWZsQmJ1b0pDeCs1?=
 =?utf-8?B?N2lKdHFzQUx3bnBqalpXQnhrajlORDdERlFnODJMMzZmdFRZVDMveUJyenRI?=
 =?utf-8?B?TFlzUko5R3ZacDFNUTBqWm5tTUVxZDAwbkZqN1pEcnQvMzl4NEZOL1lPTThU?=
 =?utf-8?B?emNYbmZaekZLRm8yUVRRWmo0OVFqdHdTODhvWFVraURzNDNMZ25nZkx4Y00z?=
 =?utf-8?B?L1Jxemp4NEJMdzZkL3RiTGZFc1UvdlZsbU44bStCZTBJNCtLcC9GWHVyUHpZ?=
 =?utf-8?B?bVYyaUF2ZTB6ODBRTktjZWtGRUlwL2JJWTNwb2dTNDdVMmdNNEdaRkhMTmxD?=
 =?utf-8?B?MEg1NHRqRDZ1dXhyR1hIQnZramdWcXFXSVB2bE5CSkl4UnBjL0ZSSit0YlhH?=
 =?utf-8?B?dnU3YXRUbStsUXFVSjh6OXo0Z0N2WHpuYktEUUtnQUhuZHR4RFl5dENyeTUw?=
 =?utf-8?B?ZU53ZFQ4WDlJWWYwSkxXR2NiaDV0dVp1bHk5dlBPNlFPWE5yZEhQTEhCUnpu?=
 =?utf-8?B?NlBWbWVaWFJhOUErS3o1bmhhenlOd0FLZmdOc2ZnaENnUlk1d1RnR1ZaWFJp?=
 =?utf-8?B?YUtRN3l5alY5aFJYVmUrZW53YWRQeG9PSUxLTkp3Ukk0Wjk4eHd4QzVnQlpk?=
 =?utf-8?B?WEhZeDdKaVVDbkVZOU9ISktBVjFISVZMN0pLckFNbm9qbkFOR1dZL1YwVnhs?=
 =?utf-8?B?bjdjdENXWkp4UzN1LzlNL1pLN3J2NGg4RjgveUwvZVJkYXJoUVFiQVd2Zi9I?=
 =?utf-8?Q?JXhnTXd8vXTLGu5+D/IH1TCp6?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb4e2440-c943-4929-a97c-08dcef39f2a2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 05:58:54.5427 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g3+Sf02gfPj7md3MydqFMs9ryhsmmGkkJLLZC31QCxFbWOs69l6CAKDdtEp6ddAP7fG6v5IJYH4BbjCWC8R7sA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6553
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


Mika Penttil=C3=A4 <mpenttil@redhat.com> writes:

> Hi,
>
> On 10/18/24 00:58, Alistair Popple wrote:
>> Matthew Brost <matthew.brost@intel.com> writes:
>>
>>> On Thu, Oct 17, 2024 at 04:49:11PM +1100, Alistair Popple wrote:
>>>> Matthew Brost <matthew.brost@intel.com> writes:
>>>>
>>>>> On Thu, Oct 17, 2024 at 02:21:13PM +1100, Alistair Popple wrote:
>>>>>> Matthew Brost <matthew.brost@intel.com> writes:
>>>>>>
>>>>>>> On Thu, Oct 17, 2024 at 12:49:55PM +1100, Alistair Popple wrote:
>>>>>>>> Matthew Brost <matthew.brost@intel.com> writes:
>>>>>>>>
>>>>>>>>> On Wed, Oct 16, 2024 at 04:46:52AM +0000, Matthew Brost wrote:
>>>>>>>>>> On Wed, Oct 16, 2024 at 03:04:06PM +1100, Alistair Popple wrote:
>>>>>>>> [...]
>>>>>>>>
>>>>>>>>>>>> +{
>>>>>>>>>>>> +	unsigned long i;
>>>>>>>>>>>> +
>>>>>>>>>>>> +	for (i =3D 0; i < npages; i++) {
>>>>>>>>>>>> +		struct page *page =3D pfn_to_page(src_pfns[i]);
>>>>>>>>>>>> +
>>>>>>>>>>>> +		if (!get_page_unless_zero(page)) {
>>>>>>>>>>>> +			src_pfns[i] =3D 0;
>>>>>>>>>>>> +			continue;
>>>>>>>>>>>> +		}
>>>>>>>>>>>> +
>>>>>>>>>>>> +		if (!trylock_page(page)) {
>>>>>>>>>>>> +			src_pfns[i] =3D 0;
>>>>>>>>>>>> +			put_page(page);
>>>>>>>>>>>> +			continue;
>>>>>>>>>>>> +		}
>>>>>>>>>>>> +
>>>>>>>>>>>> +		src_pfns[i] =3D migrate_pfn(src_pfns[i]) | MIGRATE_PFN_MIGR=
ATE;
>>>>>>>>>>> This needs to be converted to use a folio like
>>>>>>>>>>> migrate_device_range(). But more importantly this should be spl=
it out as
>>>>>>>>>>> a function that both migrate_device_range() and this function c=
an call
>>>>>>>>>>> given this bit is identical.
>>>>>>>>>>>
>>>>>>>>>> Missed the folio conversion and agree a helper shared between th=
is
>>>>>>>>>> function and migrate_device_range would be a good idea. Let add =
that.
>>>>>>>>>>
>>>>>>>>> Alistair,
>>>>>>>>>
>>>>>>>>> Ok, I think now I want to go slightly different direction here to=
 give
>>>>>>>>> GPUSVM a bit more control over several eviction scenarios.
>>>>>>>>>
>>>>>>>>> What if I exported the helper discussed above, e.g.,
>>>>>>>>>
>>>>>>>>>  905 unsigned long migrate_device_pfn_lock(unsigned long pfn)
>>>>>>>>>  906 {
>>>>>>>>>  907         struct folio *folio;
>>>>>>>>>  908
>>>>>>>>>  909         folio =3D folio_get_nontail_page(pfn_to_page(pfn));
>>>>>>>>>  910         if (!folio)
>>>>>>>>>  911                 return 0;
>>>>>>>>>  912
>>>>>>>>>  913         if (!folio_trylock(folio)) {
>>>>>>>>>  914                 folio_put(folio);
>>>>>>>>>  915                 return 0;
>>>>>>>>>  916         }
>>>>>>>>>  917
>>>>>>>>>  918         return migrate_pfn(pfn) | MIGRATE_PFN_MIGRATE;
>>>>>>>>>  919 }
>>>>>>>>>  920 EXPORT_SYMBOL(migrate_device_pfn_lock);
>>>>>>>>>
>>>>>>>>> And then also export migrate_device_unmap.
>>>>>>>>>
>>>>>>>>> The usage here would be let a driver collect the device pages in =
virtual
>>>>>>>>> address range via hmm_range_fault, lock device pages under notifi=
er
>>>>>>>>> lock ensuring device pages are valid, drop the notifier lock and =
call
>>>>>>>>> migrate_device_unmap.
>>>>>>>> I'm still working through this series but that seems a bit dubious=
, the
>>>>>>>> locking here is pretty subtle and easy to get wrong so seeing some=
 code
>>>>>>>> would help me a lot in understanding what you're suggesting.
>>>>>>>>
>>>>>>> For sure locking in tricky, my mistake on not working through this
>>>>>>> before sending out the next rev but it came to mind after sending +
>>>>>>> regarding some late feedback from Thomas about using hmm for evicti=
on
>>>>>>> [2]. His suggestion of using hmm_range_fault to trigger migration
>>>>>>> doesn't work for coherent pages, while something like below does.
>>>>>>>
>>>>>>> [2] https://patchwork.freedesktop.org/patch/610957/?series=3D137870=
&rev=3D1#comment_1125461
>>>>>>>
>>>>>>> Here is a snippet I have locally which seems to work.
>>>>>>>
>>>>>>> 2024 retry:
>>>>>>> 2025         hmm_range.notifier_seq =3D mmu_interval_read_begin(not=
ifier);
>>>>>>> 2026         hmm_range.hmm_pfns =3D src;
>>>>>>> 2027
>>>>>>> 2028         while (true) {
>>>>>>> 2029                 mmap_read_lock(mm);
>>>>>>> 2030                 err =3D hmm_range_fault(&hmm_range);
>>>>>>> 2031                 mmap_read_unlock(mm);
>>>>>>> 2032                 if (err =3D=3D -EBUSY) {
>>>>>>> 2033                         if (time_after(jiffies, timeout))
>>>>>>> 2034                                 break;
>>>>>>> 2035
>>>>>>> 2036                         hmm_range.notifier_seq =3D mmu_interva=
l_read_begin(notifier);
>>>>>>> 2037                         continue;
>>>>>>> 2038                 }
>>>>>>> 2039                 break;
>>>>>>> 2040         }
>>>>>>> 2041         if (err)
>>>>>>> 2042                 goto err_put;
>>>>>>> 2043
>>>>>>> 2044         drm_gpusvm_notifier_lock(gpusvm);
>>>>>>> 2045         if (mmu_interval_read_retry(notifier, hmm_range.notifi=
er_seq)) {
>>>>>>> 2046                 drm_gpusvm_notifier_unlock(gpusvm);
>>>>>>> 2047                 memset(src, 0, sizeof(*src) * npages);
>>>>>>> 2048                 goto retry;
>>>>>>> 2049         }
>>>>>>> 2050         for (i =3D 0; i < npages; ++i) {
>>>>>>> 2051                 struct page *page =3D hmm_pfn_to_page(src[i]);
>>>>>>> 2052
>>>>>>> 2053                 if (page && (is_device_private_page(page) ||
>>>>>>> 2054                     is_device_coherent_page(page)) && page->zo=
ne_device_data)
>>>>>>> 2055                         src[i] =3D src[i] & ~HMM_PFN_FLAGS;
>>>>>>> 2056                 else
>>>>>>> 2057                         src[i] =3D 0;
>>>>>>> 2058                 if (src[i])
>>>>>>> 2059                         src[i] =3D migrate_device_pfn_lock(src=
[i]);
>>>>>>> 2060         }
>>>>>>> 2061         drm_gpusvm_notifier_unlock(gpusvm);
>>>>>> Practically for eviction isn't this much the same as calling
>>>>>> migrate_vma_setup()? And also for eviction as Sima mentioned you
>>>>>> probably shouldn't be looking at mm/vma structs.
>>>>>>
>>>>> hmm_range_fault is just collecting the pages, internally I suppose it
>>>>> does look at a VMA (struct vm_area_struct) but I think the point is
>>>>> drivers should not be looking at VMA here.
>>>> migrate_vma_setup() is designed to be called by drivers and needs a vm=
a,
>>>> so in general I don't see a problem with drivers looking up vma's. The
>>>> problem arises specifically for eviction and whether or not that happe=
ns
>>>> in the driver or hmm_range_fault() is pretty irrelevant IMHO for the
>>>> issues there (see below).
>>>>
>>> Ok, if you think it ok for drivers to lookup the VMA then purposed
>>> exporting of migrate_device_pfn_lock & migrate_device_unmap is not
>>> needed, rather just the original function exported in the this patch.
>>>
>>> More below too.
>>>
>>>>>>> 2063         migrate_device_unmap(src, npages, NULL);
>>>>>>> ...
>>>>>>> 2101         migrate_device_pages(src, dst, npages);
>>>>>>> 2102         migrate_device_finalize(src, dst, npages);
>>>>>>>
>>>>>>>
>>>>>>>>> Sima has strongly suggested avoiding a CPUVMA
>>>>>>>>> lookup during eviction cases and this would let me fixup
>>>>>>>>> drm_gpusvm_range_evict in [1] to avoid this.
>>>>>>>> That sounds reasonable but for context do you have a link to the
>>>>>>>> comments/discussion on this? I couldn't readily find it, but I may=
 have
>>>>>>>> just missed it.
>>>>>>>>
>>>>>>> See in [4], search for '2. eviction' comment from sima.
>>>>>> Thanks for pointing that out. For reference here's Sima's comment:
>>>>>>
>>>>>>> 2. eviction
>>>>>>>
>>>>>>> Requirements much like migrate_to_ram, because otherwise we break t=
he
>>>>>>> migration gurantee:
>>>>>>>
>>>>>>> - Only looking at physical memory datastructures and locks, no look=
ing at
>>>>>>>   mm/vma structs or relying on those being locked. We rely entirely=
 on
>>>>>>>   reverse maps from try_to_migrate to find all the mappings on both=
 cpu
>>>>>>>   and gpu side (cpu only zone device swap or migration pte entries =
ofc).
>>>>>> I also very much agree with this. That's basically why I added
>>>>>> migrate_device_range(), so that we can forcibly evict pages when the
>>>>>> driver needs them freed (eg. driver unload, low memory, etc.). In
>>>>>> general it is impossible to guarantee eviction og all pages using ju=
st
>>>>>> hmm_range_fault().
>>>>>>
>>>>> In this code path we don't have device pages available, hence the
>>>>> purposed collection via hmm_range_fault.
>>>> Why don't you have the pfns requiring eviction available? I need to re=
ad
>>>> this series in more depth, but generally hmm_range_fault() can't
>>>> gurantee you will find every device page.
>>>>
>>> There are two cases for eviction in my series:
>>>
>>> 1. TTM decides it needs to move memory. This calls
>>> drm_gpusvm_evict_to_ram. In this case the device pfns are available
>>> directly from drm_gpusvm_devmem so the migrate_device_* calls be used
>>> here albiet with the new function added in this patch as device pfns ma=
y
>>> be non-contiguous.
>> That makes sense and is generally what I think of when I'm thinking of
>> eviction. The new function makes sense too - migrate_device_range() was
>> primarily introduced to allow a driver to evict all device-private pages
>> from a GPU so didn't consider non-contiguous cases, etc.
>>
>>> 2. An inconsistent state for VA range occurs (mixed system and device p=
ages,
>>> partial unmap of a range, etc...). Here we want to evict the range ram
>>> to make the state consistent. No device pages are available due to an
>>> intentional disconnect between a virtual range and physical
>>> drm_gpusvm_devmem, thus the device pages have to be looked up. This the
>>> function drm_gpusvm_range_evict. Based on what you tell me, it likely i=
s
>>> fine the way originally coded in v2 (vma lookup + migrate_vma_*) vs
>>> using hmm_range_fault like I have suggested here.
>> Thanks for the explanation. I think vma lookup + migrate_vma_setup() is
>> fine for this usage and is exactly what you want - it was designed to
>> either select all the system memory pages or device-private pages within
>> a VA range and migrate them.
>>
>> FWIW I have toyed with the idea of a combined
>> hmm_range_fault()/migrate_vma_setup() front-end to the rest of the
>> migrate_vma_*() process but haven't come up with something nice as
>> yet. I don't think mixing the two in an open-coded fashion is a good
>> idea though, I'd rather we come up with a new API that addresses the
>> short-comings of migrate_vma_setup().
>
> This is what I have been implementing and have a WIP version now, will
> cleanup, test and send soon.
>
> It does the migration entry installing while faulting pages, and you
> continue migrate with normal migrate_vma_() flow.

Oh nice! Thanks for looking further into that idea, I'm looking forward
to seeing the results. For background Mika and I had an offline
discussion about this a little while back but I wasn't sure if it had
gone anywhere.

>>> Note #2 may be removed or unnecessary at some point if we decide to add
>>> support for ininconsistent state in GPU SVM and Xe. Keeping it simple f=
or
>>> now though. See 'Ranges with mixed system and device pages' in [5].
>>>
>>> [5] https://patchwork.freedesktop.org/patch/619819/?series=3D137870&rev=
=3D2
>>>
>>>>>>> [3] https://patchwork.freedesktop.org/patch/610957/?series=3D137870=
&rev=3D1#comment_1110726
>>>>>>> [4] https://lore.kernel.org/all/BYAPR11MB3159A304925168D8B6B4671292=
692@BYAPR11MB3159.namprd11.prod.outlook.com/T/#m89cd6a37778ba5271d5381ebeb0=
3e1f963856a78
>>>>>>>
>>>>>>>>> It would also make the function exported in this patch unnecessar=
y too
>>>>>>>>> as non-contiguous pfns can be setup on driver side via
>>>>>>>>> migrate_device_pfn_lock and then migrate_device_unmap can be call=
ed.
>>>>>>>>> This also another eviction usage in GPUSVM, see drm_gpusvm_evict_=
to_ram
>>>>>>>>> in [1].
>>>>>>>>>
>>>>>>>>> Do you see an issue exporting migrate_device_pfn_lock,
>>>>>>>>> migrate_device_unmap?
>>>>>>>> If there is a good justification for it I can't see a problem with
>>>>>>>> exporting it. That said I don't really understand why you would
>>>>>>>> want/need to split those steps up but I'll wait to see the code.
>>>>>>>>
>>>>>>> It is so the device pages returned from hmm_range_fault, which are =
only
>>>>>>> guaranteed to be valid under the notifier lock + a seqno check, to =
be
>>>>>>> locked and ref taken for migration. migrate_device_unmap() can trig=
ger a
>>>>>>> MMU invalidation which takes the notifier lock thus calling the fun=
ction
>>>>>>> which combines migrate_device_pfn_lock + migrate_device_unmap deadl=
ocks.
>>>>>>>
>>>>>>> I think this flow makes sense and agree in general this likely bett=
er
>>>>>>> than looking at a CPUVMA.
>>>>>> I'm still a bit confused about what is better with this flow if you =
are
>>>>>> still calling hmm_range_fault(). How is it better than just calling
>>>>>> migrate_vma_setup()? Obviously it will fault the pages in, but it se=
ems
>>>>> The code in rev2 calls migrate_vma_setup but the requires a struct
>>>>> vm_area_struct argument whereas hmm_range_fault does not.
>>>> I'm not sure that's a good enough justfication because the problem isn=
't
>>>> whether you're looking up vma's in driver code or mm code. The problem
>>>> is you are looking up vma's at all and all that goes with that (mainly
>>>> taking mmap lock, etc.)
>>>>
>>>> And for eviction hmm_range_fault() won't even find all the pages becau=
se
>>>> their virtual address may have changed - consider what happens in case=
s
>>>> of mremap(), fork(), etc. So eviction really needs physical pages
>>>> (pfn's), not virtual addresses.
>>>>
>>> See above, #1 yes we use a physical pages. For #2 it is about making th=
e
>>> state consistent within a virtual address range.
>> Yep, makes sense now. For migration of physical pages you want
>> migrate_device_*, virtual address ranges want migrate_vma_*
>>
>>  - Alistair
>>
>>> Matt
>>> =20
>>>>>> we're talking about eviction here so I don't understand why that wou=
ld
>>>>>> be relevant. And hmm_range_fault() still requires the VMA, although =
I
>>>>>> need to look at the patches more closely, probably CPUVMA is a DRM
>>>>> 'hmm_range_fault() still requires the VMA' internal yes, but again no=
t
>>>>> as argument. This is about avoiding a driver side lookup of the VMA.
>>>>>
>>>>> CPUVMA =3D=3D struct vm_area_struct in this email.
>>>> Thanks for the clarification.
>>>>
>>>>  - Alistair
>>>>
>>>>> Matt
>>>>>
>>>>>> specific concept?
>>>>>>
>>>>>> Thanks.
>>>>>>
>>>>>>  - Alistair
>>>>>>
>>>>>>> Matt
>>>>>>> =20
>>>>>>>>  - Alistair
>>>>>>>>
>>>>>>>>> Matt
>>>>>>>>>
>>>>>>>>> [1] https://patchwork.freedesktop.org/patch/619809/?series=3D1378=
70&rev=3D2
>>>>>>>>>
>>>>>>>>>> Matt
>>>>>>>>>>
>>>>>>>>>>>> +	}
>>>>>>>>>>>> +
>>>>>>>>>>>> +	migrate_device_unmap(src_pfns, npages, NULL);
>>>>>>>>>>>> +
>>>>>>>>>>>> +	return 0;
>>>>>>>>>>>> +}
>>>>>>>>>>>> +EXPORT_SYMBOL(migrate_device_prepopulated_range);
>>>>>>>>>>>> +
>>>>>>>>>>>>  /*
>>>>>>>>>>>>   * Migrate a device coherent folio back to normal memory. The=
 caller should have
>>>>>>>>>>>>   * a reference on folio which will be copied to the new folio=
 if migration is
>
> --Mika

