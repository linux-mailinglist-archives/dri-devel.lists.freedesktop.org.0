Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC66393CE7D
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2024 09:06:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31D7910E932;
	Fri, 26 Jul 2024 07:06:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="IlQr8PtX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2069.outbound.protection.outlook.com [40.107.102.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C28510E92E;
 Fri, 26 Jul 2024 07:06:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eimu/adX1tSm5YETprCgPn8Xqka3Qc9zEMOA3usEj0l4VmB8dBPgJOKLJ75b/JlFQuY+EYjEXlyuQeDUQ/KDPT6OUu8OAoGPmWZHuyavZgjJs39Da2K6hnphRD9Neep1tb/yZStaPJcUDBPuPr4ntARvS2vlo40/m6f14NQGGUBnP90Nh8xCINXQYVLcUo4226DNMFPegPldaI1pURXePLmw1xmvq/A5TxJjjhJuW6VKzG3UGvD1gpYavEAsdnCD/sMCCVGxGmdpF+pLlo8T/NVmMRsUP1JkBxJZkbyOvogAIdLJYvIiOUA7etdoSDcB4BueBgHRYQL03Lts+/elOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AWMNPnbbIZ4OQsQ8DC6joLsuFC7VHDX4HYE5OCutceM=;
 b=cqCppQIZe90Gc6AKEdnFYNyquqt6SjEFMXpBa+fVjfShDivcC9oBhbottXrA8TddigiPOH6++AWM9qGM7WtDJ69CzBVUL5LuZyxPoeCkc2oAyjqParU7hdLg2Fpo5IxE4xXBjHHQiRr4qhbpnDibpc9H09Nltoj7FD9tJrZEdRlKPgdNouIddd/GL3Os+uOHqkOEvReSNLYkkaQieVX+bzVCL95uOzyVRckeCFQuJYqNfpmB/hc/1t5S/tIC242tn5p0vQbP8YSSxy/kDpkWLPW+hXBa8Sx5ACNVlXIJZyYdgIfTJ/VJf2AqYAMN9xDeR91qNVi8qH4OJoA0wkzCAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AWMNPnbbIZ4OQsQ8DC6joLsuFC7VHDX4HYE5OCutceM=;
 b=IlQr8PtX5RBVlGOm5NtjXu2DXdw9ax0DWERwiA5hxW54bdZtigCTjIz13K5qsW8rBMviWO/HOS7L+HI1o1jOHy4yfB9GqXAnFNZ6MpyLXOPJ/RFgsuLwpIYpS87VuiCY/LUtf5cUC8kuPu2BeyW3OwuU0Y9KRwjX9+QSNRKHBtc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB5841.namprd12.prod.outlook.com (2603:10b6:8:64::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Fri, 26 Jul
 2024 07:06:22 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7784.017; Fri, 26 Jul 2024
 07:06:22 +0000
Message-ID: <1da9294d-3775-4387-be5f-408592c89bb7@amd.com>
Date: Fri, 26 Jul 2024 09:06:17 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/radeon/evergreen_cs: fix int overflow errors in cs
 track offsets
To: Alex Deucher <alexdeucher@gmail.com>,
 Nikita Zhandarovich <n.zhandarovich@fintech.ru>
Cc: Alex Deucher <alexander.deucher@amd.com>, Xinhui Pan
 <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jerome Glisse <jglisse@redhat.com>,
 Dave Airlie <airlied@redhat.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org, stable@vger.kernel.org
References: <20240725180950.15820-1-n.zhandarovich@fintech.ru>
 <CADnq5_NuAL4=hMyc6G0QkbSrjCXa6qFM-bFtt3A7DY6cCmCt9w@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CADnq5_NuAL4=hMyc6G0QkbSrjCXa6qFM-bFtt3A7DY6cCmCt9w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0403.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cf::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB5841:EE_
X-MS-Office365-Filtering-Correlation-Id: 80cc2e47-5cbf-4b43-3a52-08dcad417480
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MSt3cVNtTnhQRDcwUXZVaDBGbzVZMVBSZVRmYkMwUmlxb2VkakdpQThLRk4z?=
 =?utf-8?B?c0tKS1hHcmplRkwwWjIrK1hBeDZFWHVDZnUzdk5YR2d6blVWR2pkQUN5SmIw?=
 =?utf-8?B?U0VaMEduK0pnRVR4WjNia1p1eGYyZmRzWEJvdWF5MVZ5Vk8xNkw1VWh3QWYw?=
 =?utf-8?B?NHNXejh6azlRNWpNSWxZL3dNV3lRZ2FMRDdSTGR6WnFxcEdtNFlXV2sycUJ3?=
 =?utf-8?B?d0Z1aEc3a3FIWTNqN1ZQQTJSelh2K2gyU2lyTG13dWdGTzV5UFg5QjdNSWcr?=
 =?utf-8?B?NEpHUGJ5WjloQjUzdUNLT0NzbUVYUGR0eURzVGJjVDRCVEcyVnBPZlRFZjlN?=
 =?utf-8?B?S1duQW5CbmNGQUJDQ1RwVW5nN2RPWnFRcnZlSjJDVlhmemcvUVV5SmowSDZl?=
 =?utf-8?B?c3BmSFlDdmFqTmFST29IZks0ejRGYjFzK1pPN3ViOGF6SStLWmMxYkNacG1p?=
 =?utf-8?B?NHN2R0NQYkJpSnpMclNMQTFhSjBXbS9BSlZRMlF6UVVGclBtMTNIV3UxTnU2?=
 =?utf-8?B?a28ydEFwSWlSWlRMZU9MejhaaWp6c1BCazRSVmszUEVpZG82ME4yY2NkR3BC?=
 =?utf-8?B?azFYN0w5K3NaakFTczhJZ1Y0ZkM2cjl2dmFNU0hyTk1kMU1tdU5IQThTNkhN?=
 =?utf-8?B?Z1MxREU0bDF1V3lONzRLQlRvakJ5THRNaG5DZmIzVWNqVXFUTDBpRDNxSjBt?=
 =?utf-8?B?MzVCSEQ1bGpSbHArMnF2NVhWR2p6RXdsQTRyUG5SS2N5K2FycXczTTRXNlUx?=
 =?utf-8?B?VlpkZnUweFluSGRoVUJ5cmpjc21Ea0NvaVcvdHJPc21pQ2RXQ1E1TjdjbXIv?=
 =?utf-8?B?N3N6WW9XOWovOFBkSzV3QXhBRDk3TFc0VTZDZlFGTy82dTBDbkhmYXRzdzRa?=
 =?utf-8?B?L0Z6UG5YU290RGpOYk9QRWxPOW5nODRVV1o4Wm5pNW8xNGhVa3NsU3k4TWNR?=
 =?utf-8?B?S1JWaXZxVlJoZnNEMDd5SGhuaFE0c3UvbFNOd3diZGUxLzM5Sm9pcGhMQkJz?=
 =?utf-8?B?RW1RR3lkVktSRm1mQmVRT2s5SjdHTnRNMDZUMzFyRWk3K2NBUG1EYkZQdTZH?=
 =?utf-8?B?eTB4TGRKcGpuWWhpcGQyUCtOSjdSelJVc0pnQUhvUm5razFnTmdHRGwzd3BX?=
 =?utf-8?B?YUlLaVFnZHRwdFo0QVJBQ0Y3dWZ1MGhmOEl0M0hBVzYvUmEvT0xLYkR2anJw?=
 =?utf-8?B?OG1jQmQ2UTk2YmwzWVA0ODRHWElXOXF4VTNUZmhIZWhZa25IeWNnWjgvbWds?=
 =?utf-8?B?ZDZxVmNOVnFsdWZFRGc0THcvcW9yU3R4SUVyMmI5Z0EvcFFCTXVwT2VYM01H?=
 =?utf-8?B?cnhzcDRpLzRSZFdtdnZ2OWJFb3BCeUFNZCtZUEpWS3RzS0hqblhPcm9oTFdU?=
 =?utf-8?B?NkJvaVNZb1Z2NkcrNytGek1rUFFMUVExemdxdCtsdGFZNGZRM1ljYS9kYUVa?=
 =?utf-8?B?VXF1TW5jM0UvakxTTzFGSDlHMi9rYnYrNzlNLzJ1RWJqTk11Z0d0OEErTjZV?=
 =?utf-8?B?QUxxQ2EvK0pMdnVraXBlY0d2VTZMOWpyb25vVjJPQmhSa3ZuVGU4SXI1dzdI?=
 =?utf-8?B?a1FjRUFGMDVPdmYveEp0M2t0RE9Jd3hDcE92eXVqRTh5M2NxSzhVTXY0eXVG?=
 =?utf-8?B?d05rME5kSGZqMXhyNFIwTUNGNnVrVnF5anA4Z2U4SThNVG1Ld085RllTTjc1?=
 =?utf-8?B?Q1RuU0Q3cUZtSnprSElGY1FQUk5CR2M1cVNPOUxQcjNrdE5RN2tOT28xaFgr?=
 =?utf-8?B?YXdOMmMyQXZnbWtlVEtiZDRkL0orWlQxeWYrSFJTcmt1S2krM1dnRkgyeTkx?=
 =?utf-8?B?dHhRM05pdEpKVjViaFJYUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bnJmdGc4WUwrS0xQTUtlS2NVY0F6STN4R2NUbytqaTFqZ0IvL0ZqLzVneWk5?=
 =?utf-8?B?MStZVUJuT3ozSGwzeGxvM3g5WUJrd1Yya0xITzlJU1ByZ0xIRWJTTmIxUkVw?=
 =?utf-8?B?bG5GMVVDZW40WnB4cEdVZnUvUEZiV1BxTHJya1BjMUE3R2ZPTVU4OVFDVWZZ?=
 =?utf-8?B?TmlBOEllY25VNEpNZUx0ZFhleDRPbUNFZ2VGRy9xRnFDem91dm4zTVdhVkhK?=
 =?utf-8?B?UVY2aktITE1hVm9GbUdnZUJtbWNwNEJIYWxCMmJUZE1PUkpnT2ZwMXhlcGF5?=
 =?utf-8?B?dVlJQkUwN1VTQ21vd2JKUUQ1VityOCtzaXpUcU5DZHVXd1ZLeEsyTTA2SDBa?=
 =?utf-8?B?UDVPc1BPZ2NYN3Y2NHZHeGpoVHNkNnVUUmEyWFFUcERnaGxCMlZ1YXFGZTZY?=
 =?utf-8?B?bDFjMzNwM2JtQit1SXdpcjZ5dUJrN1M5UU5tUWxoNjNBOTIxcXJ5SmZNYnRt?=
 =?utf-8?B?TG5qcDdpQkF6L1BycE5FYVZNQWZseFNyL29zaUhQeGczSC9mYUNsSzdDd2tT?=
 =?utf-8?B?UmpnYWxtcFMwcituTVRJem1yM1RZWFRpNGl1Q0ljdEswRjBZKysxVXBTdkU1?=
 =?utf-8?B?WjU5dVhEb0NZQmFVUFlIbkVrZm54bkVaYWV2QW9EN05JRUh3NisrMzVScWRI?=
 =?utf-8?B?WS92OUJBa3YyMXpmL1BhUWQyNUJIWjY0Q3NmcXorT09iUTg2K2x1bVIzTFk0?=
 =?utf-8?B?VnpQdWdISUp0QkRiR3lka0J1cFRZOWR4L1BtWlEydnlMRTZ3Nlp4NC9xcUpQ?=
 =?utf-8?B?c2NNNzB1cWxRRGRqVk5tdm9neGs2bmNMMXQ5bXI4ZWJpSXVMY09weU5TS0Jy?=
 =?utf-8?B?YWIwQmFmZlRDaXRWclF2ZWg2c3VnWDhNbnFHV3k1bGlDeDdDVkJ2KzNTR1pU?=
 =?utf-8?B?ZTl2SFdReVNDY1NpdTREQnpBVExqbEM3RFVyMi9SOXdVKzB2VnFacUFxSU90?=
 =?utf-8?B?TE5hN0s1S0RPMHQxcE0yQklmMHFBWmhXRXk1QXZwT0hWSWFQbEh4c0VnajFw?=
 =?utf-8?B?Z0N1a3dGQVQwNnVDdVlHZUVQbmJsV3Rpa1Q2dUVNUTJ1Y1oyYTRCVmMrTHN5?=
 =?utf-8?B?VGVGZ3ZSKzdKQXNuV0pNdXJqdWZudzljYnpCRmtiQkFyQVJ1SFBOdjVaL2s1?=
 =?utf-8?B?N1pQN250eFdDZHpGa2QvMSt2ZERLOENXem9tdHZ4bmNMTnNTREE0MjU2OUo1?=
 =?utf-8?B?Z3g1cG1YazlFNENCeXdRRWtsbW40UGIvaW5ta1B6bFlYM3BIcjF0TTJONlhU?=
 =?utf-8?B?RXU1Z3YvSmI3OHY0RTFxbzh1QmNzcjAxekJ4M3hJWmNRKytWcEVQZVRiM3JU?=
 =?utf-8?B?UTlNT1hvdGtiVW1KYmhOZE8rbkZuRklZNGpXMHlrQWl6SFAwZzZENWM4Z0Z3?=
 =?utf-8?B?QXVkK1ZUejJydG1YQ2xQUmFadG1ndXBVcnZjVTE3T1F2Nm9EbXNxU25xSXZK?=
 =?utf-8?B?emZTOEc4RkF3VXFNL1JjSjgzK2NUdkpKYnpiZEkxV0Z3aEJWOXE3VXc2bkEz?=
 =?utf-8?B?MjY1QnUwQUZoaHZPcURNN3FvVDgrTnc3U0NjUjNUc0JxcU4yclpUNWVKY1BP?=
 =?utf-8?B?aHY0VG5QQklTNjFmaGxXdTV6d284U3lTQU4rbS9SMjd1TXlOY2w4UklHdnlm?=
 =?utf-8?B?d3BrOUpNNlVDdXJXZHN1eVU4b0h4NW80TTNTNWVkN1RmaEx3dmI0VHlDOGU0?=
 =?utf-8?B?S1BEaWVaMEdHVW1XSFpUME9WSVQza2xsVXdEV0NVSE5hR1pWTnBYZXBCK2pz?=
 =?utf-8?B?R3hjYmhqUlBXcThPVk5HWWJmczJKK1gwNEF5cTNJdVFiY2U4eVVMZ2RPUWhC?=
 =?utf-8?B?b3o5bVNhNnZSTHRqSHQrN1VNTUpxQlFQdjI3Mzl1dkxWRXhaYzVKcTk4M1F4?=
 =?utf-8?B?MlJDNGJla2RqMTBxdEg3d0dGL25hY2YvMXRRcndQc25YTGlCVmNWQngyNmJT?=
 =?utf-8?B?c2xIcFhYOEJJakJjcm9CK0k3eklyZ2Rka2N1dlNOV2ZIMjQ4aks3N0wvVUdC?=
 =?utf-8?B?TzBqRUx2QTArUnF5ekV5allFSFpzZUd0YlZ1cU1YQXh6elg4K2hZR0lFa0t3?=
 =?utf-8?B?SExwRkJVU3hqUWxwZVdOVW9GNEtjM0x3bjd6RzhUS0ZRMEhiQUxwazVFdXdQ?=
 =?utf-8?Q?Xza6heF7I4sOtHCetEsbtuOVw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80cc2e47-5cbf-4b43-3a52-08dcad417480
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 07:06:21.9728 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gb7rvFKClmMkIRjdTPEoYdyMDKuPVAlQhXATDNv44sLaN6DEB97ZD9DkWZ1nbus8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5841
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

I strongly suggest to revert that again. See my other mail.

Christian.

Am 25.07.24 um 22:59 schrieb Alex Deucher:
> Applied.  Thanks!
>
> Alex
>
> On Thu, Jul 25, 2024 at 2:20 PM Nikita Zhandarovich
> <n.zhandarovich@fintech.ru> wrote:
>> Several cs track offsets (such as 'track->db_s_read_offset')
>> either are initialized with or plainly take big enough values that,
>> once shifted 8 bits left, may be hit with integer overflow if the
>> resulting values end up going over u32 limit.
>>
>> Some debug prints take this into account (see according dev_warn() in
>> evergreen_cs_track_validate_stencil()), even if the actual
>> calculated value assigned to local 'offset' variable is missing
>> similar proper expansion.
>>
>> Mitigate the problem by casting the type of right operands to the
>> wider type of corresponding left ones in all such cases.
>>
>> Found by Linux Verification Center (linuxtesting.org) with static
>> analysis tool SVACE.
>>
>> Fixes: 285484e2d55e ("drm/radeon: add support for evergreen/ni tiling informations v11")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
>> ---
>> P.S. While I am not certain that track->cb_color_bo_offset[id]
>> actually ends up taking values high enough to cause an overflow,
>> nonetheless I thought it prudent to cast it to ulong as well.
>>
>>   drivers/gpu/drm/radeon/evergreen_cs.c | 18 +++++++++---------
>>   1 file changed, 9 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/radeon/evergreen_cs.c b/drivers/gpu/drm/radeon/evergreen_cs.c
>> index 1fe6e0d883c7..d734d221e2da 100644
>> --- a/drivers/gpu/drm/radeon/evergreen_cs.c
>> +++ b/drivers/gpu/drm/radeon/evergreen_cs.c
>> @@ -433,7 +433,7 @@ static int evergreen_cs_track_validate_cb(struct radeon_cs_parser *p, unsigned i
>>                  return r;
>>          }
>>
>> -       offset = track->cb_color_bo_offset[id] << 8;
>> +       offset = (unsigned long)track->cb_color_bo_offset[id] << 8;
>>          if (offset & (surf.base_align - 1)) {
>>                  dev_warn(p->dev, "%s:%d cb[%d] bo base %ld not aligned with %ld\n",
>>                           __func__, __LINE__, id, offset, surf.base_align);
>> @@ -455,7 +455,7 @@ static int evergreen_cs_track_validate_cb(struct radeon_cs_parser *p, unsigned i
>>                                  min = surf.nby - 8;
>>                          }
>>                          bsize = radeon_bo_size(track->cb_color_bo[id]);
>> -                       tmp = track->cb_color_bo_offset[id] << 8;
>> +                       tmp = (unsigned long)track->cb_color_bo_offset[id] << 8;
>>                          for (nby = surf.nby; nby > min; nby--) {
>>                                  size = nby * surf.nbx * surf.bpe * surf.nsamples;
>>                                  if ((tmp + size * mslice) <= bsize) {
>> @@ -476,10 +476,10 @@ static int evergreen_cs_track_validate_cb(struct radeon_cs_parser *p, unsigned i
>>                          }
>>                  }
>>                  dev_warn(p->dev, "%s:%d cb[%d] bo too small (layer size %d, "
>> -                        "offset %d, max layer %d, bo size %ld, slice %d)\n",
>> +                        "offset %ld, max layer %d, bo size %ld, slice %d)\n",
>>                           __func__, __LINE__, id, surf.layer_size,
>> -                       track->cb_color_bo_offset[id] << 8, mslice,
>> -                       radeon_bo_size(track->cb_color_bo[id]), slice);
>> +                       (unsigned long)track->cb_color_bo_offset[id] << 8,
>> +                       mslice, radeon_bo_size(track->cb_color_bo[id]), slice);
>>                  dev_warn(p->dev, "%s:%d problematic surf: (%d %d) (%d %d %d %d %d %d %d)\n",
>>                           __func__, __LINE__, surf.nbx, surf.nby,
>>                          surf.mode, surf.bpe, surf.nsamples,
>> @@ -608,7 +608,7 @@ static int evergreen_cs_track_validate_stencil(struct radeon_cs_parser *p)
>>                  return r;
>>          }
>>
>> -       offset = track->db_s_read_offset << 8;
>> +       offset = (unsigned long)track->db_s_read_offset << 8;
>>          if (offset & (surf.base_align - 1)) {
>>                  dev_warn(p->dev, "%s:%d stencil read bo base %ld not aligned with %ld\n",
>>                           __func__, __LINE__, offset, surf.base_align);
>> @@ -627,7 +627,7 @@ static int evergreen_cs_track_validate_stencil(struct radeon_cs_parser *p)
>>                  return -EINVAL;
>>          }
>>
>> -       offset = track->db_s_write_offset << 8;
>> +       offset = (unsigned long)track->db_s_write_offset << 8;
>>          if (offset & (surf.base_align - 1)) {
>>                  dev_warn(p->dev, "%s:%d stencil write bo base %ld not aligned with %ld\n",
>>                           __func__, __LINE__, offset, surf.base_align);
>> @@ -706,7 +706,7 @@ static int evergreen_cs_track_validate_depth(struct radeon_cs_parser *p)
>>                  return r;
>>          }
>>
>> -       offset = track->db_z_read_offset << 8;
>> +       offset = (unsigned long)track->db_z_read_offset << 8;
>>          if (offset & (surf.base_align - 1)) {
>>                  dev_warn(p->dev, "%s:%d stencil read bo base %ld not aligned with %ld\n",
>>                           __func__, __LINE__, offset, surf.base_align);
>> @@ -722,7 +722,7 @@ static int evergreen_cs_track_validate_depth(struct radeon_cs_parser *p)
>>                  return -EINVAL;
>>          }
>>
>> -       offset = track->db_z_write_offset << 8;
>> +       offset = (unsigned long)track->db_z_write_offset << 8;
>>          if (offset & (surf.base_align - 1)) {
>>                  dev_warn(p->dev, "%s:%d stencil write bo base %ld not aligned with %ld\n",
>>                           __func__, __LINE__, offset, surf.base_align);

