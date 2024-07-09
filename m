Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E71992BD63
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 16:48:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28DCC10E57C;
	Tue,  9 Jul 2024 14:48:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="LwTcAtGx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2070.outbound.protection.outlook.com [40.107.220.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0F5310E149;
 Tue,  9 Jul 2024 14:48:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ejKGrX8OMl/rXdEbBp+hb3QulDKhVR31218/Rwb1xojau/8y7xuR2/kDGSatZGFetve5Kr44ezNb5+z3iaFszcFTX8rBpmKugMXYa5NEbG2A6bZZGcfnKOmw+pmTAydaVNc7q6XriDLfKCiHDzydwk1xUrNNLfgUUm6KnyuOzrS//iz3j6w9d992rG5FbH5F7OyK4FHw3gVuWtBaZdVOX9ksWOaDAJWP3lQjcwBh9PH3AJ5JI6tlT8Ocok/DwPXN+yeutHOO3Va4yWRMaGWkyJ6dtmSbiKqUA7TGpVtlpLPCt7pDWSEOj2lggyhnZ0Dxe7X8TUKgK/SZ/ZTPHF6tag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nXXncEL6FJX6y3XJ1wG55hHvqxiAz4Q6/iTLesBAoI8=;
 b=m8ZmCslNRyLpohEWlMnTc/FAINh4nzppmmC1QaaM+FgI9r76i940TXzhdWHKA1Ut6Xr9QLkY270W+x/fjbjtyk/MfxXEpfXHdSMTpL8qbWifqeJhbiFQ+Jh1UKKHjIxKcD0HaiTSOR4qsYfw/pF6efnAZwne2hYQQarlEvofyw54ecJT79sLzwcyVFjpvpDLMcOeSFH0fn4MFn9s0vk3BzWMkJmKBaj5HVujZ7fdsOmisEOnYgzYwnytboumfJjkPbWG4h2c9ado0bCmdUSGFylhWFESqP/psNz9bO7Ya5y9gkOT3Dx6lv9mbWnDERDWp+5CavdfgqfiOBrLluFwog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nXXncEL6FJX6y3XJ1wG55hHvqxiAz4Q6/iTLesBAoI8=;
 b=LwTcAtGxiJqZeo/3YYgc1SV7OrcUNQNZw8K8n6VGMIF1jHY2XI4lPNnRKqJgn7Yc2FK0KjB6gnZEZn91yDfWTzYsvMga6lJpF/43m345xhKzWFYInfsMwaDs/M4W/+jUlolFJQklntc+D8nz1XbM8mjTMD4fe3ZGreuCYVqS2/Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW6PR12MB8733.namprd12.prod.outlook.com (2603:10b6:303:24c::8)
 by SA1PR12MB9002.namprd12.prod.outlook.com (2603:10b6:806:38b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Tue, 9 Jul
 2024 14:48:25 +0000
Received: from MW6PR12MB8733.namprd12.prod.outlook.com
 ([fe80::71a6:a9da:c464:fa2e]) by MW6PR12MB8733.namprd12.prod.outlook.com
 ([fe80::71a6:a9da:c464:fa2e%5]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 14:48:25 +0000
Message-ID: <2915a8c4-ebac-4dae-8f09-32a5b4d9aeda@amd.com>
Date: Tue, 9 Jul 2024 08:48:20 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: 6.10/bisected/regression - commits bc87d666c05 and 6d4279cb99ac
 cause appearing green flashing bar on top of screen on Radeon 6900XT and
 120Hz
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Cc: Alex Deucher <alexdeucher@gmail.com>,
 "Mahfooz, Hamza" <Hamza.Mahfooz@amd.com>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
References: <CABXGCsNptxsQO=5=qi-JYiFX=rX8Ok5inK80Gn0qrUFWbtBGng@mail.gmail.com>
 <CADnq5_PDxJ8O1JUQ9RBYRFB9G1WZJos05ZAM4jUKuPBwPxjNkA@mail.gmail.com>
 <CABXGCsNN9LwHc2x2AAEH=5UNwpvkWkBqRYz3OP8MZ6Woy+HDXA@mail.gmail.com>
 <b6c440ca-e63e-429b-af41-5f27d4b8b2a2@leemhuis.info>
 <CABXGCsNoFfMn7LaqqFgEPg-ECyUPN=f=SXVrFi=GZk6c69-Gqw@mail.gmail.com>
 <CADnq5_PDSkr4hOHJmb1J30UC0a7sXsm5-TPkEmjzffMK_A+7ug@mail.gmail.com>
 <ea465a40-f673-42b1-8b1c-a2efb20cd562@amd.com>
 <CABXGCsPyrUEqDq2gbr4VLw5ncd9cKoCZ9nOr2SRfg8Lh=9H5Kg@mail.gmail.com>
Content-Language: en-US
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <CABXGCsPyrUEqDq2gbr4VLw5ncd9cKoCZ9nOr2SRfg8Lh=9H5Kg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN8PR07CA0027.namprd07.prod.outlook.com
 (2603:10b6:408:ac::40) To MW6PR12MB8733.namprd12.prod.outlook.com
 (2603:10b6:303:24c::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW6PR12MB8733:EE_|SA1PR12MB9002:EE_
X-MS-Office365-Filtering-Correlation-Id: a334c319-6b37-4d4f-5e36-08dca0263005
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T1E5a2JveXROaUJSRE1LUnVqQm5TVkxtYnlnUVVSaGFhek01OVBubHRRY0dV?=
 =?utf-8?B?aG90VTd0U0RhY215WU5qdlpqMEFyRS9pUWxnY0x1WG9kMGxEM3NxWWxsdnRk?=
 =?utf-8?B?c3J5Nnh2TEtyNGtobkF3aWhqU2VVYVJSLzdpMit0WjVOcXl2Wm5BZS95TXJT?=
 =?utf-8?B?blB0WTdKbWg0RXhkNVM3R3BldjIvZ2Z1eVJxekFWZSttck9GelVWelUwSHFh?=
 =?utf-8?B?S0FPbFQwSm04SXhiRGtNNkg2T2dmbUREK0NXaHJVNlpSOWx4RURReUFJMkxX?=
 =?utf-8?B?ZHkvWjVJYXVpa0Z3NGF5d21sd3dIMmMxSUxQc0laU2NWT25hZFNMRWc4b2Y2?=
 =?utf-8?B?ZzhJQkc5TFBScnFIVlhFVFkyYWZVc3daZHRIMGNlc2UyeTZZL1RNaXRicTJv?=
 =?utf-8?B?VWFYcmxFSW9BRDBQQzM0VjMyZW9paGwwdjlXSk9vTWJSRVlNOG8yam5qVW9M?=
 =?utf-8?B?d2N1dDdNbko5d1hjVGdnWWZ0Z3RTazV1NXpBeEJEdlRQeEIxdEM2QmNaVFpu?=
 =?utf-8?B?SEFJeUcybXpucDNaZEdxRzhtMGR4RUVQOVF2eExvamQ0L2pLKzRjZVlWenJE?=
 =?utf-8?B?QkFEV0NGM3hxb2tWTldCNVVyN1E2dEU1ZDFxbTZIRzZoNTBXbEpMSTY5WnpK?=
 =?utf-8?B?VXRrTjBkRGszUlNaNlFEVlgzeStmdjQwcmxuS0NBSjZKeHNlR2hzR2pmTytP?=
 =?utf-8?B?cjR0WEdSeWRjVnpPeVdUK2h6SDE0aWY3M1FiRDEyblczQnlRWi8xblAzQ0M4?=
 =?utf-8?B?SDV5Y0Y3ZlRmQzc3TWhKRlhoMmkrK081b0gvenNSd2lJY0NRQVVWblZjdmdI?=
 =?utf-8?B?dmVIZHVWV240MVJ3d08vZDR1cElpSXNycXYxeXM5ajlZa29YcUpyb1Q5RW5o?=
 =?utf-8?B?NEJyUlFSL0dUenpKUTJhVHdEMmFuZ2FIOXdJRVVmanJoNVI0eWlLOUF5a3VU?=
 =?utf-8?B?ajBGa0VWMGJWc0Y0VzRFVDY3SzNIbXZyWk02ZXFLNXlDdlZ5MDRPekJ3ZGZW?=
 =?utf-8?B?SGlSWUEyb2lUVlVXN05MZGl5WWV1UjhPRVhnTWdkNnhKcTV6ZkJpSFArUDNs?=
 =?utf-8?B?QmpsWkc5M0N1ZHlRRFBiTHBDd01PblJ2RzB0ZjFOaTd3cE1kd25YR1hqUmdE?=
 =?utf-8?B?SE13bDlONjhjV2UyMTJXWlZGWldvOFNJTGRIRFY5a3FBTEYrdWxLTmF4QUVL?=
 =?utf-8?B?cW5iSmt5WFFIZVI1NnJLVytGYVU4QWsxMzVWZW1LMjJ1bVpHTXBldFo0RCt4?=
 =?utf-8?B?S1gvd01KdHNDVmY5VVE1d3lkbHhsdnNVK1l1VGIvWWdtWDVwWXJTa1Uvd3I2?=
 =?utf-8?B?QVRoNTlGMVN3UUtKY2g5NGdETmNtMGFmOUtFK3RIbzEvWEdGaSt4R3RlU2xO?=
 =?utf-8?B?ZSthalE0QU50K2tnTzErMW9GbjU4TVJ2amJ5NW03Q0JGOEd4ZDFHaFRvTnRS?=
 =?utf-8?B?UmlHZjlPSjhvclF3Um5DblNvWkU4ZGRSNFY2ekRuMGo5amQ5aEtiaWFKWTZm?=
 =?utf-8?B?K3dtNnJ6OFd6U3VNZlg5VUlvU2dZeG5INnJtRWg0b2FvUFRmZGFKOStMWWtO?=
 =?utf-8?B?Q1l0MGVDazZuU0lYdExFcFlwWDVlekk4YUlBNldlQStVSVhNSjVwd3FuMHlv?=
 =?utf-8?B?VlJPaWpsbDZYc2dRUldST3NYQktpamhLRGUxVlBydTV0ZjRMUllISERoTUxN?=
 =?utf-8?B?ZThuc0pPTWxWV1VicnFpa0V3bXdRRTdEU0pjUWVNZmNzblBlZWxOZVNpRVE3?=
 =?utf-8?Q?VO++aLQ5W2/xlaU9QE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW6PR12MB8733.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LzNkY1dIN29oaDZ5ZWQ2cGsrOUFPRGZYazhycnBKKzhORU9QRnM0ZkJhY2dv?=
 =?utf-8?B?RE1rOTh6MUFJK3FFSmFsQUlCR0NPN0N6Q283V1ZJMlBiWTlRQThMSmVoa0xU?=
 =?utf-8?B?UkRTSTk5aGxFN1I0akVGRHc1d2xQeVRueEh6U3dvd0gvd3BRU3FCTHc3TmJn?=
 =?utf-8?B?ejRTdHI4VndTWGpGeE5sYThCMjhEN3M0MUlLUEVCcFRNQkVvMkhaTXppay9E?=
 =?utf-8?B?c0JWSHhlUGJKNGl3dUIrTGdGcmsxcnlnZkNVWWw2cE8vSzR3VlF0N0gwNmNo?=
 =?utf-8?B?NVppMExVMGZMNnpDN3FKVnk0bUppSFNMNEV0RzhiS3hRbGZuS3R2b2NYc3FD?=
 =?utf-8?B?Lzk1TWwwQUEyRXBVbnFha2hhUWh4bzBYa2VrL2NWaFNvVXFyVFIvT2xSK01i?=
 =?utf-8?B?c1htMnUzZFByNzBrRHNmc213N1FCWVJjTjdLTTlJRkRqSldtVnFWREdvdmFO?=
 =?utf-8?B?QzhmQ0syWFRrZVpYWWN4akE2TmtDa0pMbXFxYi9Td1VaYW5Jc1pqOTl1Wjdn?=
 =?utf-8?B?TzFWbHMvY2lJUnJ5a0hRaUJUc3FIdk5UOWd5N1JRZTY2dVd5MWZXNEJrKzNX?=
 =?utf-8?B?ODBPblBBc2hnVnZxbkg4SXlrdThVcjVSU21xOUNwdUprcnlQQS81NWZvaW5j?=
 =?utf-8?B?MnBDNDQzY2s0dXZ5VklIVVE5bUk5Z0xEQktpZ2xGVnh3eEhzcGIzQ1BLTlUx?=
 =?utf-8?B?eUdra3JuNGNhWWNIYkM5MDBKRlZ0cUh4NXUybXk4eGFBL3YxNUIzcm4renBv?=
 =?utf-8?B?bDFyWkVCSk5wd3lYV05iVXZ3VGxkRVd0YmNRZkhHZGJPWXByemFRVjRsRWM0?=
 =?utf-8?B?cll0cUltbU45YWoyYmErZ3NrNFEzV2VBejYwKzhHZEpwLysvZDdJVVl6V21q?=
 =?utf-8?B?UENJVURSZ1E2b1A5dFRnc2xBNFZqd3piUVJ5dnBvU1h5MDFROVUxQXJ0aEQr?=
 =?utf-8?B?ZkNTVE1RcEJ6RGIrR09aQ1dYMmZxcUlKTDIwazdIeHZtVWlFV2pSRzVGZWx6?=
 =?utf-8?B?OFpVYjdxN3ltYi9mZjcvUkxHTTdKOUo4U0dURktRc0N2SWZDUUFhY1JiR2Fr?=
 =?utf-8?B?bnJXQkU1bE84NFpJS0IxV3BNOGhOU2lQbXNrRWJyUjE4aVlMV093aVZMTWNI?=
 =?utf-8?B?ZVA3NW1HdWdPdTBFT09mMFhZMUdpYU04TGcxMitJbVprT1NVZVY3d000N3dD?=
 =?utf-8?B?eDNHL2V5U1MzczZ0WEJLZXhtOWloUUc5RFFMYlRSbEQ5K1daTHpaZ0ZrTmNV?=
 =?utf-8?B?ZWFLUTlVeFJIdTRrbktDd21LRVVTbTRBZld3YTZUN0p1T0U5QURORGh4ZnRB?=
 =?utf-8?B?OVFrbjlYVUZtK2Y1ajNvY01VNmJDeEJxQ1FxalBlL2czTEtEZ1VMUHptZldv?=
 =?utf-8?B?cEQ0K0FBcUV3YTV6b0NxVGMxS0ZLdzVqbDlNR3hDTDd6dlR5cGdESXdDYnIy?=
 =?utf-8?B?bWZ0YnRrdEx0amQwRkdXejVtaldOZTRvbU1LVnl3enNPT3F1czhPUFhaUEdo?=
 =?utf-8?B?eHhXeEw4TlMxRUFFK1M3dG80MmlFMG4xMWtMTnpOMVIyS1BHNFlZU1dBay8y?=
 =?utf-8?B?WjhJNmdCZ2RtV1Q3cWcrU3QvaERqd1ZBVXFvcjlUeEttVGhKNFNNYTYvcmcz?=
 =?utf-8?B?bVlZWHNla2NhM2RQUDU4Z1pLdERsMmliR3ZXTmUvYkRlVklXNTQwSWxDVDR0?=
 =?utf-8?B?ZSs0ZCttNTBWb3FwbXlaRjQ0NlFVR04rV3pOc3JZQ3hVdDlKY1RuVTRBc3U1?=
 =?utf-8?B?dkNKMlZTeFE2bTFBWmE1TC85dEJxMWc5aWpYSzJCNERxcFY3TnBJY2FkaFFj?=
 =?utf-8?B?Yzdsc0VJdEN6dWI2Q2txRXo0UjU2MlU2Szd3ODk1cE95Q1F6RS9obmFZdVN2?=
 =?utf-8?B?cWp5aUFKWENjL2g0TzdSOFBWb3FpSzdNdldhZ0ViZTMvajh5SFhOa3Joc0xy?=
 =?utf-8?B?YWtwMkNwT3NqaWZFdUsrM3g1M05VMmo4a1J2ZXBZS1U2UWlLL3dBMmR4UEtM?=
 =?utf-8?B?RlVrempiZ00wanRLc2FBUkRqZk9VSFpNWWtqSFk2N0dyUmJUajgyN0o4V2dZ?=
 =?utf-8?B?WG5nTllkQXhCb0FubDRyQ2ZRU2o3RkREMW5IVi84VUVuc1dnRzN0RHcyY0VB?=
 =?utf-8?Q?lqqZV0raQAnzKLjUZgWpv8FG0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a334c319-6b37-4d4f-5e36-08dca0263005
X-MS-Exchange-CrossTenant-AuthSource: MW6PR12MB8733.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 14:48:25.7158 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sD34ZtArygJZl438X681ZxcGKdq9SstQlJiuD+nqE5qftRLSqdIxUhEg7zcJsL1Df9aQ0dbSvuRcgoqmQkkOAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9002
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



On 6/29/24 5:18 PM, Mikhail Gavrilov wrote:
> On Sat, Jun 29, 2024 at 9:46 PM Rodrigo Siqueira Jordao
> <Rodrigo.Siqueira@amd.com> wrote:
>> Hi Mikhail,
>>
>> I'm trying to reproduce this issue, but until now, I've been unable to
>> reproduce it. I tried some different scenarios with the following
>> components:
>>
>> 1. Displays: I tried with one and two displays
>>    - 4k@120 - DP && 4k@60 - HDMI
>>    - 4k@244 Oled - DP
>> 2. GPU: 7900XTX
> 
> The issue only reproduced with RDNA2 (6900XT)
> RDNA3 (7900XTX) is not affected.
> 

Hi,

I also tried it with 6900XT. I got the same results on my side.

Could you try my suggestions from the previous email and report the result?

Also, I recommend to open an issue at:

https://gitlab.freedesktop.org/drm/amd

and add all the tests results in the issue description.

Thanks
Siqueira

