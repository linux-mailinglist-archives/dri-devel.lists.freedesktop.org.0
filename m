Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B02847437
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 17:09:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71A9610ED1B;
	Fri,  2 Feb 2024 16:09:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="C9oRPqre";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2080.outbound.protection.outlook.com [40.107.94.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CE1810EC03;
 Fri,  2 Feb 2024 16:09:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oCOKM3eBvyLVwElw+yWJBRfjCIwh9raIBLS2QZiXKe0HKCWVvFp9M9JyArB+pBChlkyYeM89P0THE3ULZKkFMWYHDLSIOvj5OZJQdUUUCxvGom75vWkmyYnRh6BxGElkJdhk+O7RtQkXTe2Im2RLVuxJuRjwvE4GlwmhldlxO+JAa2SOxbu5/zAigW66WPsMDQmP0WHHxR46oGXhJsiP3ED6ZynTJQAvg2qHCTh8nkvlW0mPFj6aGDsgF9dgGoEVpdEDGYQhNrv4YdqSXjAmC3qFHnkxdBnAVE6nEmguG5m8GfaYoRUB15I2XwtIgct3BhXbkoJadRV6yF74hd9IkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8mWaYv6opTjZRWSwIWh1KPDATNt7iHpTLNTjdk80bCw=;
 b=Dd8wIYH1RSyC6DkY6ZQERCQCpsHUnYvEXqIcPDFtdffwysZIWPnSgwJU3aD79dFyjKi2zMWSdTqL9kUseRhkufP1nNI2eAEe5VoNO7QlkYJSEHZS7cCoTGt/tpzN0Q/2V7+xHWwf7wBQ4sd1DIQVs/3ga0DT5e0e1I+QHcLrWgZ33ixEVdvWoxsZJ//A3q6q0z2joS9sKlBFgysJ7p37BSSLGks4gbyuSP7H/L8qcqScLmy405ZX/+t+YCJ7/YbX1a3YeEtEV9qs4sL4iYUGi1fMF9ZM3wbPaM5OI14VN5zwnmij8/ntbtx0T2lQJ3bs3wZpYB1iZI0nbMkdrC3Dqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8mWaYv6opTjZRWSwIWh1KPDATNt7iHpTLNTjdk80bCw=;
 b=C9oRPqrevwW6QXtsgozNmJ2RkjYNJ+NRgrYMWer4+Da6BDbWjbZ1D4sv3UCwxOxBxIzAWoZQctYs22BFOVZwi3cOFqo5cujdHy2tE7ZG8JWk+e1eJQAwtqZ4F/4MMYV9dYMAMduyu70P3il/k8PsHOCSOrAcn+mU3+1SxSnCV4I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by BL1PR12MB5970.namprd12.prod.outlook.com (2603:10b6:208:399::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.40; Fri, 2 Feb
 2024 16:09:41 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::c30:614f:1cbd:3c64]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::c30:614f:1cbd:3c64%4]) with mapi id 15.20.7249.024; Fri, 2 Feb 2024
 16:09:41 +0000
Message-ID: <c96de797-39c4-4c83-96e2-d4579504e88e@amd.com>
Date: Fri, 2 Feb 2024 10:09:38 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] ACPI: video: Handle fetching EDID that is longer
 than 256 bytes
Content-Language: en-US
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Hans de Goede
 <hdegoede@redhat.com>, "open list:ACPI" <linux-acpi@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Melissa Wen <mwen@igalia.com>, Mark Pearson <mpearson-lenovo@squebb.ca>
References: <20240201221119.42564-1-mario.limonciello@amd.com>
 <20240201221119.42564-2-mario.limonciello@amd.com>
 <CAJZ5v0iw3PLB4W0QNmRCgK2AWxe5A7wxnWSz-Jm--Mb=fnugEw@mail.gmail.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <CAJZ5v0iw3PLB4W0QNmRCgK2AWxe5A7wxnWSz-Jm--Mb=fnugEw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN4PR0501CA0108.namprd05.prod.outlook.com
 (2603:10b6:803:42::25) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|BL1PR12MB5970:EE_
