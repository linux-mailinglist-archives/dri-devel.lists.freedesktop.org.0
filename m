Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE5183BACB
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 08:39:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B30810F1AF;
	Thu, 25 Jan 2024 07:38:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2056.outbound.protection.outlook.com [40.107.212.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C065210EDDE;
 Thu, 25 Jan 2024 07:38:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bxa9FY3bFNsM0O7KyJ/8JUI0pCTNTdVA2cavyXohkAGnbB9Qz+XSLiVZQdRBvXgU9m/zSQalBNmDZkdS2vMDeHK72nfgj6sqm1KOhfoPEGFCLrOjKAZ19ptnAnXv9mDdJbo1QZPDifnbB30lthFd13nipK6VCMhG3GnBeVRFfI+Mq67DzR9mDGrRqjCxDCIzt9RTIVWB+XKZ8frThhWrU9VOAzamF3KGAzBQDx5nfDnptBr/XoMak8Nn01hE5U2EseCJk3hJEsVsUf9YPm4n0y0sdtgpk4vM2KlvJLbik6l13AM7Ajl263XDov5R+BT/Q4zvefopa4Jq9tEa2iDbEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aGzU9pbg0KTtcO8ZqZqrF6Vhu20EKH8JhLW5cdjUGEY=;
 b=YP0zCMIxvTsk/MZWvdY1TAtYCz8grehVlAv4Ofiq9RHRrpeOGhr+aJBfMuZSCqVUkHSsbma3babQSpq6Nw0NdinknYidUk9df/Aghp5GgFfwYYCBaSpUjLicqde61xwSKBlKbakiPcBsdR9CrD5q0hpmFlKHn/uIjBIXENlEUH9Thif2RpKJWqj4PBLd3t+SXxmvtZNYnXF7ztc6lXaRo7VGad/PcIi3dJBg5o7XpWSeCq+TmNktMpiOHi/WK5kW7dbnmQttFD07KxkmrjAn0omdmBndq62e1844Ic4yu4Pi5+19j1uiFZ1uQ2D4ZWnWfEDmpqAhvnK5cAbJDNr87g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aGzU9pbg0KTtcO8ZqZqrF6Vhu20EKH8JhLW5cdjUGEY=;
 b=Noin44L0glH60v1PdT7KMXyZAYmtpIdIvjh4iIsrumd17am7diqL/JwcDyE4UnHZ8ikFWSwoJ0H0ckb3NFVwY3AlvfCenBcz1CZGRasB6Xe5RdHCjuwmss1Vqo6+2nx+KLxyPMbrfrN3TEkTGofkEYORqSJ2aAb+7Lb+K6bDPrU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6351.namprd12.prod.outlook.com (2603:10b6:8:a2::6) by
 IA0PR12MB8864.namprd12.prod.outlook.com (2603:10b6:208:485::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.26; Thu, 25 Jan
 2024 07:38:22 +0000
Received: from DM4PR12MB6351.namprd12.prod.outlook.com
 ([fe80::831c:60ba:97df:9720]) by DM4PR12MB6351.namprd12.prod.outlook.com
 ([fe80::831c:60ba:97df:9720%4]) with mapi id 15.20.7228.022; Thu, 25 Jan 2024
 07:38:22 +0000
Message-ID: <ea7a6f91-c3fc-456f-9289-58dfbae6e091@amd.com>
Date: Thu, 25 Jan 2024 15:38:10 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: BUG [RESEND][NEW BUG]: kernel NULL pointer dereference, address:
 0000000000000008
Content-Language: en-US
To: Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org
References: <83b9077a-3de8-464a-bd64-d32869b3728c@alu.unizg.hr>
 <b6336db1-be2c-418d-b45d-e715ae19507a@alu.unizg.hr>
 <1bc1a054-2aa8-4229-9a05-df7bac1ec0d8@amd.com>
 <5e95a560-ec78-4e9f-a4f6-fb98f033eab2@alu.unizg.hr>
From: "Ma, Jun" <majun@amd.com>
In-Reply-To: <5e95a560-ec78-4e9f-a4f6-fb98f033eab2@alu.unizg.hr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SI2PR01CA0014.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::17) To DM4PR12MB6351.namprd12.prod.outlook.com
 (2603:10b6:8:a2::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6351:EE_|IA0PR12MB8864:EE_
X-MS-Office365-Filtering-Correlation-Id: c9149f0f-6d7b-40cf-90bd-08dc1d789b62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qttAfhVoOqvjn/6SUtz+SbkfAOw8ds1xugoh/1yQZVEZ89908SLeYtFaGhBcryeK/61ahWN0ACrnBFaWxvh0a5yXVFLXloiwYrnhZUhE6F1SW7shuagjGFrILB2bghpilMB8QsJGXl76Imy7CBzR2WxyUK7IWKo+BpdF5/95GD27E7cvFghN7Dzbcn6ZfDzZvv1cgfvyjrdYFQuN8EmKmso6TTxbXpWOofhqQQG9Yjiy/gJqrZgnpGrKRlY71RCEqBD/6WjOnehBJFE5ifkSPsy4vMTTQPDlU26FbLKyB3vHZFJfdEw0uOD1/p4Ksc+eevXNmYfegmYCLrLCrPCl3IUt7XrDf7a1+1ShiOErXU8S/b0gi2Ftoj3dC+jbeNwTyT/QtM0jlF5AeFyUMbzxv8TQLu1gklwNOfTWa0p0kmhC2DSvZyCKV2SypTuWP8ZwQOcsaXC1j/ikuk7drx8C4/kSvW+65i5hXIqgmJnPlZh25Q2bQJfEC0C4w/dPUgTz5xP6CIL0ZoM9TRe9QPa80iIBC1RWLrgqycFlc658odsv4nzsn59gVVcsN8i6brWBmR60u6Nl8OfuQchWUjrUfL279PzcsjEso/O8KKJw6CBhGFDnOCEpxfRqqKWusP6h
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6351.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(366004)(346002)(396003)(136003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(31686004)(316002)(66476007)(66556008)(66946007)(36756003)(54906003)(6486002)(966005)(53546011)(6506007)(30864003)(2906002)(8676002)(5660300002)(38100700002)(4326008)(8936002)(31696002)(83380400001)(41300700001)(2616005)(26005)(6512007)(45080400002)(6666004)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dU1nN0Ivc0JNNExra1Y4TW1QOUlQSTJla3JtcncxbjJOc3JkTC9pVzI5MHBI?=
 =?utf-8?B?RHg1aDUwU1JSeEgzTGhybEdCZGJWT0s3c3ZFeXJyY1dOVmRkSGlTVVpJbWtK?=
 =?utf-8?B?a1JDOXlCR3hNK29jZEU2VzBxYm9yUWRqSUU2bFUwT1VVN2s2aUJOVHdrTzZy?=
 =?utf-8?B?R1pQcW92ckN3di9ucG9UNnJXYVFuZkh1ODBpbjE3R3VMRlhheFR3NmxGUEFE?=
 =?utf-8?B?ZmtPSHQwdXAzbUprSEVOR3FvZThKWE92Ukd0eFVhdHYxNndOU3IzRFFRWmVV?=
 =?utf-8?B?VlRId2p1WkMxQk1YWENRV1VCVmZBTit4dEVnRnF0cngxQ2hYWEQybDBrdGNj?=
 =?utf-8?B?aHJzY0t1TzNYT3Z0aG5jQjZlOENzdEpQYnRjZmxIaFZMQWg2eFBPUUdxeGl1?=
 =?utf-8?B?eXRJbzRXTzZBTDlMOG9kT1ArV0lwVkltNUVacU4rd3lsM2RPNFUxM3Jpaks2?=
 =?utf-8?B?NGNtMk5jTWRGUGV2SVlzYzRrelJXZUtOWVZOZXRMc3k1ekpMSjR4UHRwa2hG?=
 =?utf-8?B?MmN6VWU4MnJYUXEvbGlITWd5RkZad2xSU0IyUDNUTGNMNEpRdGlUYmx3RmxQ?=
 =?utf-8?B?Uk1sWUxtMU1XRzhxVE1LRHh5ZjdSQW42SEhxRzh2MUYyMEtXb1poVTVRODdn?=
 =?utf-8?B?NDQxeWtzbDBjNElRczdZcWRrL3lqblJVSVVYWDVjRzRuL0JHOUxISTZNYmNX?=
 =?utf-8?B?WVE2WWwwY1dOaTNIeno3VzQ5Z0NDV1ZzckNESnlRUzJtd0J0S1M2ZmZYUXNi?=
 =?utf-8?B?RVFiOVhvemdYb2pQdDd6dm1YdjdLOXBtbk1DdEllbEVyVVd2UHN0VDhoY3M1?=
 =?utf-8?B?a1lXZmJrSFFvVjFTUG9DSzVQSDh5Tk5XTXJIcXUrT3pUaERYNW05ZC9NRytm?=
 =?utf-8?B?RzgwWStzSHNjQ0RTcFUzdDNEOE5WOXEzeFkyM2RTbFRjVFNZNGdVU0MyWTdP?=
 =?utf-8?B?eWtEaFNsbitZMmRnNGszdHBOSktNTW80YjBzejdNZ1I1Um52YnNzNHZRa2Fj?=
 =?utf-8?B?K0JTczBwWUNOenkrcGFkR0YwUjdXYmJwNnc4UXB6V2lkcGozVHBEL04xeTdW?=
 =?utf-8?B?OVpTWmtoR090cUc1MFY3NjJVb1k5K3Jram1nZGErZEl4Q0FtU0ZzMkZ6R2Y3?=
 =?utf-8?B?TUVhTjBUNmtCSGpzK055dkxzSXdDd0czSExFbWgwZkg1ZGF3RTZ5NHI4VFlD?=
 =?utf-8?B?WTVlU0FkaDRpQzhZYlBmdGNFM0t2clFITHRUZjBHalY0QVRCT1NQcU5PNFQr?=
 =?utf-8?B?cGhZSXBxbEkyR0w4Qlg5a0VWQjQ2UURqaVRBWURUL2VkYWdzcGt2cXU0QU5k?=
 =?utf-8?B?bU1HNitlbHBDeVBENGxNOFNNS0g5MXpacXFQTnUwOHE4eGZKeFVQbkxhTVg3?=
 =?utf-8?B?MDVDajNWMVF5VjNvaXFZTlNxYURCTk5pQWh3Y2V5OEhTcThhUkcrWURxdC9m?=
 =?utf-8?B?VjF5TkN1NEg2S3lIODVpTHYvNUhFamtMYWlXbWxCYkxxaitUSHRydENHeENY?=
 =?utf-8?B?QXIxY3ZsMUJlNGNVblRUbkZ0QjNOTlVYYTVCK0dJZkxUd05rbmtnSkE1THBD?=
 =?utf-8?B?ZElLTXlGWDhwaUNnOFJjN2J3VURtWXRZYmZLNFBtVzhTRDdSb2pyRWJiTDdM?=
 =?utf-8?B?UDN1Q0dWTGVweTRkSkxoY0RyYUhCeEg3WURCaTA2TlpIQzdJV2JQcGx1YkY3?=
 =?utf-8?B?SnhuYlBxKzdNcmN6aHc1d1F3R3ZUUERqNkk4V0ZiM1dTTUdBVU94SU03VC9p?=
 =?utf-8?B?ckVucTJRR0U1RmdjVGRaVTNpZjE2OHhqUmpTZXBWNks5Y2FMUzZQYWpQdUJs?=
 =?utf-8?B?aDVDN2I2aVErNTNXMDI1MFIxUHR2WWlUWG1DVEMwNkZWZ3pyTlA3bVByVHh4?=
 =?utf-8?B?WDI4a0h3NlBpYXUwcWlSMHVTVVhJOXhneU1HbGVjL3dNdlA1VkhJU2JIN0la?=
 =?utf-8?B?STVDMU5oZ2pPb2g5eTllV2R3VHRCd3k3akU4NnVSVXp4L3FjS0tpYWxvTlV5?=
 =?utf-8?B?dmNHcmlTR3pwNzdGeTVldWxJd3AxOUQyazFVa3kxUjVXNUU0MzVsQ2c5cjds?=
 =?utf-8?B?MWZkeGt2bXhZbUlVU0plMy9OZEk5c0k5ZXpkRFVoZjhUdEc5eFkvQW12UnJZ?=
 =?utf-8?Q?ave+0+KVkfJhsdH6A37cWSJ9n?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9149f0f-6d7b-40cf-90bd-08dc1d789b62
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6351.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2024 07:38:22.3231 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tkD0k+ajqd8qtL5w/OdhKLMXfTf/7q3DXPYkVrgEIzbrH47oAcnTPXobCCxsGyRZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8864
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
Cc: Sathishkumar S <sathishkumar.sundararaju@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Guchun Chen <guchun.chen@amd.com>, majun@amd.com,
 David Airlie <airlied@gmail.com>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Boyuan Zhang <boyuan.zhang@amd.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Francis <David.Francis@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Lang Yu <Lang.Yu@amd.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mirsad,


On 1/25/2024 1:48 AM, Mirsad Todorovac wrote:
> Hi, Ma Jun,
>=20
> Normally, I would reply under the quoted text, but I will adjust to your =
convention.
>=20
> I have just discovered that your patch causes Ubuntu 22.04 LTS GNOME XWay=
land session
> to block at typing password and ENTER in the graphical logon screen (test=
ed several times).
>=20
This problem is not caused by my patch.=20
Based on your syslog, it looks more like a shedule issue.
I just saw a similar problem, please refer to the link below
https://gitlab.freedesktop.org/drm/amd/-/issues/3124

Regards,
Ma Jun
> After that, I was not able to even log from another box with ssh, or the =
session would
> block (tested one time, second time too, thrid time it passed after I con=
nected before
> attempt to login on XWayland console).
>=20
> You might find useful syslog and dmesg of the freeze on this link (they w=
ere +100K):
>=20
> https://magrf.grf.hr/~mtodorov/linux/bugreports/6.7.0/amdgpu/6.7.0-xway-0=
9721-g61da593f4458/
>=20
> The exact applied patch was this:
>=20
> marvin@defiant:~/linux/kernel/linux_torvalds$ git diff
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd=
/amdgpu/gfx_v10_0.c
> index 73f6d7e72c73..6ef333df9adf 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> @@ -3996,16 +3996,13 @@ static int gfx_v10_0_init_microcode(struct amdgpu=
_device *adev)
>   =20
>           if (!amdgpu_sriov_vf(adev)) {
>                   snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_rlc.bin",=
 ucode_prefix);
> -               err =3D amdgpu_ucode_request(adev, &adev->gfx.rlc_fw, fw_=
name);
> -               /* don't check this.  There are apparently firmwares in t=
he wild with
> -                * incorrect size in the header
> -                */
> -               if (err =3D=3D -ENODEV)
> -                       goto out;
> +               err =3D request_firmware(&adev->gfx.rlc_fw, fw_name, adev=
->dev);
>                   if (err)
> -                       dev_dbg(adev->dev,
> -                               "gfx10: amdgpu_ucode_request() failed \"%=
s\"\n",
> -                               fw_name);
> +                       goto out;
> +
> +               /* don't validate this firmware.  There are apparently fi=
rmwares
> +                * in the wild with incorrect size in the header
> +                */
>                   rlc_hdr =3D (const struct rlc_firmware_header_v2_0 *)ad=
ev->gfx.rlc_fw->data;
>                   version_major =3D le16_to_cpu(rlc_hdr->header.header_ve=
rsion_major);
>                   version_minor =3D le16_to_cpu(rlc_hdr->header.header_ve=
rsion_minor);
> marvin@defiant:~/linux/kernel/linux_torvalds$ uname -rms
> Linux 6.7.0-xway-09721-g61da593f4458 x86_64
> marvin@defiant:~/linux/kernel/linux_torvalds$
>=20
> So, there seems to be a problem with the way the patch affects XWayland.
>=20
> Checked multiple times the exact commit with and without the diff.
>=20
> Hope this helps, because I am not familiar with the amdgpu driver.
>=20
> Best regards,
> Mirsad Todorovac
>=20
> On 1/22/24 09:34, Ma, Jun wrote:
>> Perhaps similar to the problem I encountered earlier, you can
>> try the following patch
>>
>> https://lists.freedesktop.org/archives/amd-gfx/2024-January/103259.html
>>
>> Regards,
>> Ma Jun
>>
>> On 1/21/2024 3:54 AM, Mirsad Todorovac wrote:
>>> Hi,
>>>
>>> The last email did not pass to the most of the recipients due to banned=
 .xz attachment.
>>>
>>> As the .config is too big to send inline or uncompressed either, I will=
 omit it in this
>>> attempt. In the meantime, I had some success in decoding the stack trac=
e, but sadly not
>>> complete.
>>>
>>> I don't think this Oops is deterministic, but I am working on a reprodu=
cer.
>>>
>>> The platform is Ubuntu 22.04 LTS.
>>>
>>> Complete list of hardware and .config is available here:
>>>
>>> https://domac.alu.unizg.hr/~mtodorov/linux/bugreports/amdgpu/6.7.0-rtl-=
v02-nokcsan-09928-g052d534373b7/
>>>
>>> Best regards,
>>> Mirsad
>>>
>>> -----------------------------------------------------------------------=
--------------------
>>> kernel: [    5.576702] BUG: kernel NULL pointer dereference, address: 0=
000000000000008
>>> kernel: [    5.576707] #PF: supervisor read access in kernel mode
>>> kernel: [    5.576710] #PF: error_code(0x0000) - not-present page
>>> kernel: [    5.576712] PGD 0 P4D 0
>>> kernel: [    5.576715] Oops: 0000 [#1] PREEMPT SMP NOPTI
>>> kernel: [    5.576718] CPU: 9 PID: 650 Comm: systemd-udevd Not tainted =
6.7.0-rtl-v0.2-nokcsan-09928-g052d534373b7 #2
>>> kernel: [    5.576723] Hardware name: ASRock X670E PG Lightning/X670E P=
G Lightning, BIOS 1.21 04/26/2023
>>> kernel: [    5.576726] RIP: 0010:gfx_v10_0_early_init (drivers/gpu/drm/=
amd/amdgpu/gfx_v10_0.c:4009 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:7478) am=
dgpu
>>> kernel: [ 5.576872] Code: 8d 55 a8 4c 89 ff e8 e4 83 ec ff 41 89 c2 83 =
f8 ed 0f 84 b3 fd ff ff 85 c0 74 05 0f 1f 44 00 00 49 8b 87 08 87 01 00 4c =
89 ff <48> 8b 40 08 0f b7 50 0a 0f b7 70 08 e8 e4 42 fb ff 41 89 c2 85 c0
>>> All code
>>> =3D=3D=3D=3D=3D=3D=3D=3D
>>>      0:	8d 55 a8             	lea    -0x58(%rbp),%edx
>>>      3:	4c 89 ff             	mov    %r15,%rdi
>>>      6:	e8 e4 83 ec ff       	call   0xffffffffffec83ef
>>>      b:	41 89 c2             	mov    %eax,%r10d
>>>      e:	83 f8 ed             	cmp    $0xffffffed,%eax
>>>     11:	0f 84 b3 fd ff ff    	je     0xfffffffffffffdca
>>>     17:	85 c0                	test   %eax,%eax
>>>     19:	74 05                	je     0x20
>>>     1b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
>>>     20:	49 8b 87 08 87 01 00 	mov    0x18708(%r15),%rax
>>>     27:	4c 89 ff             	mov    %r15,%rdi
>>>     2a:*	48 8b 40 08          	mov    0x8(%rax),%rax		<-- trapping inst=
ruction
>>>     2e:	0f b7 50 0a          	movzwl 0xa(%rax),%edx
>>>     32:	0f b7 70 08          	movzwl 0x8(%rax),%esi
>>>     36:	e8 e4 42 fb ff       	call   0xfffffffffffb431f
>>>     3b:	41 89 c2             	mov    %eax,%r10d
>>>     3e:	85 c0                	test   %eax,%eax
>>>
>>> Code starting with the faulting instruction
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>      0:	48 8b 40 08          	mov    0x8(%rax),%rax
>>>      4:	0f b7 50 0a          	movzwl 0xa(%rax),%edx
>>>      8:	0f b7 70 08          	movzwl 0x8(%rax),%esi
>>>      c:	e8 e4 42 fb ff       	call   0xfffffffffffb42f5
>>>     11:	41 89 c2             	mov    %eax,%r10d
>>>     14:	85 c0                	test   %eax,%eax
>>> kernel: [    5.576878] RSP: 0018:ffffa5b3c103f720 EFLAGS: 00010282
>>> kernel: [    5.576881] RAX: 0000000000000000 RBX: ffffffffc1d73489 RCX:=
 0000000000000000
>>> kernel: [    5.576884] RDX: 0000000000000000 RSI: 0000000000000000 RDI:=
 ffff91ae4fa80000
>>> kernel: [    5.576886] RBP: ffffa5b3c103f7b0 R08: 0000000000000000 R09:=
 0000000000000000
>>> kernel: [    5.576889] R10: 00000000ffffffea R11: 0000000000000000 R12:=
 ffff91ae4fa986e8
>>> kernel: [    5.576892] R13: ffff91ae4fa986d8 R14: ffff91ae4fa986f8 R15:=
 ffff91ae4fa80000
>>> kernel: [    5.576895] FS:  00007fdaa343c8c0(0000) GS:ffff91bd58440000(=
0000) knlGS:0000000000000000
>>> kernel: [    5.576898] CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003=
3
>>> kernel: [    5.576900] CR2: 0000000000000008 CR3: 00000001222d0000 CR4:=
 0000000000750ef0
>>> kernel: [    5.576903] PKRU: 55555554
>>> kernel: [    5.576905] Call Trace:
>>> kernel: [    5.576907]  <TASK>
>>> kernel: [    5.576909] ? show_regs (arch/x86/kernel/dumpstack.c:479)
>>> kernel: [    5.576914] ? __die (arch/x86/kernel/dumpstack.c:421 arch/x8=
6/kernel/dumpstack.c:434)
>>> kernel: [    5.576917] ? page_fault_oops (arch/x86/mm/fault.c:707)
>>> kernel: [    5.576921] ? srso_alias_return_thunk (arch/x86/lib/retpolin=
e.S:181)
>>> kernel: [    5.576925] ? crypto_alloc_tfmmem.isra.0 (crypto/api.c:497)
>>> kernel: [    5.576930] ? do_user_addr_fault (arch/x86/mm/fault.c:1264)
>>> kernel: [    5.576934] ? exc_page_fault (./arch/x86/include/asm/paravir=
t.h:693 arch/x86/mm/fault.c:1515 arch/x86/mm/fault.c:1563)
>>> kernel: [    5.576937] ? asm_exc_page_fault (./arch/x86/include/asm/idt=
entry.h:570)
>>> kernel: [    5.576942] ? gfx_v10_0_early_init (drivers/gpu/drm/amd/amdg=
pu/gfx_v10_0.c:4009 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:7478) amdgpu
>>> kernel: [    5.577056] amdgpu_device_init (drivers/gpu/drm/amd/amdgpu/a=
mdgpu_device.c:2465 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:4042) amdgpu
>>> kernel: [    5.577158] ? srso_alias_return_thunk (arch/x86/lib/retpolin=
e.S:181)
>>> kernel: [    5.577161] ? pci_bus_read_config_word (drivers/pci/access.c=
:67 (discriminator 2))
>>> kernel: [    5.577166] ? pci_read_config_word (drivers/pci/access.c:563=
)
>>> kernel: [    5.577168] ? srso_alias_return_thunk (arch/x86/lib/retpolin=
e.S:181)
>>> kernel: [    5.577171] ? do_pci_enable_device (drivers/pci/pci.c:1975 d=
rivers/pci/pci.c:1949)
>>> kernel: [    5.577176] amdgpu_driver_load_kms (drivers/gpu/drm/amd/amdg=
pu/amdgpu_kms.c:146) amdgpu
>>> kernel: [    5.577275] amdgpu_pci_probe (drivers/gpu/drm/amd/amdgpu/amd=
gpu_drv.c:2237) amdgpu
>>> kernel: [    5.577373] local_pci_probe (drivers/pci/pci-driver.c:324)
>>> kernel: [    5.577377] pci_device_probe (drivers/pci/pci-driver.c:392 d=
rivers/pci/pci-driver.c:417 drivers/pci/pci-driver.c:460)
>>> kernel: [    5.577381] really_probe (drivers/base/dd.c:579 drivers/base=
/dd.c:658)
>>> kernel: [    5.577386] __driver_probe_device (drivers/base/dd.c:800)
>>> kernel: [    5.577389] driver_probe_device (drivers/base/dd.c:830)
>>> kernel: [    5.577392] __driver_attach (drivers/base/dd.c:1217)
>>> kernel: [    5.577396] ? __pfx___driver_attach (drivers/base/dd.c:1157)
>>> kernel: [    5.577399] bus_for_each_dev (drivers/base/bus.c:368)
>>> kernel: [    5.577402] driver_attach (drivers/base/dd.c:1234)
>>> kernel: [    5.577405] bus_add_driver (drivers/base/bus.c:674)
>>> kernel: [    5.577409] driver_register (drivers/base/driver.c:246)
>>> kernel: [    5.577411] ? __pfx_amdgpu_init (drivers/gpu/drm/amd/amdgpu/=
amdgpu_drv.c:2497) amdgpu
>>> kernel: [    5.577521] __pci_register_driver (drivers/pci/pci-driver.c:=
1456)
>>> kernel: [    5.577524] amdgpu_init (drivers/gpu/drm/amd/amdgpu/amdgpu_d=
rvc:2805) amdgpu
>>> kernel: [    5.577628] do_one_initcall (init/main.c:1236)
>>> kernel: [    5.577632] ? kmalloc_trace (mm/slub.c:3816 mm/slub.c:3860 m=
m/slub.c:4007)
>>> kernel: [    5.577637] do_init_module (kernel/module/main.c:2533)
>>> kernel: [    5.577640] load_module (kernel/module/main.c:2984)
>>> kernel: [    5.577647] init_module_from_file (kernel/module/main.c:3151=
)
>>> kernel: [    5.577649] ? srso_alias_return_thunk (arch/x86/lib/retpolin=
e.S:181)
>>> kernel: [    5.577652] ? init_module_from_file (kernel/module/main.c:31=
51)
>>> kernel: [    5.577657] idempotent_init_module (kernel/module/main.c:316=
8)
>>> kernel: [    5.577661] __x64_sys_finit_module (./include/linux/file.h:4=
5 kernel/module/main.c:3190 kernel/module/main.c:3172 kernel/module/main.c:=
3172)
>>> kernel: [    5.577664] do_syscall_64 (arch/x86/entry/common.c:52 arch/x=
86/entry/common.c:83)
>>> kernel: [    5.577668] ? srso_alias_return_thunk (arch/x86/lib/retpolin=
e.S:181)
>>> kernel: [    5.577671] ? ksys_mmap_pgoff (mm/mmap.c:1428)
>>> kernel: [    5.577675] ? srso_alias_return_thunk (arch/x86/lib/retpolin=
e.S:181)
>>> kernel: [    5.577678] ? srso_alias_return_thunk (arch/x86/lib/retpolin=
e.S:181)
>>> kernel: [    5.577681] ? syscall_exit_to_user_mode (kernel/entry/common=
.c:215)
>>> kernel: [    5.577684] ? srso_alias_return_thunk (arch/x86/lib/retpolin=
e.S:181)
>>> kernel: [    5.577687] ? do_syscall_64 (./arch/x86/include/asm/cpufeatu=
reh:171 arch/x86/entry/common.c:98)
>>> kernel: [    5.577689] ? srso_alias_return_thunk (arch/x86/lib/retpolin=
e.S:181)
>>> kernel: [    5.577692] ? do_syscall_64 (./arch/x86/include/asm/cpufeatu=
reh:171 arch/x86/entry/common.c:98)
>>> kernel: [    5.577695] ? srso_alias_return_thunk (arch/x86/lib/retpolin=
e.S:181)
>>> kernel: [    5.577698] ? do_syscall_64 (./arch/x86/include/asm/cpufeatu=
reh:171 arch/x86/entry/common.c:98)
>>> kernel: [    5.577700] ? srso_alias_return_thunk (arch/x86/lib/retpolin=
e.S:181)
>>> kernel: [    5.577703] ? sysvec_call_function (arch/x86/kernel/smp.c:25=
3 (discriminator 69))
>>> kernel: [    5.577707] entry_SYSCALL_64_after_hwframe (arch/x86/entry/e=
ntry_64.S:129)
>>> kernel: [    5.577709] RIP: 0033:0x7fdaa331e88d
>>> kernel: [ 5.577724] Code: 5b 41 5c c3 66 0f 1f 84 00 00 00 00 00 f3 0f =
1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 =
0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 73 b5 0f 00 f7 d8 64 89 01 48
>>> All code
>>> =3D=3D=3D=3D=3D=3D=3D=3D
>>>      0:	5b                   	pop    %rbx
>>>      1:	41 5c                	pop    %r12
>>>      3:	c3                   	ret
>>>      4:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
>>>      b:	00 00
>>>      d:	f3 0f 1e fa          	endbr64
>>>     11:	48 89 f8             	mov    %rdi,%rax
>>>     14:	48 89 f7             	mov    %rsi,%rdi
>>>     17:	48 89 d6             	mov    %rdx,%rsi
>>>     1a:	48 89 ca             	mov    %rcx,%rdx
>>>     1d:	4d 89 c2             	mov    %r8,%r10
>>>     20:	4d 89 c8             	mov    %r9,%r8
>>>     23:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
>>>     28:	0f 05                	syscall
>>>     2a:*	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax		<-- tra=
pping instruction
>>>     30:	73 01                	jae    0x33
>>>     32:	c3                   	ret
>>>     33:	48 8b 0d 73 b5 0f 00 	mov    0xfb573(%rip),%rcx        # 0xfb5a=
d
>>>     3a:	f7 d8                	neg    %eax
>>>     3c:	64 89 01             	mov    %eax,%fs:(%rcx)
>>>     3f:	48                   	rex.W
>>>
>>> Code starting with the faulting instruction
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>      0:	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax
>>>      6:	73 01                	jae    0x9
>>>      8:	c3                   	ret
>>>      9:	48 8b 0d 73 b5 0f 00 	mov    0xfb573(%rip),%rcx        # 0xfb58=
3
>>>     10:	f7 d8                	neg    %eax
>>>     12:	64 89 01             	mov    %eax,%fs:(%rcx)
>>>     15:	48                   	rex.W
>>> kernel: [    5.577729] RSP: 002b:00007ffeb4f87d28 EFLAGS: 00000246 ORIG=
_RAX: 0000000000000139
>>> kernel: [    5.577733] RAX: ffffffffffffffda RBX: 000055aedf3eeeb0 RCX:=
 00007fdaa331e88d
>>> kernel: [    5.577736] RDX: 0000000000000000 RSI: 000055aedf3efb80 RDI:=
 000000000000001a
>>> kernel: [    5.577738] RBP: 0000000000020000 R08: 0000000000000000 R09:=
 0000000000000002
>>> kernel: [    5.577741] R10: 000000000000001a R11: 0000000000000246 R12:=
 000055aedf3efb80
>>> kernel: [    5.577744] R13: 000055aedf3f2060 R14: 0000000000000000 R15:=
 000055aedf2b1220
>>> kernel: [    5.577748]  </TASK>
>>> kernel: [    5.577750] Modules linked in: intel_rapl_msr intel_rapl_com=
mon amdgpu(+) edac_mce_amd kvm_amd kvm snd_hda_codec_realtek snd_hda_codec_=
generic irqbypass ledtrig_audio crct10dif_pclmul polyval_clmulni polyval_ge=
neric snd_hda_codec_hdmi ghash_clmulni_intel sha512_ssse3 sha256_ssse3 sha1=
_ssse3 amdxcp snd_hda_intel aesni_intel drm_exec snd_intel_dspcfg crypto_si=
md gpu_sched snd_intel_sdw_acpi cryptd nls_iso8859_1 drm_buddy snd_hda_code=
c snd_seq_midi drm_suballoc_helper snd_seq_midi_event drm_ttm_helper joydev=
 snd_hda_core input_leds ttm rapl snd_rawmidi snd_hwdep drm_display_helper =
snd_seq snd_pcm wmi_bmof cec k10temp snd_seq_device ccp rc_core snd_timer s=
nd drm_kms_helper i2c_algo_bit soundcore mac_hid tcp_bbr sch_fq msr parport=
_pc ppdev lp drm parport efi_pstore ip_tables x_tables autofs4 btrfs blake2=
b_generic xor raid6_pq libcrc32c hid_generic usbhid hid crc32_pclmul nvme r=
8169 ahci nvme_core i2c_piix4 xhci_pci libahci xhci_pci_renesas realtek vid=
eo wmi gpio_amdpt
>>> kernel: [    5.577817] CR2: 0000000000000008
>>> kernel: [    5.577820] ---[ end trace 0000000000000000 ]---
>>> kernel: [    5.914230] RIP: 0010:gfx_v10_0_early_init (drivers/gpu/drm/=
amd/amdgpu/gfx_v10_0.c:4009 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:7478) am=
dgpu
>>> kernel: [ 5.914388] Code: 8d 55 a8 4c 89 ff e8 e4 83 ec ff 41 89 c2 83 =
f8 ed 0f 84 b3 fd ff ff 85 c0 74 05 0f 1f 44 00 00 49 8b 87 08 87 01 00 4c =
89 ff <48> 8b 40 08 0f b7 50 0a 0f b7 70 08 e8 e4 42 fb ff 41 89 c2 85 c0
>>> All code
>>> =3D=3D=3D=3D=3D=3D=3D=3D
>>>      0:	8d 55 a8             	lea    -0x58(%rbp),%edx
>>>      3:	4c 89 ff             	mov    %r15,%rdi
>>>      6:	e8 e4 83 ec ff       	call   0xffffffffffec83ef
>>>      b:	41 89 c2             	mov    %eax,%r10d
>>>      e:	83 f8 ed             	cmp    $0xffffffed,%eax
>>>     11:	0f 84 b3 fd ff ff    	je     0xfffffffffffffdca
>>>     17:	85 c0                	test   %eax,%eax
>>>     19:	74 05                	je     0x20
>>>     1b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
>>>     20:	49 8b 87 08 87 01 00 	mov    0x18708(%r15),%rax
>>>     27:	4c 89 ff             	mov    %r15,%rdi
>>>     2a:*	48 8b 40 08          	mov    0x8(%rax),%rax		<-- trapping inst=
ruction
>>>     2e:	0f b7 50 0a          	movzwl 0xa(%rax),%edx
>>>     32:	0f b7 70 08          	movzwl 0x8(%rax),%esi
>>>     36:	e8 e4 42 fb ff       	call   0xfffffffffffb431f
>>>     3b:	41 89 c2             	mov    %eax,%r10d
>>>     3e:	85 c0                	test   %eax,%eax
>>>
>>> Code starting with the faulting instruction
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>      0:	48 8b 40 08          	mov    0x8(%rax),%rax
>>>      4:	0f b7 50 0a          	movzwl 0xa(%rax),%edx
>>>      8:	0f b7 70 08          	movzwl 0x8(%rax),%esi
>>>      c:	e8 e4 42 fb ff       	call   0xfffffffffffb42f5
>>>     11:	41 89 c2             	mov    %eax,%r10d
>>>     14:	85 c0                	test   %eax,%eax
>>> rsyslogd: rsyslogd's groupid changed to 111
>>> kernel: [    5.914394] RSP: 0018:ffffa5b3c103f720 EFLAGS: 00010282
>>> kernel: [    5.914397] RAX: 0000000000000000 RBX: ffffffffc1d73489 RCX:=
 0000000000000000
>>> kernel: [    5.914399] RDX: 0000000000000000 RSI: 0000000000000000 RDI:=
 ffff91ae4fa80000
>>> kernel: [    5.914402] RBP: ffffa5b3c103f7b0 R08: 0000000000000000 R09:=
 0000000000000000
>>> kernel: [    5.914405] R10: 00000000ffffffea R11: 0000000000000000 R12:=
 ffff91ae4fa986e8
>>> kernel: [    5.914408] R13: ffff91ae4fa986d8 R14: ffff91ae4fa986f8 R15:=
 ffff91ae4fa80000
>>> kernel: [    5.914410] FS:  00007fdaa343c8c0(0000) GS:ffff91bd58440000(=
0000) knlGS:0000000000000000
>>> kernel: [    5.914414] CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003=
3
>>> kernel: [    5.914416] CR2: 0000000000000008 CR3: 00000001222d0000 CR4:=
 0000000000750ef0
>>> kernel: [    5.914419] PKRU: 55555554
>>>
>>> Best regards,
>>> Mirsad
>>>
>>> On 1/18/24 18:23, Mirsad Todorovac wrote:
>>>> Hi,
>>>>
>>>> Unfortunately, I was not able to reboot in this kernel again to do the=
 stack decode, but I thought
>>>> that any information about the NULL pointer dereference is better than=
 no info.
>>>>
>>>> The system is Ubuntu 23.10 Mantic with AMD product: Navi 23 [Radeon RX=
 6600/6600 XT/6600M]
>>>> graphic card.
>>>>
>>>> Please find the config and the hw listing attached.
>>>>
>>>> Best regards,
>>>> Mirsad
>>>
>>>
>>>
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.576702] BUG: kernel NULL pointer derefer=
ence, address: 0000000000000008
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.576707] #PF: supervisor read access in k=
ernel mode
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.576710] #PF: error_code(0x0000) - not-pr=
esent page
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.576712] PGD 0 P4D 0
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.576715] Oops: 0000 [#1] PREEMPT SMP NOPT=
I
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.576718] CPU: 9 PID: 650 Comm: systemd-ud=
evd Not tainted 6.7.0-rtl-v0.2-nokcsan-09928-g052d534373b7 #2
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.576723] Hardware name: ASRock X670E PG L=
ightning/X670E PG Lightning, BIOS 1.21 04/26/2023
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.576726] RIP: 0010:gfx_v10_0_early_init+0=
x5ab/0x8d0 [amdgpu]
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.576872] Code: 8d 55 a8 4c 89 ff e8 e4 83=
 ec ff 41 89 c2 83 f8 ed 0f 84 b3 fd ff ff 85 c0 74 05 0f 1f 44 00 00 49 8b=
 87 08 87 01 00 4c 89 ff <48> 8b 40 08 0f b7 50 0a 0f b7 70 08 e8 e4 42 fb =
