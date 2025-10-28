Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB921C1517F
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 15:14:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2EE310E103;
	Tue, 28 Oct 2025 14:14:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="kZtT/AIu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012062.outbound.protection.outlook.com [52.101.48.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3774F10E103;
 Tue, 28 Oct 2025 14:14:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xuqHNKkBsdzn2k9Kdm98zTVZGawSt1GhWctF47LFNHbIVe4YMr1LHWpT9Fhb89JWhinTdEbXXpJGqBrZTfRspy44abA8PPioZEFRUV5lRhCfVCLLSTrWqwyXZbC8SYkjRNT/s2iE9MIKwIYD03MDEGXNkRu/pVgzvoxk2xcu/p6Vjndz0MGa3hn+ynl6xEqxIMh9cG7XRo8mNP7KKqh/uTZ/vwJYgjhRLpxRb5qRMgqrsgsLTo8uYyEHxjEP4yYoAdlR05W3P1YYFucvkIlZCi32L3Hl+gSvwtqZou62NOKlYcoJbz3u4WRwr5O/+vmYa4XnY4XQy1YuhVj7OSMVqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dHKxSBDMnu1zI1i3f6JfjyLsT0uSzZhBaOYHoiyerXk=;
 b=tTqJqsJRYJVUpn8No7IPzZkKhSP/A8J9wCfPls5iuXtfw+ny3mBaTk5tG97kT2HuGsy+JOdcaEv68DRqi+tKcevKeafeu3avoWJ+e+Tc7n+18fsk+oVBIeRHcEfqIZj3aJWdXrdyX0w5xFG0wq3PTOQG1hrnjK75RUn3j1hG8Kgokhx2Oxc41Nzgi6AmPAQ0P53B/SAZuolFyV8JyUPX+LL5sJksdzPVzvKEBEeA1GEFeKM7x18MNikwmHeq9EDM1m7wRltEXTmRDcVw/0XvKPymXu47RH5/HAH1WDvcUhZs8RGgGIhStL4wwrSCHixnKNSKrJ3aPpaiNY0qPdYtqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dHKxSBDMnu1zI1i3f6JfjyLsT0uSzZhBaOYHoiyerXk=;
 b=kZtT/AIuietz5PQ7lIUPZ1PgyCVmsAE5CiRvgpggm29V/vNPIrVsWVJK5sSCXOR2Ll2A77fQqIq4tQYtVLDObncPDd4d0lAaKbBDwEZU0lcCntBCV/DhYrzbn+csdJDx1hP8oyu8yW7w6ToByB7zMCKlC0iD5f5IAkDKkq4sfFk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB9347.namprd12.prod.outlook.com (2603:10b6:8:193::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Tue, 28 Oct
 2025 14:14:40 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 14:14:39 +0000
Message-ID: <dcc1265b-be10-4a54-8eda-2f7be0e70371@amd.com>
Date: Tue, 28 Oct 2025 15:14:32 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/8] dma-buf: Add support for map/unmap APIs for
 interconnects
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
References: <20251014071243.811884-1-vivek.kasireddy@intel.com>
 <20251014071243.811884-2-vivek.kasireddy@intel.com>
 <61c5edcb-2b22-4583-9138-c117bea7a9b3@amd.com>
 <20251028140548.GJ1018328@nvidia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251028140548.GJ1018328@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0564.namprd03.prod.outlook.com
 (2603:10b6:408:138::29) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB9347:EE_
