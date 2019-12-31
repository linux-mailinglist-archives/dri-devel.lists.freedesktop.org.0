Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB58412D983
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2019 15:40:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7D5A6E239;
	Tue, 31 Dec 2019 14:40:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2063.outbound.protection.outlook.com [40.107.236.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A4E56E239;
 Tue, 31 Dec 2019 14:40:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NFHDi9CoZI2cViHcOv13EXNXO/cK4xm2aVt+q5o4pQntVwVaaFSlXhTzw0nmb2y4ZqzfDWR7OkVttljFf/IzRaN652SPQZp4X83gD2SdxgnMYv6QJNC5IvLTKyAaM6FsCINQgipEnvzwLSQWBmd8nNjDjKn+3n1bgJTLS9GiL/GpgUmxk0lfnbYV6ES+QGB7hp6KjWdJd2siz4l2nX0VlE4r/GiBM3E59h2scdvT6AbCzmPpkDslyUFgLJnWUHu7oy4S9WYPjFS53E//17FtILp/tqJadypiiiASk6+nuA8SdJv/4o762NzTuTCzEyXrFmW6RpY7cFIAwytxIqylaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M0RBgJK0umFAXLHOkKaUCulm682l7PlyMFmtmz1TX/A=;
 b=OSSpbpXXJ4Ex+3pFgXdkJYkqiGRMuhZG4w8hauUqpnULt4mIH6zdZkb7uai6SNRlufJDrGEtyBnbb1iLUO0w+yoVSroB442HoVv4oSUZIgFZ+WrsHKMQPuwwm2UtYskGQqwIjhzg726MHQFjMHhLIiQ9Y9rgIuir7IMc7RhamAsNRC9/IhF5jHOv+O7znDLIS7eHJIriRU9xLR1Ry9dKaG9bYLvG0SRMwaPH8pL6MjWCAgTzRNTKZI9adTK8Uhal9za7aUdDnk3r1ZHFsLug3sw77wKUnxKLZUBVG5yZi16MFclGQBTq9blyCgOJCnnSxMYg+FJwj8MyZ4FFw95aiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M0RBgJK0umFAXLHOkKaUCulm682l7PlyMFmtmz1TX/A=;
 b=PYXhbplANhRqK8uK2LrwLYm2jwz1zzSnicqf+Nr1depyitnUy7hHciEkIfNCiie99WST3ki0cKH60g8M3DcZvBkS4/+5RmfRAsetU7FvFUyiMjlc128i6lQwg0VuOjWD9SBOYl10xtcn+HZ1kO4rHispv95Gwg/jokVLE2W6F9k=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB2534.namprd12.prod.outlook.com (10.172.121.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2581.12; Tue, 31 Dec 2019 14:40:48 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::301e:b0c8:7af:d77d]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::301e:b0c8:7af:d77d%11]) with mapi id 15.20.2581.007; Tue, 31 Dec 2019
 14:40:48 +0000
Subject: Re: [PATCH] drm/dp_mst: correct the shifting in DP_REMOTE_I2C_READ
To: "Lin, Wayne" <Wayne.Lin@amd.com>, "Wentland, Harry"
 <Harry.Wentland@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20191230070516.4760-1-Wayne.Lin@amd.com>
 <084e73fe-0f8c-a9da-3b20-0dc6804e8602@amd.com>
 <DM6PR12MB413708FA6DB61C4CCE1ADFECFC260@DM6PR12MB4137.namprd12.prod.outlook.com>