ff 41 89 c2 85 c0
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.576878] RSP: 0018:ffffa5b3c103f720 EFLAG=
S: 00010282
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.576881] RAX: 0000000000000000 RBX: fffff=
fffc1d73489 RCX: 0000000000000000
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.576884] RDX: 0000000000000000 RSI: 00000=
00000000000 RDI: ffff91ae4fa80000
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.576886] RBP: ffffa5b3c103f7b0 R08: 00000=
00000000000 R09: 0000000000000000
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.576889] R10: 00000000ffffffea R11: 00000=
00000000000 R12: ffff91ae4fa986e8
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.576892] R13: ffff91ae4fa986d8 R14: ffff9=
1ae4fa986f8 R15: ffff91ae4fa80000
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.576895] FS:=C2=A0 00007fdaa343c8c0(0000)=
 GS:ffff91bd58440000(0000) knlGS:0000000000000000
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.576898] CS:=C2=A0 0010 DS: 0000 ES: 0000=
 CR0: 0000000080050033
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.576900] CR2: 0000000000000008 CR3: 00000=
001222d0000 CR4: 0000000000750ef0
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.576903] PKRU: 55555554
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.576905] Call Trace:
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.576907]=C2=A0 <TASK>
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.576909]=C2=A0 ? show_regs+0x72/0x90
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.576914]=C2=A0 ? __die+0x25/0x80
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.576917]=C2=A0 ? page_fault_oops+0x154/0x=
4c0
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.576921]=C2=A0 ? srso_alias_return_thunk+=
0x5/0xfbef5
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.576925]=C2=A0 ? crypto_alloc_tfmmem.isra=
.0+0x35/0x70
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.576930]=C2=A0 ? do_user_addr_fault+0x30e=
/0x6e0
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.576934]=C2=A0 ? exc_page_fault+0x84/0x1b=
0
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.576937]=C2=A0 ? asm_exc_page_fault+0x27/=
0x30
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.576942]=C2=A0 ? gfx_v10_0_early_init+0x5=
ab/0x8d0 [amdgpu]
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577056]=C2=A0 amdgpu_device_init+0xefa/0=
x2de0 [amdgpu]
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577158]=C2=A0 ? srso_alias_return_thunk+=
0x5/0xfbef5
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577161]=C2=A0 ? pci_bus_read_config_word=
+0x47/0x90
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577166]=C2=A0 ? pci_read_config_word+0x2=
7/0x60
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577168]=C2=A0 ? srso_alias_return_thunk+=
0x5/0xfbef5
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577171]=C2=A0 ? do_pci_enable_device+0xe=
1/0x110
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577176]=C2=A0 amdgpu_driver_load_kms+0x1=
a/0x1c0 [amdgpu]
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577275]=C2=A0 amdgpu_pci_probe+0x1a8/0x5=
e0 [amdgpu]
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577373]=C2=A0 local_pci_probe+0x48/0xb0
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577377]=C2=A0 pci_device_probe+0xc8/0x29=
0
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577381]=C2=A0 really_probe+0x1d2/0x440
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577386]=C2=A0 __driver_probe_device+0x8a=
/0x190
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577389]=C2=A0 driver_probe_device+0x23/0=
xd0
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577392]=C2=A0 __driver_attach+0x10f/0x22=
0
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577396]=C2=A0 ? __pfx___driver_attach+0x=
10/0x10
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577399]=C2=A0 bus_for_each_dev+0x7a/0xe0
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577402]=C2=A0 driver_attach+0x1e/0x30
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577405]=C2=A0 bus_add_driver+0x127/0x240
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577409]=C2=A0 driver_register+0x64/0x140
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577411]=C2=A0 ? __pfx_amdgpu_init+0x10/0=
x10 [amdgpu]
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577521]=C2=A0 __pci_register_driver+0x68=
/0x80
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577524]=C2=A0 amdgpu_init+0x69/0xff0 [am=
dgpu]
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577628]=C2=A0 do_one_initcall+0x46/0x330
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577632]=C2=A0 ? kmalloc_trace+0x136/0x37=
0
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577637]=C2=A0 do_init_module+0x6a/0x280
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577640]=C2=A0 load_module+0x2419/0x2500
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577647]=C2=A0 init_module_from_file+0x9c=
/0xf0
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577649]=C2=A0 ? srso_alias_return_thunk+=
0x5/0xfbef5
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577652]=C2=A0 ? init_module_from_file+0x=
9c/0xf0
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577657]=C2=A0 idempotent_init_module+0x1=
84/0x240
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577661]=C2=A0 __x64_sys_finit_module+0x6=
4/0xd0
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577664]=C2=A0 do_syscall_64+0x76/0x140
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577668]=C2=A0 ? srso_alias_return_thunk+=
0x5/0xfbef5
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577671]=C2=A0 ? ksys_mmap_pgoff+0x123/0x=
270
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577675]=C2=A0 ? srso_alias_return_thunk+=
0x5/0xfbef5
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577678]=C2=A0 ? srso_alias_return_thunk+=
0x5/0xfbef5
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577681]=C2=A0 ? syscall_exit_to_user_mod=
e+0x97/0x1e0
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577684]=C2=A0 ? srso_alias_return_thunk+=
0x5/0xfbef5
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577687]=C2=A0 ? do_syscall_64+0x85/0x140
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577689]=C2=A0 ? srso_alias_return_thunk+=
0x5/0xfbef5
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577692]=C2=A0 ? do_syscall_64+0x85/0x140
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577695]=C2=A0 ? srso_alias_return_thunk+=
0x5/0xfbef5
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577698]=C2=A0 ? do_syscall_64+0x85/0x140
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577700]=C2=A0 ? srso_alias_return_thunk+=
0x5/0xfbef5
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577703]=C2=A0 ? sysvec_call_function+0x4=
e/0xb0
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577707]=C2=A0 entry_SYSCALL_64_after_hwf=
rame+0x6e/0x76
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577709] RIP: 0033:0x7fdaa331e88d
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577724] Code: 5b 41 5c c3 66 0f 1f 84 00=
 00 00 00 00 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89=
 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 73 b5 0f 00 =
