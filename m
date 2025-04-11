Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7035EA862AC
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 18:01:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 391A910EC0E;
	Fri, 11 Apr 2025 16:01:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="TP4863Ui";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060.outbound.protection.outlook.com [40.107.94.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 269B910EC1D;
 Fri, 11 Apr 2025 16:01:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GN0q1CQ+gBO07Xu0H84iwXV69nFI1mSu6jhQgUvTFo29ZVRcRKI8YNvhG5KwzBul1e4VbStzKAoS2OVx6ZkCmUkxSrM7n1YEY+3Uw8AexgHwSdG0nVef8drDkjNOik7IIctZauHMHeU0caqilBEtc5yjWbWMLb2/FRHtDjjHFT6TjK2IZsdM3JK50+6gXrPBcsVDzL1QsYPpnmxmWpfQzOyYM1vPXhkjO6oJkjTEg+rxct/QEC3VjgY6XjH5dMHD0DWWNLHITKA7zsgk+jF1eYgjZaT5r2061DoVdrhoMER7sXljgngk+9Lp/YCzNXWtmB1hwCzbty0ldRlfQumiFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YhSc35S/Iw6n1AXT/rsvCIMS2qCIe35QiXhiWFTLTpE=;
 b=b/9lixpRTRKO0KZm5+/Q83bYcLwNhZtd4tUzfGTzsMHzWqGTx597aLqCplrQjHSjP2KzGnI9tvl92PTu3gzrfWJU/8U/6s7YnU7SBxneK8LUzGl8W2lWWMx9ZiF8SKklFdnSE8ICxYqWjjhnTBncKlw1i+6Ras79coxyNjk5fifiP9Lm7JQGEZl3lei51Cas/z9vdphoS6bEbhA5Z9t6ySvsai3dnij2T5ydZDosk53BhWYDhdDdI9hB4wd0MajTV2CiioNALVyrSA3ci52KHAVY/Ez3a/rDaYEnA+oUxckGzkci5UTyYe38H9r8TAEerCHEgrO64mVc8jifONUGjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YhSc35S/Iw6n1AXT/rsvCIMS2qCIe35QiXhiWFTLTpE=;
 b=TP4863Uit2aJoHGU65AvBb2YtwyyFYnWv3Z0lxJ9kp20cM16PRVzkNIk7nGhTh9cMpEIhfUUBnSEMefDzcEvtAaae1YNu8Gn2GUnrUbfUCJgxlbOCPEoHyUJxf85IFUd500va3A/7JqfyyGogOItqwThMTqUUjinJ9O9Q4C8uNI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5753.namprd12.prod.outlook.com (2603:10b6:208:390::15)
 by CY8PR12MB7170.namprd12.prod.outlook.com (2603:10b6:930:5a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Fri, 11 Apr
 2025 16:01:08 +0000
Received: from BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e]) by BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e%3]) with mapi id 15.20.8632.021; Fri, 11 Apr 2025
 16:01:08 +0000
Message-ID: <4f173d3f-ef55-4a5e-ac29-192894e4d74f@amd.com>
Date: Fri, 11 Apr 2025 21:31:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] drm/amdgpu: update the error logging for more
 information
To: Alex Deucher <alexdeucher@gmail.com>, Sunil Khatri <sunil.khatri@amd.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20250411130428.4104957-1-sunil.khatri@amd.com>
 <20250411130428.4104957-3-sunil.khatri@amd.com>
 <CADnq5_Oo_9YEafxTXFPCuxvtKLUKCTpfM=M1yrBR97E2vhyrpg@mail.gmail.com>
