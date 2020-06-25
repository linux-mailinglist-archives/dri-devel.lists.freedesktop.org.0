Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC7B209858
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jun 2020 03:52:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 115106E906;
	Thu, 25 Jun 2020 01:52:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690059.outbound.protection.outlook.com [40.107.69.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BE466E906;
 Thu, 25 Jun 2020 01:52:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z7cgAsH45kWDfEpyllLPvrbxrmJfil4DoKhK46CuUeXm3ORC3wjoF/rwiESmiZm0AcYqjNFFHYMimcT4a8PdByOv4x0XS1WT43vVSu1RPeW57pWgGz+HR7CBWItWWBtxgnZ/5t336ewndfEekUs8YuOsENykGykD6/hT3AVhXXS/IdmAAtsNlAwcfVKlQ33oPrOJcrIrGohQQ29zUWmlMW19Sjxsvh8RhKFKP56yg22YLsJWkQroOK6NW11yj68OOsKHLT1GpwV8kSuyGhL4kvqipXLDZNulDFCe5P+uWSH2Exrv9ZXNtNyavQofo65BJOXgHpPx4HpMDa07neKl+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bObtZdyFr+bG7kF7GhMBfUAy/7yNsxSLkzce240aa+M=;
 b=STDXkC7Np3Bodd2m/K/80uCWz0d9D2oQRA+fzqF+5P0QGgZ6rE5uqF6Nir4nI7arOhEStyt2QDmMqu25cMDTDwD1bXi1eIEqPsloLYXLfQR+3alvjX+Gt/CffVg63DmqTb/niCQAi9rgdhi+a0FlOZqBoNWD7kQlmy0FjGNx2Ng0GKsikp6E+q422xmZ5vNUdVb1N9iM1V8thcWfdjpSdclcoV8iB1KhzAXWv+81G6p/y8Ortt/I7HZEIS9h/qtJe0/1umNCMB/nhDsjr4OwMTQ2WJI9CUkoTm0hTZsz5T0D80GLPbWBJOsdnrOUN//55YYaiqsjwdNLTLodJsg6QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bObtZdyFr+bG7kF7GhMBfUAy/7yNsxSLkzce240aa+M=;
 b=1Lfh8OB/bA8NOmIxdgm7gm6VBZZAXlGPnlDlHRxAERf0t2FPL7FrmFCmNT+CoD6eAKtcsDkDQoZQHpJn0R7DD9VLKgWIRrdoDrjeQLh4d3btDkp4bzo1dubqxTMaC46UZxfHt1bHEtfadkajU2EvTo8EZ4vgqTog33Sk0fECjNg=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4340.namprd12.prod.outlook.com (2603:10b6:5:2a8::7) by
 DM5PR12MB2488.namprd12.prod.outlook.com (2603:10b6:4:b5::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.20; Thu, 25 Jun 2020 01:52:47 +0000
Received: from DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::f5e6:e937:2eac:18cf]) by DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::f5e6:e937:2eac:18cf%3]) with mapi id 15.20.3109.027; Thu, 25 Jun 2020
 01:52:47 +0000
Subject: Re: [PATCH v2 5/8] drm/amdgpu: Refactor sysfs removal
To: Greg KH <gregkh@linuxfoundation.org>
References: <1592719388-13819-1-git-send-email-andrey.grodzovsky@amd.com>
 <1592719388-13819-6-git-send-email-andrey.grodzovsky@amd.com>
 <20200622095124.GE20149@phenom.ffwll.local>
 <20200622112139.GA3421602@kroah.com>
 <fdaebe5b-3930-66d6-4f62-3e59e515e3da@amd.com>
 <20200622164551.GA112181@kroah.com>
 <4787b2a9-e7bf-ea3c-02e9-484a4fcb4742@amd.com>
 <20200623060532.GB3818201@kroah.com>
 <090c5a35-3088-d6d0-dcaf-5ce5542a4298@amd.com>
 <20200624061153.GA933050@kroah.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <c9b4dc5f-3b30-11e3-da33-bb92453f5f4a@amd.com>
