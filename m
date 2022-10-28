Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA5D611954
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 19:33:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 316FF10E880;
	Fri, 28 Oct 2022 17:33:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2075.outbound.protection.outlook.com [40.107.243.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0C2910E887;
 Fri, 28 Oct 2022 17:33:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ptp4F/aeX+FjX1jR6P9qEnLnUa6v7TKWJxnreTvS/ZIXybnePbFFp2Vse4JF9kuh/C3zL7sbcorZLWm7+xAXUjfuERaPvc3iXUXN8Aqh7u/LcJKa/cvke3bLhCby58di7teJfMmRwysL6KwR7LmceRQwoiOhnGq9xQP58PcQLLj4jnA0f7spWYklzVIZZFzbYcxomGtdovvHbkTUwA/O8lrq3RltaDIQrPuvWP+F1gsGC/rsEF5wE1XFFQDcs1JVSOBe27VcVmAbCXq6zeOZRbx7UVofYj/IaRjsRV5NAiCBkpT7amxsmDA6TzLf/nc59ddfdjYHKW2GRoPHOgRGVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UyBR4zRnDT9rtt+UQq7No9myDSgh0r3XINeBR7acMSs=;
 b=fRgC2MHa+Xq/CGR1P9bbd2MJx7mE32x1+VtiyYDzxc8irl2yy/rrBDBXccXihsBtaPGgN1rq1bBrlGil4uPDU4l0q6dyybRgVx8QQZzihkFcc4qtyMC2TPbdbeiKrg3C1p9bfga4sR1vmpHqT2d9uubF3fWnEDwh45dnoVjlhVL19AtgUe29UgEUuHCwq4AAtgV0Gmoo2UW3XzSOcrB8DZoNVVF3InAuQS8o7OA1eCc2JpczSMd88JSOpRLAmU5NU7Eke1Qz5uL7cIjgqX2dMjcgUMrQ0Z8tnBiKW3Sk9EYgB/hZRDs+XiPmyfNQL0jia5VNWXS+UjR1Yd1KbvsmvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UyBR4zRnDT9rtt+UQq7No9myDSgh0r3XINeBR7acMSs=;
 b=UN5FusP9I7Ge5lqlOAWHu9sqJkHr7VJQ4X+5E2S0jcd3pbLP5ajctlZ9KOGYXwBs03m4nPsjQXOdKZFVYFgYJgn7ljHw7iICH3eyKl7oFC/urI6cD/tHja5nkzvLlmHA1LpJU69Qai6KUbb61R7HEmStdnN0Wvo9KLgnBIq3RiM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH7PR12MB6785.namprd12.prod.outlook.com (2603:10b6:510:1ab::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Fri, 28 Oct
 2022 17:33:23 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a350:f29a:f287:7279]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a350:f29a:f287:7279%4]) with mapi id 15.20.5746.023; Fri, 28 Oct 2022
 17:33:23 +0000