f7 d8 64 89 01 48
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577729] RSP: 002b:00007ffeb4f87d28 EFLAG=
S: 00000246 ORIG_RAX: 0000000000000139
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577733] RAX: ffffffffffffffda RBX: 00005=
5aedf3eeeb0 RCX: 00007fdaa331e88d
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577736] RDX: 0000000000000000 RSI: 00005=
5aedf3efb80 RDI: 000000000000001a
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577738] RBP: 0000000000020000 R08: 00000=
00000000000 R09: 0000000000000002
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577741] R10: 000000000000001a R11: 00000=
00000000246 R12: 000055aedf3efb80
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577744] R13: 000055aedf3f2060 R14: 00000=
00000000000 R15: 000055aedf2b1220
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577748]=C2=A0 </TASK>
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577750] Modules linked in: intel_rapl_ms=
r intel_rapl_common amdgpu(+) edac_mce_amd kvm_amd kvm snd_hda_codec_realte=
k snd_hda_codec_generic irqbypass ledtrig_audio crct10dif_pclmul polyval_cl=
mulni polyval_generic snd_hda_codec_hdmi ghash_clmulni_intel sha512_ssse3 s=
ha256_ssse3 sha1_ssse3 amdxcp snd_hda_intel aesni_intel drm_exec snd_intel_=
dspcfg crypto_simd gpu_sched snd_intel_sdw_acpi cryptd nls_iso8859_1 drm_bu=
ddy snd_hda_codec snd_seq_midi drm_suballoc_helper snd_seq_midi_event drm_t=
tm_helper joydev snd_hda_core input_leds ttm rapl snd_rawmidi snd_hwdep drm=
_display_helper snd_seq snd_pcm wmi_bmof cec k10temp snd_seq_device ccp rc_=
core snd_timer snd drm_kms_helper i2c_algo_bit soundcore mac_hid tcp_bbr sc=
h_fq msr parport_pc ppdev lp drm parport efi_pstore ip_tables x_tables auto=
fs4 btrfs blake2b_generic xor raid6_pq libcrc32c hid_generic usbhid hid crc=
32_pclmul nvme r8169 ahci nvme_core i2c_piix4 xhci_pci libahci xhci_pci_ren=
esas realtek video wmi gpio_amdpt
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577817] CR2: 0000000000000008
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.577820] ---[ end trace 0000000000000000 =
]---
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.914230] RIP: 0010:gfx_v10_0_early_init+0=
x5ab/0x8d0 [amdgpu]
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.914388] Code: 8d 55 a8 4c 89 ff e8 e4 83=
 ec ff 41 89 c2 83 f8 ed 0f 84 b3 fd ff ff 85 c0 74 05 0f 1f 44 00 00 49 8b=
 87 08 87 01 00 4c 89 ff <48> 8b 40 08 0f b7 50 0a 0f b7 70 08 e8 e4 42 fb =