Content-Language: en-US
From: "Khatri, Sunil" <sukhatri@amd.com>
In-Reply-To: <CADnq5_Oo_9YEafxTXFPCuxvtKLUKCTpfM=M1yrBR97E2vhyrpg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0120.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::15) To BL1PR12MB5753.namprd12.prod.outlook.com
 (2603:10b6:208:390::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5753:EE_|CY8PR12MB7170:EE_
X-MS-Office365-Filtering-Correlation-Id: be7d002e-71af-4ee7-9f5d-08dd79121255
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QlF3TkUwaTdBcWw5OVA5VU84SVc3Q2RGaUQ0blB4S3BFMGZhL3NraFZWdU1i?=
 =?utf-8?B?U1BTc2pMTjZFbXVuc21jUnFnU3NwQmZJaldBNW82R2dvVVRJZ1llU3NZa2J0?=
 =?utf-8?B?a3FoUk9EVGphYVlnUTJ4T01zV2VMbGNSb3p2RHdFRko5aW13ZmVXOEQzOG5S?=
 =?utf-8?B?VkRVeFdQZUpDdStVMlVLbkE5MzR4NzZrTTZuUzQyaUx6ZUZCc1dxQW5uOUsw?=
 =?utf-8?B?WHU5ZW9UNzR4OHliUnUzNE14dFVBSS9tcWZGeFFMVzJCOXBnYlZJajM5QWhs?=
 =?utf-8?B?NThwYys4REU5UHFUNlg5S282S2wrbTQ5QjZ0cDFGRExpU0I0b1RJeHFVQVND?=
 =?utf-8?B?TWs0WmJOK3FwTWNhMmVqY3g3WnRVR0pwRlNXOGdRaE5kbUlqV05WbjZFRmdS?=
 =?utf-8?B?OXVkUisra3paS0MybVR3M3pXelE2enUxbkJmUEtZbTBOSEZHUzNkNDJtRnA1?=
 =?utf-8?B?V3RodWlaRHFka3RlOEI4QXF5czB6U0x5ZEIyT2lpa0FwaE5ZWVVFTnhhSWlJ?=
 =?utf-8?B?am5ndkY2YSt2bDJodEF3VFFxTzFISlgwc3gzWDlKb2xXWDVyUWtFNHNSL0hI?=
 =?utf-8?B?NWtpamFxZEIzUWZMNTZoYmxDS3Q1bGdsWllyT1dQN2VKMjNyMzFhZTYyWmF5?=
 =?utf-8?B?aU9YN3loeFF2NkhMSkVJdW5uNThsK0ZRZERoVEp4blBrcVcxTlByU3JIME1r?=
 =?utf-8?B?WDJhZUhFZ1VyVy9kYU92Zm1lbjBsSi9Hc21lZ1Jyeis1RG5yV2Z2RWFwak5r?=
 =?utf-8?B?Z0dZMHFtUHpkRzU5UWZZdzN4NEtqUHhkTlQ2N1hraXNwbU5EY1g3NGFEcDlW?=
 =?utf-8?B?VTVWLzR5dnhmb3Vra2tGNCtTdm9GTHdtRjZUblliWDBxNG43cGFJSVVuZkdK?=
 =?utf-8?B?NUlRSUJ3dk1LWXpJRlY4Y3VSTGtpZjh0ZE1zOUZrZitjYnd1TGJGR1hBbFIx?=
 =?utf-8?B?alo1eHFHNHBqSXB4U2VBZUVOdnp2TUFQVVMzL1RQbzlhcWM0V0dpSG45MWc2?=
 =?utf-8?B?RklhaXpuZHZQbDNLTHBpVDdsOEVBbXhjZ043OWZPMWRHRzgrN3dsME1WdGxo?=
 =?utf-8?B?VUdWYWEzVmpneWlSSjdwL2NLaXl1R0c3VVVGN1lsaFg4SmRzVEt4OUlYbk10?=
 =?utf-8?B?TnFyaU16dnJPT2dGbldwRVdUN3k4NnhaOFFOd2t6SGVFMVhLenlaL0QvaWVV?=
 =?utf-8?B?WThkZ3hTVTFma1ZTKzdwVkFrdlN6bnFORHc4dzdSUksxVnYzSW5Rb25qU1d2?=
 =?utf-8?B?THpyTHpiaVFpemtoN3lnZUYzTjNlaCt2ZkZoeDZxVHZuVU1RVzNBVW1ud2Jm?=
 =?utf-8?B?eGhxeGtQRUxhYmR5QzFDb2o1TTdUaVZMVDlraWlEMXllL01UZXNXTnByUUJ0?=
 =?utf-8?B?bmhLSnFLUUhLUjEzckdnYWdrSTIwSlQ0U3hIK05JVWp1Vi84RWlJZkdEN1dt?=
 =?utf-8?B?NFBva0Y1YkRhMHJkRXI2M1lZNVAvcUkweEhyLytoRnpJS2dhS0VJbk9zbUlT?=
 =?utf-8?B?UVBaV0RkVTBIQ1AwTjhtTDRLUi9kKzdlWGIyQjh2ME9sTWRZbXlLNUc1ZCtU?=
 =?utf-8?B?dWcxRUtCZzdRNW40Wk8rc2Jpb2ZzUERTR1ZkWFVxdXVlTjJ3c3hzSWNaa2U4?=
 =?utf-8?B?cWdkTVMwL1RPdGVlT1Z1V3BtRjdydktPT3VuOXJLVVZkVDNTa3RIcXV6aGFQ?=
 =?utf-8?B?dnRSUlplNng0UXV3eWk5bExiRHEzWldtMGE0UFJmUWJtSzFoalg2M3JIdWVO?=
 =?utf-8?B?Q0ROOXVuL3RnbnZTaVByaDdSK003WUd5YmZIV2hkaEt6bTJyUnE2VzNaSmhn?=
 =?utf-8?B?Qm1MMlcvYm9iQWFRdzRSbW9lenRzMGtUaWhVRVNHWlM5dHc0VVRnTUJQLzlM?=
 =?utf-8?B?ajN3L2hIWjA0Zk1VRWt6cmNxNFRmZGM4eU5iTmtzSFZzUDRicU9oNFZuUStU?=
 =?utf-8?Q?S06uJG85s+U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5753.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFhjZHZzZE5kU21CUm8zNkpQSnlZK0RxL2VmUjQ3M3lybXpyT0EwNG90N2xV?=
 =?utf-8?B?UUVMN3VQYTFsY0tVM1l3ajJCaVNoRFpMNGVxMEY0d3BHZ3NCNmNzOVlmUFRK?=
 =?utf-8?B?bEdXeEZ1VlRHZER3bCtmblJ2eWVOa1hwaUg3RTh4aGl1RjNDZXVIZm9wUlFi?=
 =?utf-8?B?NE1Oa3ptTXk2SUkyL2NwZ0Z5VGhPVDlIdSt1aG9SeXYvK2ZTSi9VYWdWZUUv?=
 =?utf-8?B?Vm9nUXhpUzJqNnJnWENBSmwvd0hhOERnb0ZzTU4rU2lhRWtaZmcxaXgwZXFr?=
 =?utf-8?B?MzdyeU9VSzFIdk1PeWJyRFVISE9GOEx0V3krY3c3RDBhUS80NVBFcUxHM1Nv?=
 =?utf-8?B?eFh3cm1YL1BycVNMRUlYS3BNYzQ3NGRIdWx1bHhsQ2dmL3lCR2ZQRWlNMUdO?=
 =?utf-8?B?QjBUbHo5Y2J5eE1qc2RUL0w0cy9PaWQ0a2JXWjA4M1BGblZlTnIxcTVOUjdp?=
 =?utf-8?B?Zk5MTmVTLzdmMThKWmJFYldLYjNJQ1ovWEkzNDJRNlUrb2hZWFBSL0R4ekZ2?=
 =?utf-8?B?K1piUXhwREo2UWtIVEh2Z0x1ZEEzMUdUVnVPbWZYYTErZlp0c1FRK2F3OGlp?=
 =?utf-8?B?a3Zna1NkMXMvSmFlV0l2SjVJdnFYdlFXNGlZLzdja3J3TDVEVHZnQ09MaVdP?=
 =?utf-8?B?ZDhJcTd0Z1lURS90dGJXbEJ5eDk4VU1pVWt0RmNET21zZDNiam5LQ0cxVUh3?=
 =?utf-8?B?V3RyaU9nNDhCOTNMNk1KZlE1RVVkdTNWVzY3akQ0R3pNeUJrUFQ1OEU2cU9m?=
 =?utf-8?B?cXlKZXdTVDBCWTErWU5mdElvM0ZXdEZRZE9ZMmIwSmxybS9pSVZ5ZW84bkJV?=
 =?utf-8?B?U1Q4a0sxc05tOHZhTHJza25WOXZnWVhMTGZMU1BuUnZQRUQzT01yaHZBN1hs?=
 =?utf-8?B?cTM0ZDlvSnF6QldCbVhrTkpPbElLdE91WWVndDJBeWdDMndUcWJrSHJiaDNM?=
 =?utf-8?B?bGlQQmZTSThOemU5OWN4dVNHa2VsUHRmY2I4YjBFb1c2N2RQSjMvcU05VG44?=
 =?utf-8?B?MEFURXQ1bDRQdDRhQU5NWmx3UW5IVXFoSGx1TEY2dld1c2hJVTg3ejVaMmIy?=
 =?utf-8?B?V2xyOXJVditjT2p3Y05uY3dNeFpKVUFMSi8zTG9ZYk9OZnhaYjV2dWFEcUND?=
 =?utf-8?B?by80ejBGSXJRRHJWdkNwTjNTWlZDRkN6TkJhdm94YlJGVmJOY1F3cDFCWVBo?=
 =?utf-8?B?bVpiUytsTDJXUUxDQW1jQnJZVlNlK0pWaHZrbGZqUEl1L3NONlc5anlKRmJu?=
 =?utf-8?B?Qno2cUZoUzE0Mlloc1haU1dWWkQ0TVE5Mk9LU09XUFRNaXArRFh0ZnNCTXNm?=
 =?utf-8?B?UGVGRFVMWStHRnh1WXhuQXMwQ0xLMEhpelQ3T3VFNStuZEoyOE1zRGNuaHFh?=
 =?utf-8?B?aHY1dkhKQWRGcWtTVFVhekRlTU1TazBDV0dwMnY3VjFncVd6VXg5NE1kYTlF?=
 =?utf-8?B?Z3V1T2Q1anZJYkN6cVU0c3FHN3JyMWcyckxhbDlrMTRSSzFFRFFXVjRNUlJ0?=
 =?utf-8?B?bHhMUE5NSW9xdXNUbVI0cU5tZWFXbnhBSnVNaHZNLzZDSWFIMUFjVHNyR3RH?=
 =?utf-8?B?dHdOcDBMcG1sS2lDUXhseEZKSFprQXpOaldGUlBPbTc4TmdLTnFHV1dsT2xD?=
 =?utf-8?B?VmFrNkZvY3BMSGxMRmFyWU5lbXJtRGVScEdEekY5SjRiUWY3ZTUxSzRVTGZl?=
 =?utf-8?B?Skl0a2tRVVM4L0FjZTgyckkzNnpFWXdCUG9EelE1VldjYnRNSUpOZFhmVUIw?=
 =?utf-8?B?L1J5NFcwRisyTG83OXBxQmp2bWZpSk9heTlVcnFJbDVxd1FMRXZLMkZYU0JX?=
 =?utf-8?B?RGwxb0NQZTVQWnRwUVNtYVo5SkY2S01rUWVPS0xSU1RRL1c5ZURML25iL0pU?=
 =?utf-8?B?WDVMZWo2dytldlBkdld2SkVKdkhnZTdoM2dMMFk2MFFVaXU1Qlk2dzRhN0RJ?=
 =?utf-8?B?TEJyVFZtTHZRUkljTklpM28zRzB1WEV4aHBmZ0I2WnR4cWRtQlZ3QUZYcito?=
 =?utf-8?B?R2dZd1ljN2ZxU0d6MGF1bVg5L280WWR3bGNUVnZIZDFFZVBvNndtcVpsUXdH?=
 =?utf-8?B?NnIzUnR4ZFlGWjVORlY3SVphVjZOKy9PMnJwMk1ORXVXN2pFLzduWTFIY0cr?=
 =?utf-8?Q?k1d4dXV0BzKLVxudOfBJHYfuD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be7d002e-71af-4ee7-9f5d-08dd79121255
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5753.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 16:01:08.3705 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oIHT8wMZUFc+Bwu3w21cKXzpdk95qv9f6+DEifClGU+PTHuL/4NylVbID0pDUnEKRwq1tqqHYIn2zWlSIHzpfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7170
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


On 4/11/2025 7:54 PM, Alex Deucher wrote:
> On Fri, Apr 11, 2025 at 9:05 AM Sunil Khatri <sunil.khatri@amd.com> wrote:
>> add process and pid information in the userqueue error
>> logging to make it more useful in resolving the error
>> by logs.
>>
>> Sample log:
>> [   42.444297] [drm:amdgpu_userqueue_wait_for_signal [amdgpu]] *ERROR* Timed out waiting for fence f=000000001c74d978 for comm:Xwayland pid:3427
>> [   42.444669] [drm:amdgpu_userqueue_suspend [amdgpu]] *ERROR* Not suspending userqueue, timeout waiting for comm:Xwayland pid:3427
>> [   42.824729] [drm:amdgpu_userqueue_wait_for_signal [amdgpu]] *ERROR* Timed out waiting for fence f=0000000074407d3e for comm:systemd-logind pid:1058
>> [   42.825082] [drm:amdgpu_userqueue_suspend [amdgpu]] *ERROR* Not suspending userqueue, timeout waiting for comm:systemd-logind pid:1058
>>
>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c | 45 +++++++++++++++----
>>   1 file changed, 37 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c
>> index ecd49cf15b2a..5b58c41618ee 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c
>> @@ -62,12 +62,17 @@ amdgpu_userqueue_cleanup(struct amdgpu_userq_mgr *uq_mgr,
>>          struct amdgpu_device *adev = uq_mgr->adev;
>>          const struct amdgpu_userq_funcs *uq_funcs = adev->userq_funcs[queue->queue_type];
>>          struct dma_fence *f = queue->last_fence;
>> +       struct drm_file *file;
>> +       char proc_log[50];
>>          int ret;
>>
>>          if (f && !dma_fence_is_signaled(f)) {
>>                  ret = dma_fence_wait_timeout(f, true, msecs_to_jiffies(100));
>>                  if (ret <= 0) {
>> -                       DRM_ERROR("Timed out waiting for fence f=%p\n", f);
>> +                       file = uq_mgr->file;
>> +                       drm_process_info(file, proc_log, sizeof(proc_log));
>> +                       DRM_ERROR("Timed out waiting for fence f=%p for %s\n",
>> +                                 f, proc_log);
> user drm_err() here and below so we get proper handling of multiple devices.
>
> Alex
Sure Alex. Once i have the main drm patch reviewed would update these too.
Sunil
>
>>                          return;
>>                  }
>>          }
>> @@ -427,6 +432,8 @@ amdgpu_userqueue_resume_all(struct amdgpu_userq_mgr *uq_mgr)
>>          const struct amdgpu_userq_funcs *userq_funcs;
>>          struct amdgpu_usermode_queue *queue;
>>          int queue_id;
>> +       struct drm_file *file;
>> +       char proc_log[50];
>>          int ret = 0;
>>
>>          /* Resume all the queues for this process */
>> @@ -435,8 +442,12 @@ amdgpu_userqueue_resume_all(struct amdgpu_userq_mgr *uq_mgr)
>>                  ret = userq_funcs->resume(uq_mgr, queue);
>>          }
>>
>> -       if (ret)
>> -               DRM_ERROR("Failed to resume all the queue\n");
>> +       if (ret) {
>> +               file = uq_mgr->file;
>> +               drm_process_info(file, proc_log, sizeof(proc_log));
>> +               DRM_ERROR("Failed to resume all the queue for %s\n",
>> +                         proc_log);
>> +               }
>>          return ret;
>>   }
>>
>> @@ -585,6 +596,8 @@ amdgpu_userqueue_suspend_all(struct amdgpu_userq_mgr *uq_mgr)
>>          const struct amdgpu_userq_funcs *userq_funcs;
>>          struct amdgpu_usermode_queue *queue;
>>          int queue_id;
>> +       struct drm_file *file;
>> +       char proc_log[50];
>>          int ret = 0;
>>
>>          /* Try to suspend all the queues in this process ctx */
>> @@ -593,8 +606,12 @@ amdgpu_userqueue_suspend_all(struct amdgpu_userq_mgr *uq_mgr)
>>                  ret += userq_funcs->suspend(uq_mgr, queue);
>>          }
>>
>> -       if (ret)
>> -               DRM_ERROR("Couldn't suspend all the queues\n");
>> +       if (ret) {
>> +               file = uq_mgr->file;
>> +               drm_process_info(file, proc_log, sizeof(proc_log));
>> +               DRM_ERROR("Couldn't suspend all the queues for %s\n",
>> +                         proc_log);
>> +               }
>>          return ret;
>>   }
>>
>> @@ -602,6 +619,8 @@ static int
>>   amdgpu_userqueue_wait_for_signal(struct amdgpu_userq_mgr *uq_mgr)
>>   {
>>          struct amdgpu_usermode_queue *queue;
>> +       struct drm_file *file;
>> +       char proc_log[50];
>>          int queue_id, ret;
>>
>>          idr_for_each_entry(&uq_mgr->userq_idr, queue, queue_id) {
>> @@ -611,7 +630,10 @@ amdgpu_userqueue_wait_for_signal(struct amdgpu_userq_mgr *uq_mgr)
>>                          continue;
>>                  ret = dma_fence_wait_timeout(f, true, msecs_to_jiffies(100));
>>                  if (ret <= 0) {
>> -                       DRM_ERROR("Timed out waiting for fence f=%p\n", f);
>> +                       file = uq_mgr->file;
>> +                       drm_process_info(file, proc_log, sizeof(proc_log));
>> +                       DRM_ERROR("Timed out waiting for fence f=%p for %s\n",
>> +                                 f, proc_log);
>>                          return -ETIMEDOUT;
>>                  }
>>          }
>> @@ -624,19 +646,26 @@ amdgpu_userqueue_suspend(struct amdgpu_userq_mgr *uq_mgr,
>>                           struct amdgpu_eviction_fence *ev_fence)
>>   {
>>          int ret;
>> +       struct drm_file *file;
>> +       char proc_log[50];
>>          struct amdgpu_fpriv *fpriv = uq_mgr_to_fpriv(uq_mgr);
>>          struct amdgpu_eviction_fence_mgr *evf_mgr = &fpriv->evf_mgr;
>>
>>          /* Wait for any pending userqueue fence work to finish */
>>          ret = amdgpu_userqueue_wait_for_signal(uq_mgr);
>>          if (ret) {
>> -               DRM_ERROR("Not suspending userqueue, timeout waiting for work\n");
>> +               file = uq_mgr->file;
>> +               drm_process_info(file, proc_log, sizeof(proc_log));
>> +               DRM_ERROR("Not suspending userqueue, timeout waiting for %s\n",
>> +                         proc_log);
>>                  return;
>>          }
>>
>>          ret = amdgpu_userqueue_suspend_all(uq_mgr);
>>          if (ret) {
>> -               DRM_ERROR("Failed to evict userqueue\n");
>> +               file = uq_mgr->file;
>> +               drm_process_info(file, proc_log, sizeof(proc_log));
>> +               DRM_ERROR("Failed to evict userqueue for %s\n", proc_log);
>>                  return;
>>          }
>>
>> --
>> 2.34.1
>>