X-MS-Office365-Filtering-Correlation-Id: 2017ca7c-9232-4652-1a50-08de162c5530
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TWp0bzZnL3YvZFZKQW5nRE93RmpFbndqb0wxUkE5U1pSdVZaWHE5R0pRdFd4?=
 =?utf-8?B?aFgwQlFZMTA1ckNvWW80Y0k4SXpKK0lWb2NpdU9MY3RBZUhGUXVXOHpScmVw?=
 =?utf-8?B?ZDBiVGJLZStpVzg2bzk2RWFUbXhQWUVFVTZ5ZlBDTGRjWTNrNEo5c2FuSDBU?=
 =?utf-8?B?dG5NcmN2RyswcUJ2VUdzMjhVUzVBeS9sQ3B4bFNNajRvc1ZlYWhSdTY5V0RR?=
 =?utf-8?B?WVBCMWxMRnIxelhaUHNpemtjQ0JIMmpXZHN6S0VsVGh2K0tGclhDajczYllk?=
 =?utf-8?B?MXlQUTRkQ3FyN1puR3F1RWZXU25RalVaUFFWRi9yNnVHWGsvd3RESlduVmhM?=
 =?utf-8?B?OXNyYXN6QTFDbFJpLzBpaTZ1MlhqRzNnRGxESHlRY3c5d2N1ZjJzWU5EdHRk?=
 =?utf-8?B?TnhNaEhlSitTS1pUa2lPMG03dDMySFlVSlM5VWsyZlEvQ2NGRUhEUmtURGlj?=
 =?utf-8?B?S1lLdEYxK0I2ejFFc1U3QXZOM3RQZjdDcVl1a2FSWnZUWnRSbi81MnJnUUFw?=
 =?utf-8?B?YlNQYldrNCtHZmcvQXdWOHE5bjZUZXNDODVQd2pwaGlKc1FtWU8wNXcrOUov?=
 =?utf-8?B?OVJXWkZEL3VpU1JaUjRUL1hiQmFMNFZzT3ZOVWFGeCt0UXZENlFnT3RRKzB3?=
 =?utf-8?B?VXBkWE0ySWFtcmRoRTNYamFoMEw1NlBvbHo2NE5DL2NTMCtHOTZHQXF2WkdD?=
 =?utf-8?B?N2lyWW1YSVJ6S2F1ZUJaeDl5bm5NZzNwQlZtYVFpbm5kRzZjQkowbEpiRzhC?=
 =?utf-8?B?OURTeWZoYjJoS1B2RHNhV2g3RTVHNmE3Z242cnd6dkpWS0dtWTd2MlgwVUVZ?=
 =?utf-8?B?bWdnenZlMHJrS1V3TDBGY1RBYjd6YjJrQlA2WEFTY2dKbk1CMkQxYy9taEZP?=
 =?utf-8?B?aDFaYTY1MU80MnZGZ3ZaUlVlVjA5dGZPbFdESnpMdVVRRDRYWEVyTmxScnFG?=
 =?utf-8?B?VUFjOGxDZlE3dmRwSXFCM0RhVGJEVlhCQ3dQOWxxRzRIV3VFM3BaVU14WnE4?=
 =?utf-8?B?d09DZHlUYWF4UFErUXBlSENvTDlWTFRKTzdIUnFCaHF2WDRmRDRyQXBlUlAr?=
 =?utf-8?B?TWx5SkEwQ1NZcDZEUWZrQlp0dTI0YjFiM21Ram9QQVAzS2Vha210U0YxaVhJ?=
 =?utf-8?B?RE55a1hTdEg3Uk12NDNXNjZUZ09DbW5zZHBJZE5yUG5aOFhqRzh6OUJaOFgx?=
 =?utf-8?B?T3hhcGZyNEl0NG8rZlc2V0svTWNCeFhid1d1WFdqWXJ2YjhqS1YyY3lwR1FL?=
 =?utf-8?B?M2FKVmQ1SFZMZU1vbUc4aWd0Nm83RVVnWDhid2FaL3J5MThqWVF6RURqQlBa?=
 =?utf-8?B?NFJJTUhvUEMvMGZ6cVZPV0gyU2d5eHJiOXpELzc1cFRlb1hKVlBBQ2Z5czBS?=
 =?utf-8?B?TEovQkFGZ0FtY1h4ajlDZlN2YjJ2M002dUFtSm5xdmlxOXRlcUVsZ0FJU2cr?=
 =?utf-8?B?dUJIUXNDWldpZVkydWZMZTZzUkJVR0QyZVBmQzlXaHFpSU16OWllV0tscFMr?=
 =?utf-8?B?bTRzdFF0REU4Smx5YUtRTGYyMmFGUkplRWUwcVg1QndYZFhNTkhjZXYxaUtr?=
 =?utf-8?B?T3g1eFpOZkhJOG9iWEpNQXFKdk1CWElMR21XSGhJblVTeGRxbWJVb2x5dndj?=
 =?utf-8?B?bG0wRG1XN1hubkl5T0ZERTNVNUcvbnlCVURERkJpZzRsY21UaC9FMEc1SWxo?=
 =?utf-8?B?YnI4Q3NsMDJUcFFYZmwwYW9TMkpEd3dVYlZYZTdZQ0djVzQ0Nm1rKzl6WjVQ?=
 =?utf-8?B?MTNaZWI1SE9HbXkzQmRMcDFJSWpQSFVNMkpUOHV6bkZGem9ZaG5xdVN1d2ow?=
 =?utf-8?B?V0poWkJPb1hNam0yVGQ3dWdhSXZHY01lZGZDT0J1c2xZcHcwaElRVjFjaEly?=
 =?utf-8?B?VWd6ZFZXellVQlBMcGVsWVZPWE9KWnJaOUJpQ3BQdkZPRVhmanQ0MHhFd1li?=
 =?utf-8?Q?FqARuWw9WEgGvYILnK/Wv3RwaT0B+8wS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1R0akMvalR6S0NRbWIyUnd0Z20zaldBQzdLdG55UnQ1U1VjampUQU9TajRn?=
 =?utf-8?B?Y0pRaGNDNjRJaVo2UDF0WFlwNjlnQVBZeUVNRVUwQ0Jva1FEcWtqNmhXUElr?=
 =?utf-8?B?SHhRUjZaQTQ1eEFnYktXSzFscjlkbVRuditpbG1xTyttZWhjbUVoWkRjbDZk?=
 =?utf-8?B?ajczYnVxOUloeklHU0VPYnlaRituMnpEVnliZDEvemdXcmI2NWdPdlA2YS9X?=
 =?utf-8?B?SEdWNWtUTW5IU1JpclpTbGMyMk13MWhCQUZJMFpUOVNKMmRXUmZEZmFNVy9y?=
 =?utf-8?B?T3ZpMXJtN3ZVTFlzWGlIeE9oVmFaR3BwcXhaVnFpdFhZZXRKemlsSUtRMXhx?=
 =?utf-8?B?VWh0ZzRNa1l1a3NtR3dHNEt1Mi91VW1xaFNPTi9aZGR5eTBUZnluZHZBWXFL?=
 =?utf-8?B?cHhnMGdheTNONCtWNGdidkFIbFFvVjVqRFZxVVZ0WWpPamoxZk5MekVrZkIv?=
 =?utf-8?B?aktzZjIzRWE3LzlLZG8vMzV6WmM1Z0hVZ0F1aWROZ0pWTUJPd3puUTZoVG5E?=
 =?utf-8?B?SlVvRE5MUlNKK0pWd1hsditFRkYvaDY2Sk9KRTdxOFFmbzh3dEtIRDh6eVFG?=
 =?utf-8?B?bWtOejU4WWN0QjNZdVFVZ0hQNmk1amcrOHhndDBXZy9JT0xBNmhMdGdMbmg4?=
 =?utf-8?B?SEpVMzd5ZTBqTHo3bzdQMzRnMGJyVXNQY3RxV1h4eVZHdGNKUlVDR0dJN2ZZ?=
 =?utf-8?B?VzlGN25pVnlYa0huODhOa1RPT0NERWVVTFEvSXA0eEFGdzhpQTlTYU5VN040?=
 =?utf-8?B?MXZwMGI2bnh0Yzl6azJZb0xiMENnQ0RwOS9NS3A2S21lSjFRUHhGNmdRa2Rz?=
 =?utf-8?B?TjlXL2RuVTVldXVCcWhERG85MmtUdDdPaUFKM3k4NDZXRmp1clpqVGdGckxi?=
 =?utf-8?B?TlFiaWVGYTBKV2FLSEgyNHFzOVZRUDZLY1FUZ1BFVC9XRVM1anNXdXNFSDZz?=
 =?utf-8?B?NVlRbTU2Z000b2h1RlROUnF1aWoxbXdTdHNWdmxWczNTZU85WnFuMmJHdGZW?=
 =?utf-8?B?cWNPSzYwSDF1bGFFM1B6NjBBK2hJeUpOZFRjY0VsZFFuZmdpNFFEdDZ0NmlZ?=
 =?utf-8?B?YjhVU2lFVDRqUWk2S0FMOFZUa3FCYkhiOUFzTFVhL2pROTZDamFhOHMzODZ1?=
 =?utf-8?B?RjhUSHhnY1Y1RVdxSENNY0xxVDRCVkQvYUpsZzh2ejhpSW13NU43Z0cvU2pQ?=
 =?utf-8?B?eVh1aXhtcS9jejVsLzJjMzRUcTlIcFZpZ091bSszRDh0NjhVOEhvVVBqZjF4?=
 =?utf-8?B?UHcwelBOWExNRWZyWm9GOXJMaXlqREdDVW5Wdi9RQy82K2JzUlJpaTdEMk5k?=
 =?utf-8?B?Q255bmVLYUd1Q1JkQ000WDZLcXlGaHdlQlIxRU9jOUxDSEc1NHpubVBrNitZ?=
 =?utf-8?B?b1h5cklwdWl5dndhdFVoWVhEMVhuTlY4T0V1M0tzWjM0UHlReHRMZGFyTmxj?=
 =?utf-8?B?QnpiVHk4clo1b0JJQjRuNVRUS1FIbGg1bGZJaXZYVTZaMCsvUW5JdldIL1or?=
 =?utf-8?B?YWNyay83Qm51WGNpR0lTMDJMS3BXOEJPVk5oZ2RsRGk1ZUF4S1hTMVg4RktT?=
 =?utf-8?B?T1BJeEVMbHJTQ2hyOXZiNG03NnpqWFhLbTh1WWdiSHJTN0hLRGxKWnlRS3RD?=
 =?utf-8?B?YTdJYlFVNlhYdG94Z3I0WGVMQVRNQmh1VmlKUkVkVXFDaUJPck9sM2tHMnNY?=
 =?utf-8?B?c1BONmJRNUdvTmRVeHM5TlI5V2wxUjJsNlhIWFRoeDFsU1VIRGU4MDVuOTRn?=
 =?utf-8?B?cEVLWS9abFlDdi9ZdlZ2MVM0WmNJUFR3Q0RDR2dzNWNWME15S1RMUWRSejZO?=
 =?utf-8?B?K2Y3VWlzQWV2QzhEQnFRRVE2dGJNQU9obVFveEF3T0pBTHFiMjljMkVwU29S?=
 =?utf-8?B?eEVUZ2FDb3BpTjl0QksrNjVZUjRqQlQxWlFBK1k5cTdCVkZzUXVjRW1kZFFs?=
 =?utf-8?B?dzRSR0hmU0s5UWxIN2xUSTlML29ENGJwQU5QSG5ZTjlZQWhaNE5yZDZ3SU9F?=
 =?utf-8?B?N0VCTGtMMzM5M3lLa2dxTjVoRGV3c2J6cFNkaGN3YlU5empCeFFIcHVuSGM1?=
 =?utf-8?B?UHQvZE4xcnVxNzRONmZtdFIwU0M3MTV5UUx3RGkwK1JyaXhhRHlTMVdpbTds?=
 =?utf-8?Q?NR3zKDVaSgliVCEfDCiGlkiri?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2017ca7c-9232-4652-1a50-08de162c5530
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 14:14:39.8748 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6UN9U6cuIUQ2NzcU3YHgNVkVf/IVJoIwHRwjJz3fx/x2YBQubvAROkm232TJR/ug
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9347
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

On 10/28/25 15:05, Jason Gunthorpe wrote:
> On Tue, Oct 28, 2025 at 02:58:57PM +0100, Christian König wrote:
> 
>> Some kind of iterator like interface would be preferred where you
>> have first and next callbacks.
> 
> That's what I thought you were asking for..
> 
> Are you sure that is what you want? It will make mapping of fragments
> alot slower..

Well the first function should have a start parameter and both return offset and length.

Alternatively we could come up with some container, but yeah then we would need to convert into the container format again.

> 
>> Additional to that I'm not sure if the "interconnect" is a good
>> naming, essentially we want to use the new mapping functions to
>> replace the sg_table as well.
> 
> 'mapping type' ?

+1

Christian.> 
> Jason