Message-ID: <1052fba8-11ac-cec8-92e7-b994266c6970@amd.com>
Date: Fri, 28 Oct 2022 19:33:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] [next] drm/amdgpu: Replace one-element array with
 flexible-array member
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>
References: <Y1tkWdwPUp+UdpM0@mail.google.com>
 <04e37ee1-53b0-97ab-d6d7-a39edfbdc2ea@amd.com>
 <202210280855.9DF8E4D72@keescook>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <202210280855.9DF8E4D72@keescook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0120.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::18) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH7PR12MB6785:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f425dba-0860-45fb-7434-08dab90a833f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OjIuNDcpGMo/6/uQ8Nr6JLaT8eHeGOIb7JIANzfk70FnjOSQl3jIoqifk92X7SqSfJYVTd13fwp1ojRXd361DLmCyVqt0XGxmgwoGy04D+lA0OP+JwKCTWe6ZVIRbuYSTv/J2NChgenDCwCy5vyOkje/EN/FqNHwzui7o58txJJ5SYg6DTt0Jv1zggaOQc8bKNJLCybfbbIIVWEbtGN35/Xz3ifMDO1pZ/sw9cxri0w50leHDwSJ1KXG1ocJrSavObc6SPtjgxaBgDqENtZZOjBM/rY5aOYD8syQv0+Hz89/ydvR7AezXMAvLQkoU0IZmm3eABMfIpPgAeUEqgIM9+G5a2qPyEovkmStiat17t9G7Ykdgp63I9SgqFrAZbq4U6yxzaQyKxVUJWugZNtH7WorWm+2X3ER0edZUdkwwCNMIbpq4DsE/xyLkD9oIa3rV4Ecvjm4Qsp4fnFvTNEOec+ClCxAYKEWtqaTY3a5yECDqhbAH+swxkRdtTsAhU+L8VMtcbE+Cl1ayG9V6th3e12usYsIlwQ0T5YQ1SKn3GcsLVT1fVb8Gm0H6vFK+uekfYu+Nc8L1KoL3bsiWM68hy+N6pxFZOWlI8nlanvjGct5TC46aHXhLKLYUp1IEzDV7mxIiIHRFvDZ/T7axUU9hy7tk3Yh566Flb06uQ8RjJa3DEk8CshrlgMmvMMKKxOqfGkt9ER8DBypM/nVnwOf9aHMTbumRQiDLKhY4ldPsFNgG+a2L/to/nyVHvj0AjiKOEu7OX4UNm+sw7Mzep6dCRKdVcaLD2qz7sTWY0Qxk3yin6atICHxxdEKZCOdnEoiy9817Ef6KhJvacUcvmn4jvWPDDqto9rWoFB6C/WNN8fLfejFf0SHAPa9b/lCf1+5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(39860400002)(376002)(396003)(346002)(136003)(451199015)(316002)(31686004)(6506007)(8936002)(86362001)(2906002)(2616005)(36756003)(83380400001)(31696002)(66556008)(8676002)(6916009)(966005)(66476007)(45080400002)(6486002)(66946007)(7416002)(186003)(41300700001)(6666004)(54906003)(4326008)(6512007)(5660300002)(478600001)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkJVZU92WGZKVE8rcVdIVHNvbndzSzlmZFJOWHVvam1kTjltTThWZWQvbUdj?=
 =?utf-8?B?TUs4SnRkbkFuKzJTQ1VaZitxU3VZZ1ZDWXkvSEtxb2R6TjNDdTBmM0prZ0ZW?=
 =?utf-8?B?YWFuYmVrOUtZTXVYdEhqelhqSzZqOGl3bDc1Q3VqRGJBYWM0cWFPK095a2pR?=
 =?utf-8?B?dlREbHYrZ2hKcm9HTldKNkRjTWhqSHdoN2JjOUpVd1B1dncyeDU4enNJRkJH?=
 =?utf-8?B?Z2ZXdjg0S24zTWlwcVYvcjZWRk43cnFFZmxDVUF0WkJ1TVdBWm56dWZiSEtu?=
 =?utf-8?B?NEo4SWpQWkpMZ1I3WWNOcllUbmJKc1lUVGlUYWo0bndDeC9TaithOW5pZTNY?=
 =?utf-8?B?SHl6TG1QRkpnVGFoWjhEaWtYMDRqaVpwQkluRE91TmZyYXhkb0ppOXFTanNZ?=
 =?utf-8?B?MmkzWHp1MVB1TVMxeXF3Y1JwTkFMT2ozS3JrSGRiZjcvMlJrRUlsNmVJK09R?=
 =?utf-8?B?ZkNrWFZqMGE2MUp0Ym9iYzVUMWVUbW90SXdjVVFwNmpLTm5LSTJvM3JycVdt?=
 =?utf-8?B?UlZtWlJ0NFRjQ2tsWE9vVHI3ak9mYzcySnNLWTJKT1lUNHM0WGRrSjNCbUR3?=
 =?utf-8?B?SHUxNEdzR0xDYTJGRFhJYXVlNm1TM3djR0NOUi8xOE5aMjNVMi9EQU1CUUZm?=
 =?utf-8?B?UHRid0xjVmF4alNFMERSMHFnOVp1ZnhTMHJUVGtUUFBOUWFwQTdsTk5uOWdR?=
 =?utf-8?B?aW5YSU5jWXR4NGh2RTdPVVg3VThKNUxYcFc1T2oyOEg3VUt1V0psTVdVZFd4?=
 =?utf-8?B?R0k2cENnWnMvM0s4a0hXME5GSzVCb2g1eG9hbTJWemFhbXFvcU1MSmE4Zm5r?=
 =?utf-8?B?dmJQWVlFTVZkRkIyaXVNV2c1ZEZpREkzYy9aaGt0bnFEcEFYNTk4V1piR3Fl?=
 =?utf-8?B?MFhxZ0pUbWREOU1qQm1aVVpTWXpDd3phMU9xRUlHeHpyV0tqc1BONjU3T0ZY?=
 =?utf-8?B?Q1BDRW1MTHQyaE9pM3h4MUtOeFR2V1pLZjIrQ3V5QysxeFhoN3NFT2tKbHNI?=
 =?utf-8?B?Yjg5ODlmcUtXUUZpck5sVWxraStRNlVHWlY4anlISEQveEYrVkVQOTZQRWRO?=
 =?utf-8?B?b3VqcXEwaElCZEU3RGF5SmxqRTJsSjM2L0hvL2RrYmozbzVhRmdUa0ZkMnNz?=
 =?utf-8?B?RHdDd0ZxTWVFWFRHdUlHZnZPQXIyTkFEVnpYSThOTTFBSGY1Yk1PQXZXS1VR?=
 =?utf-8?B?cUtXU1JvVUtRcDUza1pxMW90cGhIMzVObHNlSlZ1RFljTXhzcUhMbnlSRDFS?=
 =?utf-8?B?Q3V2MEo2TjNaRU9jL241alJEY3Ixd0F6QlllLzFETmxPc1BrYWc5N2pJZDU5?=
 =?utf-8?B?MFBOQ3J6cUxFb0c4Q01kMENmUU5TTE84WktPa281aHFJSVhSVWlzR09kOUtp?=
 =?utf-8?B?TXFmYVpWYzN2NHRMbWdvRFoycVFzQWFDcGp4UFpOdlZkdVpRc29aVDQrU0c3?=
 =?utf-8?B?bWtkanMzTWdlVll6SC9SVzNQNjdCcTBHa3d6ay94Y0xRc1F1emxQNmI5QTRq?=
 =?utf-8?B?NndkVmt4R3lKcytrcGJCOUhWcUhBNy9ocTkrUDJ6Y2dycGpmOGg3RmNnNG5i?=
 =?utf-8?B?ZTlZNjNIdDZoalJnbW0xM0Q5S01QRmtYdVFYYkw4Ykk4c29MM0tYcWdrdjdP?=
 =?utf-8?B?aWJPeEJHRXR0VkFBaEVtNFIwR05ra3BmRnVtRFgzdGJzcGhjdXQwak5iUGdO?=
 =?utf-8?B?Y0ZpVUZMQXhIYjdnRDUrNkRBVGRXa3ZJRERRUFVxMGtqU0E5Yy9nNDBqelVw?=
 =?utf-8?B?bFpaeThQRkhldHBrU2psS2p3b3lRQUVSbWpFNHFVZ1FiRnhzOFNCQmJNVXJ2?=
 =?utf-8?B?cGhNSEF0U0hEekVRLzJyYUR0TlZiVitFd0x2bm5DTS9EUTlRaFNDanh0Lzg0?=
 =?utf-8?B?RmlQQ0gxMHBMeVNIamFDYzFFbEF3dExtNEFzdzdNeHdaSXFQRDhMN2h6bW9C?=
 =?utf-8?B?Y01GWlhTTGhKVVpDQ1JtK0h2U0RaWVRxTG1pWTVYMU03QTBuWC9HR3c1QXJm?=
 =?utf-8?B?cEtyWDF5eVhkakZyRDlDK0poeEoxWmZUaVJFdk51R2RQNHREZVZPT1g5cS91?=
 =?utf-8?B?VVBqb2EvVVFhdGdmU3VNQjhQSmhpdFl5akpKcnFpeG9uYlpHQmxhcVd0ck5s?=
 =?utf-8?B?aTJ1cE80U3Y1azZXNHpBUjYrb09hemtuVmgzcnZvYnhiKzk0Tkxkc3huUjRY?=
 =?utf-8?Q?qvvNadxVeKvNs9WQ7UAUvM7XsrVZews1Y+cJ+SUz5ymn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f425dba-0860-45fb-7434-08dab90a833f
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 17:33:23.1006 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vgEMU8F7auCOwYZTN+MO7078u+8VJ1fRH/eXGrZUiFKpDnTWM9gg8Cz0GnnVuI0E
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6785
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
Cc: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>,
 Grigory Vasilyev <h0tc0d3@gmail.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Slark Xiao <slark_xiao@163.com>, Hans de Goede <hdegoede@redhat.com>,
 Claudio Suarez <cssk@net-c.es>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Rongguang Wei <weirongguang@kylinos.cn>, linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 28.10.22 um 18:36 schrieb Kees Cook:
> On Fri, Oct 28, 2022 at 09:18:39AM +0200, Christian König wrote:
>> Am 28.10.22 um 07:10 schrieb Paulo Miguel Almeida:
>>> One-element arrays are deprecated, and we are replacing them with
>>> flexible array members instead. So, replace one-element array with
>>> flexible-array member in struct _ATOM_FAKE_EDID_PATCH_RECORD and
>>> refactor the rest of the code accordingly.
>>>
>>> This helps with the ongoing efforts to tighten the FORTIFY_SOURCE
>>> routines on memcpy() and help us make progress towards globally
>>> enabling -fstrict-flex-arrays=3 [1].
>>>
>>> Link: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2FKSPP%2Flinux%2Fissues%2F79&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C600d3657cbe441ae969d08dab9028c1c%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638025717852262567%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=h78kYVA3ee9fDDwD5XGNgYJuUAZtBitVpk2354cOLO4%3D&amp;reserved=0
>>> Link: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2FKSPP%2Flinux%2Fissues%2F238&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C600d3657cbe441ae969d08dab9028c1c%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638025717852262567%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=k1k7LwxIxIw5c9QM3gM2pA9DVGF4Kz20IJWs5tY4xzE%3D&amp;reserved=0
>>> Link: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgcc.gnu.org%2Fbugzilla%2Fshow_bug.cgi%3Fid%3D101836&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C600d3657cbe441ae969d08dab9028c1c%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638025717852262567%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=LJB4Rs1xOE82UpLbqtZOgPgi7OmvR02T9fikpKamdiY%3D&amp;reserved=0 [1]
>> I'm not sure if that's a good idea. We had multiple attempts to refactor
>> this now and it always caused a regression.
>>
>> Additional to that the header in question came from our BIOS team and isn't
>> following Linux styles in general.
>>
>> Alex what do you think?
> Fake flexible arrays (i.e. 1-element arrays) are deprecated in Linux[1]
> (and, frankly, deprecated in C since 1999 and even well before then given
> the 0-sized extension that was added in GCC), so we can't continue to
> bring them into kernel sources. Their use breaks both compile-time and
> run-time bounds checking efforts, etc.