Date: Wed, 24 Jun 2020 21:52:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <20200624061153.GA933050@kroah.com>
Content-Language: en-US
X-ClientProxiedBy: BN8PR15CA0066.namprd15.prod.outlook.com
 (2603:10b6:408:80::43) To DM6PR12MB4340.namprd12.prod.outlook.com
 (2603:10b6:5:2a8::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:f841:dc76:7c07:f4bf]
 (2607:fea8:3edf:49b0:f841:dc76:7c07:f4bf) by
 BN8PR15CA0066.namprd15.prod.outlook.com (2603:10b6:408:80::43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.21 via Frontend Transport; Thu, 25 Jun 2020 01:52:46 +0000
X-Originating-IP: [2607:fea8:3edf:49b0:f841:dc76:7c07:f4bf]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0ac1766c-2e34-40cb-bc51-08d818aa75e7
X-MS-TrafficTypeDiagnostic: DM5PR12MB2488:
X-Microsoft-Antispam-PRVS: <DM5PR12MB248839E84C9CB536AF7937BFEA920@DM5PR12MB2488.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-Forefront-PRVS: 0445A82F82
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ymXyGIunN1+iERbHNzPGHAFFI5vkMLLMgfGbDmF3gkoeJN5rUDVsvQ5WX5TrHMcnC5IEBI8Jv2zBzakwqAH5qduor+2c5eGYkn89rTTchFt0E3X9Sq/k1ZEGM3UoROn0gWr/JUJZwXYR/UN1yCYXkY6Tw4IUXob45NT5mHxRf8sb+S98q59N5c1TMUUvZnc8y/NfCUT9ph+9T3HqOf5p34cj57WdUyV6ISclmZ1EEe/GQACM0E9YL430R+LPLySyLLaLErdKtgrhnCVrbixBEgG+E9cQxn9eh8vADVAIOr4d7jNF3LKeRo9VwbR/uYH02tUpfpNlDAj6cKleLqC4Q9z1Snz5qdZkAvuoTCiQIO94wrdlYs7xcvsRZ9jdvF3m
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4340.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(39860400002)(376002)(346002)(136003)(366004)(316002)(6666004)(16526019)(186003)(83380400001)(6916009)(8936002)(66556008)(66476007)(6486002)(8676002)(66946007)(5660300002)(86362001)(31696002)(478600001)(53546011)(2616005)(52116002)(4326008)(36756003)(2906002)(31686004)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: /A4gWMvkqb/NiYvYzFrG9+6JLPsIa7OZsCjvmave5GZReXVpkECpywUrKElW/FDT8oYG/piQf2xqaZnz9JLBl2nRPvtC0sM+8UVMEpT9BLbeNxVVYNeM0trkOemHPv3xNYw5IaiHjDDVujIN6zNPgkpK4pGkNVv/05pncGl6WWgP5nF4il9TCwheccJoyfHyAAANRa785f4arKmNItAZYEfLt7mPnVQN3AY+FB0dpIn1AdzNKFHH9Iybhfby3ITQSQwaO/74JEUlCOsYas8FnC01wrJLiAS/U1005ApHPtMF+NcKwPV3Xg7i89DhxvY1YaEewCBr47Ats1es3RFV9ZvI07+Mb3CFy0yNm8dQ/9XvqXNmYIt/UJPbzVe4m1dy+oMZbxZW3viMNj8Dvz4nqpZDa0DYiJALFm61BKAYYubesziG6LkH4zBKJzi56Eu01OmfKqlhD/ZiY/JfBM7YXk/lUyz0+WgFaAqpgXODRVfO68XeaibTd9m+/2C5RZHhLAK92rCamcKU+f4cfPL0wE2UNTmTTy2xomz7WMMvUwOqj0Vgrj38G2thz82txqHB
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ac1766c-2e34-40cb-bc51-08d818aa75e7
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4340.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2020 01:52:47.5937 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UoPDTajnxqBq89g4MxdN2phDtH0W44WIi7JCveR7mGA0zIWzJU6+DUwQ8GJ9L2JvvipWFMuaQbS7N3n8+/8hrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2488
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
Cc: daniel.vetter@ffwll.ch, michel@daenzer.net, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, ckoenig.leichtzumerken@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/24/20 2:11 AM, Greg KH wrote:
> On Tue, Jun 23, 2020 at 11:04:30PM -0400, Andrey Grodzovsky wrote:
>> On 6/23/20 2:05 AM, Greg KH wrote:
>>> On Tue, Jun 23, 2020 at 12:51:00AM -0400, Andrey Grodzovsky wrote:
>>>> On 6/22/20 12:45 PM, Greg KH wrote:
>>>>> On Mon, Jun 22, 2020 at 12:07:25PM -0400, Andrey Grodzovsky wrote:
>>>>>> On 6/22/20 7:21 AM, Greg KH wrote:
>>>>>>> On Mon, Jun 22, 2020 at 11:51:24AM +0200, Daniel Vetter wrote:
>>>>>>>> On Sun, Jun 21, 2020 at 02:03:05AM -0400, Andrey Grodzovsky wrote:
>>>>>>>>> Track sysfs files in a list so they all can be removed during pci remove
>>>>>>>>> since otherwise their removal after that causes crash because parent
>>>>>>>>> folder was already removed during pci remove.
>>>>>>> Huh?  That should not happen, do you have a backtrace of that crash?
>>>>>> 2 examples in the attached trace.
>>>>> Odd, how did you trigger these?
>>>> By manually triggering PCI remove from sysfs
>>>>
>>>> cd /sys/bus/pci/devices/0000\:05\:00.0 && echo 1 > remove
>>> For some reason, I didn't think that video/drm devices could handle
>>> hot-remove like this.  The "old" PCI hotplug specification explicitly
>>> said that video devices were not supported, has that changed?
>>>
>>> And this whole issue is probably tied to the larger issue that Daniel
>>> was asking me about, when it came to device lifetimes and the drm layer,
>>> so odds are we need to fix that up first before worrying about trying to
>>> support this crazy request, right?  :)
>>>
>>>>>> [  925.738225 <    0.188086>] BUG: kernel NULL pointer dereference, address: 0000000000000090
>>>>>> [  925.738232 <    0.000007>] #PF: supervisor read access in kernel mode
>>>>>> [  925.738236 <    0.000004>] #PF: error_code(0x0000) - not-present page
>>>>>> [  925.738240 <    0.000004>] PGD 0 P4D 0
>>>>>> [  925.738245 <    0.000005>] Oops: 0000 [#1] SMP PTI
>>>>>> [  925.738249 <    0.000004>] CPU: 7 PID: 2547 Comm: amdgpu_test Tainted: G        W  OE     5.5.0-rc7-dev-kfd+ #50
>>>>>> [  925.738256 <    0.000007>] Hardware name: System manufacturer System Product Name/RAMPAGE IV FORMULA, BIOS 4804 12/30/2013
>>>>>> [  925.738266 <    0.000010>] RIP: 0010:kernfs_find_ns+0x18/0x110
>>>>>> [  925.738270 <    0.000004>] Code: a6 cf ff 0f 1f 44 00 00 66 2e 0f 1f 84 00 00 00 00 00 66 66 66 66 90 41 57 41 56 49 89 f6 41 55 41 54 49 89 fd 55 53 49 89 d4 <0f> b7 af 90 00 00 00 8b 05 8f ee 6b 01 48 8b 5f 68 66 83 e5 20 41
>>>>>> [  925.738282 <    0.000012>] RSP: 0018:ffffad6d0118fb00 EFLAGS: 00010246
>>>>>> [  925.738287 <    0.000005>] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 2098a12076864b7e
>>>>>> [  925.738292 <    0.000005>] RDX: 0000000000000000 RSI: ffffffffb6606b31 RDI: 0000000000000000
>>>>>> [  925.738297 <    0.000005>] RBP: ffffffffb6606b31 R08: ffffffffb5379d10 R09: 0000000000000000
>>>>>> [  925.738302 <    0.000005>] R10: ffffad6d0118fb38 R11: ffff9a75f64820a8 R12: 0000000000000000
>>>>>> [  925.738307 <    0.000005>] R13: 0000000000000000 R14: ffffffffb6606b31 R15: ffff9a7612b06130
>>>>>> [  925.738313 <    0.000006>] FS:  00007f3eca4e8700(0000) GS:ffff9a763dbc0000(0000) knlGS:0000000000000000
>>>>>> [  925.738319 <    0.000006>] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>>>>> [  925.738323 <    0.000004>] CR2: 0000000000000090 CR3: 0000000035e5a005 CR4: 00000000000606e0
>>>>>> [  925.738329 <    0.000006>] Call Trace:
>>>>>> [  925.738334 <    0.000005>]  kernfs_find_and_get_ns+0x2e/0x50
>>>>>> [  925.738339 <    0.000005>]  sysfs_remove_group+0x25/0x80
>>>>>> [  925.738344 <    0.000005>]  sysfs_remove_groups+0x29/0x40
>>>>>> [  925.738350 <    0.000006>]  free_msi_irqs+0xf5/0x190
>>>>>> [  925.738354 <    0.000004>]  pci_disable_msi+0xe9/0x120
>>>>> So the PCI core is trying to clean up attributes that it had registered,
>>>>> which is fine.  But we can't seem to find the attributes?  Were they
>>>>> already removed somewhere else?
>>>>>
>>>>> that's odd.
>>>> Yes, as i pointed above i am emulating device remove from sysfs and this
>>>> triggers pci device remove sequence and as part of that my specific device
>>>> folder (05:00.0) is removed from the sysfs tree.
>>> But why are things being removed twice?
>>
>> Not sure I understand what removed twice ? I remove only once per sysfs attribute.
> This code path shows that the kernel is trying to remove a file that is
> not present, so someone removed it already...
>
> thanks,
>
> gre k-h


That a mystery for me too...

Andrey


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
