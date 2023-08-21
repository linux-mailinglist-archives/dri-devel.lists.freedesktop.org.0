Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A467829BE
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 15:00:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DD8010E249;
	Mon, 21 Aug 2023 13:00:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2055.outbound.protection.outlook.com [40.107.94.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 675BE10E247;
 Mon, 21 Aug 2023 13:00:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K7ltfhD3OxemPtNwO55r3pmFs5KqTdWR6Spq58+orPdQn25mOmaVZD8KAakBe5cvnfuOeaoNVaRUzidvM4eQiUnoQyUKexmQAfkGJ9GEDLe+HQeFstCiIOWqlEZkbVIZMArnXvJERE3EMqKolB+ahypITQHaJBsAow5jBS0q+ZetRThnwHHlpXdkZVGsj8p1Px0zr4GWFOAdcSD1qbj0o3Uw1URsinARNvbypxOKGcLNJAHOmc/sG4U+LOGP0JRTRdJLRXbwrhcPose3sH0NGyUKkzCtaoLggnM968k6z1iu6ZbL0u0bZf1Dz6rsbT9jiv9HmHsZQWAACcL5aXPoAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CCL6n89sXFPlYBpHyOCY5Znsoz1gPA9N4+cKQwx/w4o=;
 b=D8Z5arwNQi2J++jN/vgspF40r1PX+PvcDA24CbSBLBFAUmrVnPOeW/BQHMkaskOI6hO83UacqG7QIr5CjKkisvmjnhOaa2n7b9V9BLHvxyIvtZ1AjBjb1mawzU3j7dlTej96YSAA07wUg2cPtlaYOoB4Nvwbc6SJIbp2f7Y0Ok+c21aLuwz2lKWSlKomwEzqUM2+suSBH7SlBTE9CQ7EEy6dqqvZJ+lbS4XtPwWRk4djriwMGhKVrldfxmaqsnWL1KXPr0zQfSv11wJ1beBos+QpvT4Av6QdO4IIpwzrjBuJixxA5+XRbQ/upppouXZfhlJ5wqFi7a7Oo8Yxgymxtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CCL6n89sXFPlYBpHyOCY5Znsoz1gPA9N4+cKQwx/w4o=;
 b=PgbkaHK4MZK8enVtVACZdf5rbd18ReLj/BIg4/ufo0FsZWisxk//Ls9iydMZJ/9uFcfKEZu79k+iY6YNt4qxFH0QRaXJ9jAkt6Vfkhjulk7TDFgBgEjYUQNI+rlG1VP/dYXBUTavtjQOHVPZiQimORS6d2FlKXDXpe89cd0LsYM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW4PR12MB5667.namprd12.prod.outlook.com (2603:10b6:303:18a::10)
 by DM4PR12MB6134.namprd12.prod.outlook.com (2603:10b6:8:ad::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Mon, 21 Aug
 2023 13:00:25 +0000
Received: from MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::dc06:ffb3:46ec:6b86]) by MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::dc06:ffb3:46ec:6b86%3]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 13:00:25 +0000
Message-ID: <09943fe4-792f-e2b8-05d0-2c11f688b8bd@amd.com>
Date: Mon, 21 Aug 2023 15:00:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 0/4] drm/amdgpu: Explicitly add a flexible array at the
 end of 'struct amdgpu_bo_list' and simplify amdgpu_bo_list_create()
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Arunpravin.PaneerSelvam@amd.com, "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 "Somalapuram, Amaranath" <Amaranath.Somalapuram@amd.com>
References: <cover.1692524665.git.christophe.jaillet@wanadoo.fr>
 <5d52550a-92a1-55e7-69ad-92f18330ff48@amd.com>