I'm perfectly aware of that. The issue is that we have tried to fix this 
multiple times now and reverted back to the original behavior because 
some user with a 10-15 year old hardware complained that it broke his 
system.

We can't really test every hw generation of the last 15 years for 
regressions.

> All that said, converting away from them can be tricky, and I think such
> conversions need to explicitly show how they were checked for binary
> differences[2].

Oh, that's a great idea! Yes, if this can be guaranteed then the change 
is obviously perfectly ok.

Thanks,
Christian.

>
> Paulo, can you please check for deltas and report your findings in the
> commit log? Note that add struct_size() use in the same patch may result
> in binary differences, so for more complex cases, you may want to split
> the 1-element conversion from the struct_size() conversions.
>
> -Kees
>
> [1] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdocs.kernel.org%2Fprocess%2Fdeprecated.html%23zero-length-and-one-element-arrays&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C600d3657cbe441ae969d08dab9028c1c%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638025717852262567%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=6v1qt3zMrSTFDgnF9TO3aurqvG1fPjH2grRu47e2tEA%3D&amp;reserved=0
> [2] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Foutflux.net%2Fblog%2Farchives%2F2022%2F06%2F24%2Ffinding-binary-differences%2F&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C600d3657cbe441ae969d08dab9028c1c%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638025717852262567%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=g3yCIXBAD0OJwK5EdxRfJVeSBevbA1WOeyFM%2BiZC%2F%2FM%3D&amp;reserved=0
>