X-MS-Office365-Filtering-Correlation-Id: d5cc3fbd-e26b-4f0a-f10f-08dc24095cc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wI4TsAwpN8Ntpk7tFezr90l4tay2BUHUPkC8JNKLKoLDXeMXnC+LWD5HXGpJaYMCf4FzkD5nEhcPDAaQqw0H+VCSU93eApgGukbgxeoY2xTgYF5ODQz7k/D17zoQrDbr6xAbDioBJfcr7lyc1yUDJQotMlNRXQU/Ew/GgHDVkiDdSfoEtGujXT+jCpOin/oo8HR9C7PTLJskKft8GfbAkJ+G3aS4UlNtQI6vggOMdrk+p9j6CnZ7q0VTWgCzgFbpnkGWbTIeMpY8/ghEZ3ql/t5+Vv/zlmn5aOHseKyYJXs4gj6ayE4jrQiFeoAnhe5yMK2hXv71ypniIW9vK0Nclf1mzf30DPB2f/BfscNcFCe5SiLV64ax2FfAzL7jU/7IpoWqkc/BSPT8ADBeOc/A4GZjOX0gxetgQSrYaZC3CPKuBnndiaUFW1wgVK0uwcCrsf2yBlGTJrYWvz1ZIjB8c1juP3SZFJ6gcq27o3QwKSqtufwgs97d2y+AYm9YOZQth16v60u6B4krCWWjNiBthEW2hN/9dU9OyUjBtly5ojyIM+NPcTPaekLAH1tuOSmhSC5bOKK+bSQlv1Sg6haa72iJtRpDMbGX081VWiz/V43kSJHs5DEA5cJwi9cjVrQlp3UdmU475SevJiMAQ3qxCsCAam/QdA0YwIi0OSx6mmU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(366004)(136003)(39860400002)(396003)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(6486002)(53546011)(26005)(36756003)(2616005)(6512007)(6666004)(966005)(6506007)(41300700001)(38100700002)(86362001)(31696002)(83380400001)(478600001)(8936002)(8676002)(4326008)(31686004)(5660300002)(44832011)(2906002)(316002)(66946007)(66556008)(54906003)(6916009)(66476007)(148743002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cE9tMitUTlVza2FEallUQTBac3VxYWFNU21WeGllUUYyYlU1ZWlNNFA4aDVk?=
 =?utf-8?B?RWRyWXUzbjlEcStGRm1qSHR2QWZ5MkxxQXI4K2k2ek5qMmlSVTQrTDR2SUgy?=
 =?utf-8?B?SlZuZDZhaUZ2cGFRSEt6UStQcFNTcmZPOVdEMVhpODh5akdxTDhVVU1Memcv?=
 =?utf-8?B?SStkTWlkQzhBTU96TW1Ca2VGa00xaVFKVHgycWNKSnlJZ1FpQXZXMCt5dTZk?=
 =?utf-8?B?aTZUNkY0SERaWHVMeFFRS3dQYlBXaXRkMzkwRGpjU0VxdHg2RnhkdlRJTkJw?=
 =?utf-8?B?Wkh4OHZlWWVpSGNzNnpleHRwY1U5c1Q0N09iR1lyRUdmaUhQNENHaDZycktE?=
 =?utf-8?B?c3pHMlhvR0dMN0xyb3ZZQmN5Q1BTWE9lR1ZnY2JFRTUwK1lEZU92VnNtWnNz?=
 =?utf-8?B?dmFTQnpTZjBBYTNKc3R5QmtHbzl5UldadzR3ODE5VVBLRnBzNDRYQ0I5UkV5?=
 =?utf-8?B?Mk1GcEkyejBIM2l4R243b3YwbDEwQXVaWlpwQVhHRGpaVkljTVFDSWVkNzFv?=
 =?utf-8?B?MStaVW9GejYxM28xQk94eFJQOTkwR1I3Y2NWMldheFZEZlBzdFh0UFhlU2lB?=
 =?utf-8?B?NFplSkRkdHIvZ3ExK2FvNGV0VXBLV1RpZzdJeGJ0WWwycXFPK01zcHdMK1dx?=
 =?utf-8?B?Qldhd0IzRDU2VUNqVWVsSUZWNzQ1SmpmMUVtaExzczczMURFT3l1WitIOUlT?=
 =?utf-8?B?Rmx4VWdQNXF5M3g2OW1xTDBQNXJKd2RPZ21FK3JEMjR6dG5OMndUdDBHL0lZ?=
 =?utf-8?B?QTFObG9RTzBnMXZUcVprTnorSVpKcXZIOUQvLzlTYkExKzdJQ2VaNlRiVEl6?=
 =?utf-8?B?K3VOS3pwcW5DVS82K0o3U3Z2eUNQZGg3RStjT2VEV1p4RUxiYWJXemZ5cjRB?=
 =?utf-8?B?aFRYdnYrMndBeG1lVEZWK2E3bEdXNkxBZlBQSnJleTlYSzdXaEwybHBzM0I2?=
 =?utf-8?B?VHBvL05waGRGcEpJWVJCKzlKa3pFWlpscE1Uak1SNjlzcnNVVFhzZzdWanE2?=
 =?utf-8?B?R2t4TUE2NHQ5ZkovUkMxTXdNSWVvZkpSL2loQ0pXNy9tcjRnTXhXYWVqaGdZ?=
 =?utf-8?B?RDdrVDFweDNaNGZhYkE4ZG84d0RTdkQvWnJHL1FEWG5rVEhjMWhlbWdQeFhu?=
 =?utf-8?B?enZqNDNsUk1aTmFyc2V4VWJIc1YxWHRlRkhDM1FHYmowTFBPWjd0SkNkV0Qy?=
 =?utf-8?B?dmw5Tnp4akVUNU8rbjFsWTdKQjVLRzIwVlZtTW9MSGx3c2ZwVHFZU0tOaGtD?=
 =?utf-8?B?bmNtL2srUHAyLzVpczdsQk1EdXZubWd5YUUxY2tMR1BPWWhab3dKOE8vVm4v?=
 =?utf-8?B?MmVYVXNjN2drMXZwb2ZaWnIxUVVTakJ1VnZCNkhPOFZwa2hZS2I1ZHp3enNs?=
 =?utf-8?B?VVpXclliQzBpOVVORklyYnlYWDJUbXRlK1JlN0dmMFE4RE5SOWx0NG9YekVE?=
 =?utf-8?B?NGc4UVl4Q0lpOUQ0STNCR3lBajRrNldCckJ3dmhTU1BCd2w0U1hkaWdxRnJz?=
 =?utf-8?B?c3V2RmNrNW10ek1KZVBOZ0FrZG1JOC9wVkJjMklxbG1pbU83Y0diZkthdlBC?=
 =?utf-8?B?VDhkY254S2orQUY2YXUvS0UzVGhoSmhyVWNwU015ejZ1NTFaMXp3TklVYmtS?=
 =?utf-8?B?Rzk3eWRRekZYcEFieTlzZkpYYU81OXBXSEhWY3VZeU53bGFmNElEbUFkYi9D?=
 =?utf-8?B?azZ0UWY3QzRSTk5sbEJ0TXJZOTNHQnNiRXh2YUN1d3FqQVloVlZ1RnU4N212?=
 =?utf-8?B?MEtKbFdTZ3BtN2FlZEpSZnF2dnl1NDRzdjFKMStnMEpVSHFIMkxtcXNrei9N?=
 =?utf-8?B?cXpYM1FqVjROV1ZYb2VzNWpaSVkrK0dPYVMzY25yeTJDRTZvRnAvaFdJNXdj?=
 =?utf-8?B?WjZzWURLalJWbFhwNDBDbHpSK3cyNjgxMVgrWm1kK1kvZ2NGbCtTS3Q5c09z?=
 =?utf-8?B?QnA3RC9mdVp6QmZsRTA2dXNsN2cwOEdrZmRiSmdVNDBpR0RaNFVLcW03R09Q?=
 =?utf-8?B?MG43bW82K3Exazg1ZmlURExVdysxYkZ3QW8zV1ZaYVdvU29lSmtrdWo0U0lt?=
 =?utf-8?B?c2haa21HbFcxMkJxRlJLU05yVkJTbXlVeG0rOTRDL04xczh6WllHTElPSDNY?=
 =?utf-8?Q?66qlCvPlNPUgULUELt9bpQVYh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5cc3fbd-e26b-4f0a-f10f-08dc24095cc4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2024 16:09:41.0939 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NXkNY/lLITeNErjfP5Iv6tLizlaoHKh74Rd0KzqcPIF2nm/P5JG2oa5VjTY70QJEU8Wdv9Oto/i3YyJp8Yippg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5970
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

On 2/2/2024 10:07, Rafael J. Wysocki wrote:
> On Thu, Feb 1, 2024 at 11:11 PM Mario Limonciello
> <mario.limonciello@amd.com> wrote:
>>
>> The ACPI specification allows for an EDID to be up to 512 bytes but
>> the _DDC EDID fetching code will only try up to 256 bytes.
>>
>> Modify the code to instead start at 512 bytes and work it's way
>> down instead.
>>
>> As _DDC is now called up to 4 times on a machine debugging messages
>> are noisier than necessary.  Decrease from info to debug.
>>
>> Link: https://uefi.org/htmlspecs/ACPI_Spec_6_4_html/Apx_B_Video_Extensions/output-device-specific-methods.html#ddc-return-the-edid-for-this-device
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> 
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> 
> or I can apply it if that's preferred.

Thanks!

I think go ahead and apply this one to your -next tree.

The rest might take a few weeks to get right and no need to block on this.

> 
> Thanks!
> 
>> ---
>> v1->v2:
>>   * Use for loop for acpi_video_get_edid()
>>   * Use one of Rafael's suggestions for acpi_video_device_EDID()
>>   * Decrease message level too
>> ---
>>   drivers/acpi/acpi_video.c | 25 +++++++++----------------
>>   1 file changed, 9 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/acpi/acpi_video.c b/drivers/acpi/acpi_video.c
>> index 4afdda9db019..3bfd013e09d2 100644
>> --- a/drivers/acpi/acpi_video.c
>> +++ b/drivers/acpi/acpi_video.c
>> @@ -625,12 +625,9 @@ acpi_video_device_EDID(struct acpi_video_device *device,
>>
>>          if (!device)
>>                  return -ENODEV;
>> -       if (length == 128)
>> -               arg0.integer.value = 1;
>> -       else if (length == 256)
>> -               arg0.integer.value = 2;
>> -       else
>> +       if (!length || (length % 128))
>>                  return -EINVAL;
>> +       arg0.integer.value = length / 128;
>>
>>          status = acpi_evaluate_object(device->dev->handle, "_DDC", &args, &buffer);
>>          if (ACPI_FAILURE(status))
>> @@ -641,7 +638,8 @@ acpi_video_device_EDID(struct acpi_video_device *device,
>>          if (obj && obj->type == ACPI_TYPE_BUFFER)
>>                  *edid = obj;
>>          else {
>> -               acpi_handle_info(device->dev->handle, "Invalid _DDC data\n");
>> +               acpi_handle_debug(device->dev->handle,
>> +                                "Invalid _DDC data for length %ld\n", length);
>>                  status = -EFAULT;
>>                  kfree(obj);
>>          }
>> @@ -1447,7 +1445,6 @@ int acpi_video_get_edid(struct acpi_device *device, int type, int device_id,
>>
>>          for (i = 0; i < video->attached_count; i++) {
>>                  video_device = video->attached_array[i].bind_info;
>> -               length = 256;
>>
>>                  if (!video_device)
>>                          continue;
>> @@ -1478,18 +1475,14 @@ int acpi_video_get_edid(struct acpi_device *device, int type, int device_id,
>>                          continue;
>>                  }
>>
>> -               status = acpi_video_device_EDID(video_device, &buffer, length);
>> -
>> -               if (ACPI_FAILURE(status) || !buffer ||
>> -                   buffer->type != ACPI_TYPE_BUFFER) {
>> -                       length = 128;
>> +               for (length = 512; length > 0; length -= 128) {
>>                          status = acpi_video_device_EDID(video_device, &buffer,
>>                                                          length);
>> -                       if (ACPI_FAILURE(status) || !buffer ||
>> -                           buffer->type != ACPI_TYPE_BUFFER) {
>> -                               continue;
>> -                       }
>> +                       if (ACPI_SUCCESS(status))
>> +                               break;
>>                  }
>> +               if (!length)
>> +                       continue;
>>
>>                  *edid = buffer->buffer.pointer;
>>                  return length;
>> --
>> 2.34.1
>>