From: Harry Wentland <hwentlan@amd.com>
Autocrypt: addr=hwentlan@amd.com; keydata=
 mQENBFhb4C8BCADhHHUNoBQ7K7LupCP0FsUb443Vuqq+dH0uo4A3lnPkMF6FJmGcJ9Sbx1C6
 cd4PbVAaTFZUEmjqfpm+wCRBe11eF55hW3GJ273wvfH69Q/zmAxwO8yk+i5ZWWl8Hns5h69K
 D9QURHLpXxrcwnfHFah0DwV23TrD1KGB7vowCZyJOw93U/GzAlXKESy0FM7ZOYIJH83X7qhh
 Q9KX94iTEYTeH86Wy8hwHtqM6ySviwEz0g+UegpG8ebbz0w3b5QmdKCAg+eZTmBekP5o77YE
 BKqR+Miiwo9+tzm2N5GiF9HDeI2pVe/egOLa5UcmsgdF4Y5FKoMnBbAHNaA6Fev8PHlNABEB
 AAG0J0hhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPokBNwQTAQgAIQUC
 WFvgLwIbAwULCQgHAgYVCAkKCwIEFgIDAQIeAQIXgAAKCRAtWBXJjBS24xUlCAC9MqAlIbZO
 /a37s41h+MQ+D20C6/hVErWO+RA06nA+jFDPUWrDJKYdn6EDQWdLY3ATeAq3X8GIeOTXGrPD
 b2OXD6kOViW/RNvlXdrIsnIDacdr39aoAlY1b+bhTzZVz4pto4l+K1PZb5jlMgTk/ks9HesL
 RfYVq5wOy3qIpocdjdlXnSUKn0WOkGBBd8Nv3o0OI18tiJ1S/QwLBBfZoVvfGinoB2p4j/wO
 kJxpi3F9TaOtLGcdrgfghg31Fb48DP+6kodZ4ircerp4hyAp0U2iKtsrQ/sVWR4mbe3eTfcn
 YjBxGd2JOVdNQZa2VTNf9GshIDMD8IIQK6jN0LfY8Py2uQENBFhb4C8BCAC/0KWY3pIbU2cy
 i7GMj3gqB6h0jGqRuMpMRoSNDoAUIuSh17w+bawuOF6XZPdK3D4lC9cOXMwP3aP9tTJOori2
 8vMH8KW9jp9lAYnGWYhSqLdjzIACquMqi96EBtawJDct1e9pVgp+d4JXHlgIrl11ITJo8rCP
 dEqjro2bCBWxijsIncdCzMjf57+nR7u86SBtGSFcXKapS7YJeWcvM6MzFYgIkxHxxBDvBBvm
 U2/mAXiL72kwmlV1BNrabQxX2UnIb3xt3UovYJehrnDUMdYjxJgSPRBx27wQ/D05xAlhkmmL
 FJ01ZYc412CRCC6gjgFPfUi2y7YJTrQHS79WSyANABEBAAGJAR8EGAEIAAkFAlhb4C8CGwwA
 CgkQLVgVyYwUtuM72Qf+J6JOQ/27pWf5Ulde9GS0BigA1kV9CNfIq396TgvQzeyixHMvgPdq
 Z36x89zZi0otjMZv6ypIdEg5co1Bvz0wFaKbCiNbTjpnA1VAbQVLSFjCZLQiu0vc+BZ1yKDV
 T5ASJ97G4XvQNO+XXGY55MrmhoNqMaeIa/3Jas54fPVd5olcnUAyDty29/VWXNllUq38iBCX
 /0tTF7oav1lzPGfeW2c6B700FFZMTR4YBVSGE8jPIzu2Fj0E8EkDmsgS+nibqSvWXfo1v231
 410h35CjbYDlYQO7Z1YD7asqbaOnF0As+rckyRMweQ9CxZn5+YBijtPJA3x5ldbCfQ9rWiTu XQ==
Message-ID: <d5602f5a-1b9a-1a88-c5e4-1412b96a683a@amd.com>
Date: Tue, 31 Dec 2019 09:40:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
In-Reply-To: <DM6PR12MB413708FA6DB61C4CCE1ADFECFC260@DM6PR12MB4137.namprd12.prod.outlook.com>
Content-Language: en-US
X-ClientProxiedBy: YTBPR01CA0023.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::36) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
MIME-Version: 1.0
Received: from [IPv6:2607:fea8:9240:e3a::6] (2607:fea8:9240:e3a::6) by
 YTBPR01CA0023.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2581.11 via Frontend Transport; Tue, 31 Dec 2019 14:40:47 +0000