ff 41 89 c2 85 c0
>>>> rsyslogd: rsyslogd's groupid changed to 111
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.914394] RSP: 0018:ffffa5b3c103f720 EFLAG=
S: 00010282
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.914397] RAX: 0000000000000000 RBX: fffff=
fffc1d73489 RCX: 0000000000000000
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.914399] RDX: 0000000000000000 RSI: 00000=
00000000000 RDI: ffff91ae4fa80000
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.914402] RBP: ffffa5b3c103f7b0 R08: 00000=
00000000000 R09: 0000000000000000
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.914405] R10: 00000000ffffffea R11: 00000=
00000000000 R12: ffff91ae4fa986e8
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.914408] R13: ffff91ae4fa986d8 R14: ffff9=
1ae4fa986f8 R15: ffff91ae4fa80000
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.914410] FS:=C2=A0 00007fdaa343c8c0(0000)=
 GS:ffff91bd58440000(0000) knlGS:0000000000000000
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.914414] CS:=C2=A0 0010 DS: 0000 ES: 0000=
 CR0: 0000000080050033
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.914416] CR2: 0000000000000008 CR3: 00000=
001222d0000 CR4: 0000000000750ef0
>>>> kernel: [=C2=A0=C2=A0=C2=A0 5.914419] PKRU: 55555554