Content-Language: en-US
From: Shashank Sharma <shashank.sharma@amd.com>
In-Reply-To: <5d52550a-92a1-55e7-69ad-92f18330ff48@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0110.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7b::18) To MW4PR12MB5667.namprd12.prod.outlook.com
 (2603:10b6:303:18a::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB5667:EE_|DM4PR12MB6134:EE_
X-MS-Office365-Filtering-Correlation-Id: 69472fbf-f868-4866-513e-08dba24695a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4SOc3rX1akBd2MOOiZpBCUw766ipG4gtsnLqaFCAf2WdfL9gmbmpNOYHGS6XOXtZKmGOo+i26rXFudUBOKDVFXPRXxSpm0SGWnA61G5/1oMcfgYfybdxfgXo8RB/brkUEhpi5a4MmZnv72OAeujpfhjzZ4029OCikTami3C36xigsru1kDvvhTk01GLAjJ5TXZwaQotZohfZYZA+WaGYgFJsIAoV8eyJ2LBIOGwmhEE/k53NvWGigNhfVwacbOgXLtUXtFn/uirv4Fx4pibkuQa5QEqyg/q0PU4NQOWbUdrIJEMslqcWMJK/y7RGK+uNkAtuhFLii8hGHUEGwN/b0dQrDKoLpcbhbBuU9bpi1E9olsZPYRaIwAP7q45s4j7soyBXsMVDSTDmoLYJMp1mlpJAXa6CDEyJTrUVHBaO5nUHg5Am31vvJdokTQeIImrGsdITTZXcQXrA1qIGxT/07Snln3fKCvvXX9y9iq2f5tFqwU0kHOJrkeL9r6YRYt+SJeL+hNnpFLiSJk92f8MxIAcBH7fzRe8hdfPjHvFK2pIsvPytToCRAPaQaXxNc4wP3giTEtMRrYwfvCB6lruFKk2Jswyl6hTahluB2H6x72nl+8ynRaGLom9KB4v4inZybxxb+K0p6baAuKlC2SrMUw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB5667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(39860400002)(376002)(136003)(396003)(451199024)(186009)(1800799009)(2906002)(53546011)(38100700002)(6506007)(6486002)(83380400001)(5660300002)(44832011)(26005)(86362001)(31686004)(31696002)(8676002)(2616005)(8936002)(4326008)(316002)(66946007)(6512007)(6636002)(66556008)(66476007)(110136005)(478600001)(6666004)(36756003)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KzNiNDcwZUIycUUvL1JDVnN4NE9lTkNjbFJlY2s0YnpsZkhQRElkRndMNWhn?=
 =?utf-8?B?SjVTS1lGT0FxaU5DVVRZenVjOElWd09XQnMxU0plVDJVblNOSlI5MnYyTjhD?=
 =?utf-8?B?aVlSSWJjTEI2bUsyYThCTGZhaHl2QlBUYWx4ZnZ3VTFkM0E5Y2F6MFVDWGVD?=
 =?utf-8?B?TW1XRGxiRHhFNFFRZTh5alNLTjlWMWsyaU9taUNuMDlXOEZVVnluS0c5MjlL?=
 =?utf-8?B?K0xWaC9VVWFOT3BscXdoQTdmN093V29WaFI4TmNPNmlhd1l2NmZtRVBQWW52?=
 =?utf-8?B?dVdFSFNYSHhHWWZQSzEzcW9QME1LVjN0VkFndHU3ald1QWEzRHp2eGxMUG1o?=
 =?utf-8?B?aE5sZWZqWUc5VFJOL3dGa2FvWnJVMmx5ZWZ2YzZwVGdQVzZwTzVVdHV6UVJt?=
 =?utf-8?B?UGF0V0FObVVZd3JtMzVPck1vQWt3NVVhQkIrd1hDc0dIQ1lnekpOaWxsQnYv?=
 =?utf-8?B?c3pxemdJeTdkZUZhYmk5NDl4ZWE5MXhJRDh1T01HL25ZZ3lnQVlUVFk5cUVE?=
 =?utf-8?B?b3B4cDN4TkI0MzhaandIaXhldnRlWE1XWHpWM0I0bzFvK2hheXRxSHpsRzEy?=
 =?utf-8?B?Y3J0a0VoWjV1NnVtTldYQXMxYWZnOVFNNDk3eHpqdlFtSWhqVkRRV0ZNMC84?=
 =?utf-8?B?aGN0NGJjeTN3R2Z4SDZWR1pBaWNlUnM2NmhhN1FYbzNBMlBhMVNHZjc5Yy9N?=
 =?utf-8?B?VjZVbXM3a1JNR0xTUTN5Nngrbm93SWNoTmp6RktOdXUwUzc3T200aU9nc1R6?=
 =?utf-8?B?aHRvMnQrd3ZZM2RsTnJpNVA3TitBR1RlZFNFdmNjdjVGL29HYllvY1JDUWds?=
 =?utf-8?B?K1JENjBTc0RKVGlOU29NOWR2SGFNcGN1UDZOayszTWF4UXBUMmVZRFVIYkdI?=
 =?utf-8?B?MUtDOGl1WnZuZXdLbVVSeWVBVVFGYUJKeWtEQTEwTG5rMm9va2hUaG1xOW9X?=
 =?utf-8?B?bG9WSGZXTTJ1NXlXMkp4QnlybDR0YmlaZFFnYjcvN05HWERMTWxBblEwdTAw?=
 =?utf-8?B?amlocHVZNHU1UUpodnZyVnVVMWk5cHRuRFZPOThhNE1zNHVZL2pmTnRuV2xn?=
 =?utf-8?B?NVZoVUlpTWNDemFaSmxMVStFUUMwNDdGTVZlbUUxQzhjcGkxUjdJM0NyaGVu?=
 =?utf-8?B?WkpCbUplQWl4S1U5RU51Q0Fjc3NCbzF1azcyTW9FM2JWY21aMzJ4b2Z6Ty9G?=
 =?utf-8?B?US9RNnJzZlFSelAvQWRwb2NycVpWcVhyOWFxWjNnU1U4ei91QnNXdlFSU0Qz?=
 =?utf-8?B?anVld2pMdXVBUkRRTXNmZmVjUGt0U3pJTGJrT1FQYnNFZEs1TTJGeHowQmph?=
 =?utf-8?B?UytBUTBZNE43VGNmTEFtbmxzWlVsR2FLNzFVcVlUZ3RpUmFzZU1oNTYrdkNM?=
 =?utf-8?B?eCtzRUNFRlNjaVVTWUwzdURraDVTU1hTaHVLRks5TG9lYVdXYnFvYmg1TjRv?=
 =?utf-8?B?RXdCRTlwOFBFM1JVM0VsRFFiOTFleld2MUE0WElwcUlkUU5zaHFJdzFoWmtP?=
 =?utf-8?B?THpKeXA5djA0ek8vRnlPQ3NCdUVuc2o0QkNIeGlubURWcGdMMjdqWFNENzVH?=
 =?utf-8?B?L2tReTJOTEJDQWpDbDRoTjFwdDg5Ny8vRU8ycjFGQ1p1WGxEZkhzRnFoekdi?=
 =?utf-8?B?ZXdETy9OQXdIUDVKQVhoQVM3ODlwdFVKVE5iVndhQTBENUtLa0dNdU5xa3Rm?=
 =?utf-8?B?MWx6QVhVQ29lSStIL1EwajNYM0JkR2RGdGVoVXVMeHpJUGdOWHJBRDVGTXh5?=
 =?utf-8?B?VVlvZGc5ZVk2cVBmaWNiNS90cGtnV2JGd0Y2aHhnblAwcCtzYlBVRXFib2tq?=
 =?utf-8?B?amN4aGxXaExLQ29rVzhBcGJIcEdtcTh3REpLTDQ0bTFScUlwcEd2VHBnOHRV?=
 =?utf-8?B?RlRwVHNoTkZwRmVpanVselhyY2o1OEQrTjRMcXVib0xMNDF2TmRJUUp4STZM?=
 =?utf-8?B?djZXejBBc0VtcEIwcXNDUy9IRzQyQ2UvTU9BTm1aaTFvQWp1UlNUbHljalN2?=
 =?utf-8?B?QUVEa3R3V3d2L2VkRG1ibmpjZ2VyOVp4b0g5Sm51UzRRQkZremRlVEJVcThy?=
 =?utf-8?B?TEJTRmdUM2hTM01ackliNzEwNDN3OGdmcDRHYWZ1cWxjRGF5NXVSVkxObDBm?=
 =?utf-8?Q?jdH6jA1r7mMXB/05cBtaugnKn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69472fbf-f868-4866-513e-08dba24695a8
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB5667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 13:00:24.8624 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RqrHUQdb+fgIANTkkm69fPAMf042djgh0tS2D0Pg6L6QNo63e8QLJJQtPL4dJBJAW0+aplRNk0xecw7ZeMhV5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6134
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
Cc: Felix.Kuehling@amd.com, Xinhui.Pan@amd.com, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+ Amar should be able to help.

Amar,

Can you please check this patch (series if required) with a few IGTs and 
probably with Xonotic as well ?


Regards

Shashank

On 21/08/2023 13:03, Christian König wrote:
> Am 20.08.23 um 11:51 schrieb Christophe JAILLET:
>> This serie simplifies amdgpu_bo_list_create() and usage of the 'struct
>> amdgpu_bo_list'.
>
> Oh, yes please. That's something I always wanted to cleanup as well.
>
>> It is compile tested only.
>
> That bothers me a bit. Arun, Vitaly, Shashank can anybody with time 
> run a quick test on this? Preferable the IGT tests, but this just some 
> game should probably do as well.
>
> Apart from that looks good to me,
> Christian.
>
>>
>> Christophe JAILLET (4):
>>    drm/amdgpu: Explicitly add a flexible array at the end of 'struct
>>      amdgpu_bo_list'
>>    drm/amdgpu: Remove a redundant sanity check
>>    drm/amdgpu: Remove amdgpu_bo_list_array_entry()
>>    drm/amdgpu: Use kvzalloc() to simplify code
>>
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c | 15 ++-------------
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h | 18 ++++++------------
>>   2 files changed, 8 insertions(+), 25 deletions(-)
>>
>