X-Originating-IP: [2607:fea8:9240:e3a::6]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5e631e03-d31f-44ed-90b4-08d78dff6cc9
X-MS-TrafficTypeDiagnostic: CY4PR1201MB2534:|CY4PR1201MB2534:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR1201MB25346E3DA14AAB532529FA068C260@CY4PR1201MB2534.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:363;
X-Forefront-PRVS: 0268246AE7
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(396003)(376002)(346002)(39860400002)(189003)(199004)(5660300002)(8936002)(6486002)(81166006)(81156014)(66476007)(66946007)(66556008)(2616005)(8676002)(31696002)(6666004)(31686004)(36756003)(4001150100001)(2906002)(4326008)(186003)(53546011)(478600001)(110136005)(54906003)(52116002)(316002)(16526019)(70780200001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB2534;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o5oTvp+KrzVk9OJBraFBxQbdrQOyGPrtg0b+FdxWTncFskO72y2sWRAL3ccasdv7aH4nO4xIGZzQjXGkFlReB5T8k/LX6qos2e2mZWArA+SMLP1niRiTiDFyb4XP4fzAVyj9O+PPDEKdNGYmNxn4gzCjy8ncTvxHNw2139XkV2gra32h1w78bmlqbuc7Z2aF2IKLssg1xQtz0hBmep5mWpYSIISPGyt321k/QDoWWJYLjfIQRc8OH5q7t+QiHz187jhz7VxzeYXvI3af9w+Uh2zoBcBMtSBYBI9g2LWnuSxK0XSSNgMZ0170Sxxnv1CWkreCvr0ptoOxZ7FlE8is42afJ1lg8n0XI97+bs43xgEAXXiPDrkR25gCjZiLqjhnsyIZW7q0DDrg0eo1kFjwPRZGwSy1DSpzefBaEZxv1qkcTqOqyZtvXryjYJb0DDXRqgHO7jale2qDivGREioHwEOCCS50Q0x9px97+V+ntmCyI2QSZQ7o+w/JzYePdljs
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e631e03-d31f-44ed-90b4-08d78dff6cc9
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2019 14:40:48.0189 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A8QEGxIWd4Gd96lhISYe5fP/WwiI65x7xfwzc7UXVzXgQVIOwigchtc9UBddXn1oAFGZaO+6Cf+CSRwa/+pNog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB2534
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
Cc: "Zuo, Jerry" <Jerry.Zuo@amd.com>, "Kazlauskas,
 Nicholas" <Nicholas.Kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2019-12-30 11:00 p.m., Lin, Wayne wrote:
> [AMD Official Use Only - Internal Distribution Only]
> 

Make sure to select the correct AIP designation for public emails. See
my email on that from yesterday. :)

>> ________________________________________
>> From: Wentland, Harry <Harry.Wentland@amd.com>
>> Sent: Monday, December 30, 2019 23:26
>> To: Lin, Wayne; dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
>> Cc: lyude@redhat.com; Zuo, Jerry; Kazlauskas, Nicholas; Wentland, Harry
>> Subject: Re: [PATCH] drm/dp_mst: correct the shifting in DP_REMOTE_I2C_READ
>>
>> On 2019-12-30 2:05 a.m., Wayne Lin wrote:
>>> [Why]
>>> According to DP spec, it should shift left 4 digits for NO_STOP_BIT
>>> in REMOTE_I2C_READ message. Not 5 digits.
>>>
>>> [How]
>>> Correct the shifting value of NO_STOP_BIT for DP_REMOTE_I2C_READ case in
>>> drm_dp_encode_sideband_req().
>>>
>>> Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
>>
>> Good catch. Looks like this has been there since the beginning of MST in
>> the kernel. How did you find this? Did this cause bad EDID reads or some
>> other problem? If so the commit message should probably mention it.
>>
>> Harry
> Thanks for your time.
> 
> I found this while I was trying to debug MST issues by using AUX monitor.
> So far, I don't observe problems that relate to this under my test cases and environment.
> However, this bit might affect the I2C signal generated by I2C master, I will mention more
> in the commit message.
> 

Thanks. Was just curious if you saw any real issues. Good find
nevertheless and good patch.

You can add my
Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> Thanks.
>>
>>> ---
>>>  drivers/gpu/drm/drm_dp_mst_topology.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
>>> index 1d1bfa49ca2b..0557e225ff67 100644
>>> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
>>> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
>>> @@ -393,7 +393,7 @@ drm_dp_encode_sideband_req(const struct drm_dp_sideband_msg_req_body *req,
>>>                       memcpy(&buf[idx], req->u.i2c_read.transactions[i].bytes, req->u.i2c_read.transactions[i].num_bytes);
>>>                       idx += req->u.i2c_read.transactions[i].num_bytes;
>>>
>>> -                     buf[idx] = (req->u.i2c_read.transactions[i].no_stop_bit & 0x1) << 5;
>>> +                     buf[idx] = (req->u.i2c_read.transactions[i].no_stop_bit & 0x1) << 4;
>>>                       buf[idx] |= (req->u.i2c_read.transactions[i].i2c_transaction_delay & 0xf);
>>>                       idx++;
>>>               }
>>>
> --
> Wayne Lin
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
