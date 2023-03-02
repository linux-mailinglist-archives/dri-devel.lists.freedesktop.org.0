Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DB96A836A
	for <lists+dri-devel@lfdr.de>; Thu,  2 Mar 2023 14:21:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEB4310E4F3;
	Thu,  2 Mar 2023 13:21:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2071.outbound.protection.outlook.com [40.107.95.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05A8510E4F3
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Mar 2023 13:21:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kEtnCW8NYEgSe78psZyS7Mylm+M2zZ7WlboSND+EE43IEwj0Uhpte7ZV3e28W5llyZSYeiiCaKCQTQ4GKPg/5kK7W2SNeaztq+unK0MuC4nR+3Q3yibWIgASAuDucmXCROpl/u6ydfEsO1nzGFqCr3JjwH6vgOyJnE8FDyGDxmRoD2XUsk8Z74PuHT3619cKOxMv9Aie/cY0BhE4CsEAyS22F2CorTzU+GYd/Nxogw1PDtDaPLTZ6xkf+h2WjrPu8VOoNMXM9eY/1gF5RiOSG0GartkpwU1mvJFHiBBYFGnQ2NwB3o0D5T7q7gpkCg/5zIxk3wmGTI9Tio09p54oug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1motOSVnJmcxp5CBGNn228Jr9C7VWFjyMuyccLJjIso=;
 b=EHr2oJEBlSoct+c75pWjqrKCMQSKbwY4RRVh3azom6tL1vb1N459XgKzzB0fHVitGfNePWU3ALTfLWMUnmtHOv8TiEsfRiNqQX8wY2lKvsWIqigBTVAw7NOn4Ni8F/dcsDF8HiPTMcsklBohe7pmDAkRt64fxyzAgl0nCmMMqGHTFvwGebkj7MFX4cwY9n+PN59Uq6QowkWIQ53/QdhWmHhxNrTSuNJ6hdcqWl2bU+qsQXEGLELRTsmEOXN1MDhSHYv8l4VXfWYW4k6Cl9JYf+ngyOCY1CSKy+EC2g0vHxLL2iwdjZFsqOYrtDB2IWfkD890hqoddlnsAS0mmEahTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1motOSVnJmcxp5CBGNn228Jr9C7VWFjyMuyccLJjIso=;
 b=HDWHFrQBmh6Ua0w8Rnvt/WTzj8krKTEiIm+diKq1p7/Rhx/c40TRj2cGLOEMSfIb9vdBV5xzlcXhllXRrUbKsWmTQ0Lg4hdPvN21aBMUchk1Dclj7eBzfx2HSTgU8b7ehDi14LXzmUYLlUkFDFDv1mERSuvrxu5a1WhrzaOr+QU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SN7PR12MB6790.namprd12.prod.outlook.com (2603:10b6:806:269::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.19; Thu, 2 Mar
 2023 13:21:22 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918%4]) with mapi id 15.20.6134.030; Thu, 2 Mar 2023
 13:21:22 +0000
Message-ID: <e5b9ee07-f74a-8d00-066e-92c9c23eb32b@amd.com>
Date: Thu, 2 Mar 2023 14:21:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] drm/vram-helper: turn on PRIME import/export
Content-Language: en-US
To: Simon Ser <contact@emersion.fr>
References: <20230301222903.458692-1-contact@emersion.fr>
 <e3fa0ef2-b9a0-ef53-abb5-edaa14eb3f9b@amd.com>
 <R1BP91PubkIEl7OMjpEUBo5n8CdMZ4yW4KHtgZJZ3Ay0qJ9GREsN7oKCr5k2H6g_r03AEX0w0owgO6jBZXaKSDjzh4OH1S7LDHd1QXicvxE=@emersion.fr>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <R1BP91PubkIEl7OMjpEUBo5n8CdMZ4yW4KHtgZJZ3Ay0qJ9GREsN7oKCr5k2H6g_r03AEX0w0owgO6jBZXaKSDjzh4OH1S7LDHd1QXicvxE=@emersion.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0164.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::14) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SN7PR12MB6790:EE_
X-MS-Office365-Filtering-Correlation-Id: 39376d44-3b7b-4a2b-0ac0-08db1b210416
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tNhkLzhYdowsBFWCYEdvzeuQurw3S186hGRerXwFcPBJ/nj8hluyafyFBkU7xED8y26GKlhDAtqzOA2IT2Zk8uobcsGaqvOELjFX40NsjE7TKpMwLv3k/KL4z4XTdoY6VnfePtELGCD44zWLwAVjU818Li2+n6gm6j2EkXLsQ49UrKjymAMHcfDITYFKaTon9YcvmxacIWkgMskWlJnnndFmHcL9Fhld4nX8SOzZWsduVcg4Z+baSG61dlf8ZuuPnL1qEw+6zbnoWkpcF/28l1rd7H3zBll3//N0xA0ivraUfSYawr9R2NlvTSOq7revmjC9VpfNFoIpKz8ngwpnCky3hGD6pg4Fuz2hkmq/15Cx+je7yYS8CWR98+IbNUq+IqA37yUbuLbZS8RvyDeLkD+yjShhWWSNK+CR0yGaki1sLuvU4gvw4C3uG//YfAFNP6i1VWR9G5aaSixspzjUqTupk37nnlxdDteiVkNqCzwpzhyrpLkcA6+l3Coa2OGLgLUQ5NzjhA0e7DIwgTxz5cY45lfsbUgIK/sXOxHZYfhWrzZWsOZUdnARmkvDawv0/f8xKAxukX44tVdDZuEUBZC/PAQnFjg2NW+12u0BmUpgfF9utVW6TfbdsBDIN7OmoKvvsRgzyCouVnrUYbLn4WNqZ944efAs7jMSyle1fyESpMHLD7zvnF30i86YSqrGsDbzL5Jgy8rp92/O09aZXR++ztV5ZxkE6M6DbwPzd+0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(39860400002)(366004)(136003)(346002)(396003)(451199018)(66574015)(31686004)(6666004)(36756003)(38100700002)(5660300002)(478600001)(66946007)(31696002)(86362001)(8936002)(26005)(186003)(2616005)(6512007)(6506007)(6486002)(66476007)(66556008)(2906002)(4744005)(8676002)(6916009)(41300700001)(4326008)(316002)(54906003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmRSOEFxeVhmUGhPaSsrR1p1d1ZaWi9scU94MkFLcFV3bjNEL3JCRnl5a0s0?=
 =?utf-8?B?S1hWQ01wQWJHMkx5c09YZkVMN0pnWkxQc0djQlVUbjZsU3EraStpcnNNaFJl?=
 =?utf-8?B?NWxFNlBKWm1HZGNYV1MyUWV0U3o0U1lUemt4QlNaTUViYTVCZW4rSjB5S2tF?=
 =?utf-8?B?Zi9iSUViWW9ZN1hnTjRacWJaVGJWVXU0b2lseVp5bHZyT1VFZGs4bzExcndw?=
 =?utf-8?B?Mlo2VkIzdjJRWWc0TlFuc0ppQ2R1NVhEbXFReGVGbG5abDExZ0hWVzN3OGx2?=
 =?utf-8?B?dFgvYnlPeHpWT2pUdkgzMm45S1hBQ3lEMHZTeEdGU1RRbGo3V09OMzZtT200?=
 =?utf-8?B?L0FvL1p3emV2bWJGNlpGcWx1VXVkckVhNEp2YU9HTDY2M2k1VTZhTDZQeC8z?=
 =?utf-8?B?K0EzbU5PVnpWd0tweDI3WURkMjdsbkZZR01qY1B3aFJmRmoyRndoNVhtL3o5?=
 =?utf-8?B?QXc3NlMxdEJpOFRUendRT2FHSnk3Und3bVJaSGh0akZ1TWUwZDBlMlUzMzl6?=
 =?utf-8?B?VnFtbnRrZG9hMkNTNEtoRXhtTldrbkZ4dnUvVmJYN2t4NlRSenZvTlcxTXhU?=
 =?utf-8?B?cUFnSnltK1pjM2crSkVuV2Rad2xkSHVyZXFoWmVidTUwU1JXMTh5Nkl1QUVk?=
 =?utf-8?B?MjdUbTVyeTRkem13RUVwbGZ1ZXhUekd6TEdHTWxMSmxGcHdWYXlZcVFlNllN?=
 =?utf-8?B?SFVhV2dUZ2FnQ1VOYks2Yml0NkQzOVRGa3RmRXJzdUtzY1FyVFd4NHo2YnVk?=
 =?utf-8?B?NjNIQTZoaVYxc3BwSkgzY1ZWaG83elNRSWZjYkNpN2d3dFc3YzVkdmlFU3Nw?=
 =?utf-8?B?dzhEbmdncHNRT1c1Rmx5Z2cweWpWaXBqaUlLZWRSYS9yd1hlR0JHa2h5NEJj?=
 =?utf-8?B?MmlJMDFTdVpVM0NVTkpHampFL3d3VlB1RmNqZitLUi8yS0QyOUJCMmJmMGZD?=
 =?utf-8?B?ZzN2a0lGaDVUbUY1RWhoVXlvYkNGRTVEYjZ1T29LaW90VEhia1FGYWt0Mm5W?=
 =?utf-8?B?TlAxT0t3dEJEbzhIbG5MdGFNaHhNMzN3VWtJUUtzcEFtQ2I2VmExMlZ5NWxv?=
 =?utf-8?B?aHJxc1NreE1CVEFMVWJ3SURLaVlpeHZCbTdzLzlHUHJGOUhFTW53OFlxSjhY?=
 =?utf-8?B?cU5kTmVjMmRHYmpsc0hvWEhzbEFRWGdLTlgyeUY3ZE1jYWRVVkx6cGZscE1N?=
 =?utf-8?B?MHZmUWpPQ2JqY1B5V3Vyai82U1ZvRWx3UW1xYks2YlFBTERaeDJLQlpoZVo4?=
 =?utf-8?B?TTlPY2hTN3dLQVY3dEhnakFlZEF5Ukp4S05XTkhhd0g1WXdPcDV0NDJFbmdx?=
 =?utf-8?B?N29Cd21vVFJjaUJHdjhacVdHOVJ1anJuR1dGaUtsUzFzMmhiakNkVTRmTnhL?=
 =?utf-8?B?Wk53OWpIeGlLaHM2cXJWOURrWWdneG1pVU9ZV0kyQ3B0d1ZiRGhMQnJqSDZE?=
 =?utf-8?B?TTVQY3FUUDFWaWQ5Z1VrdEZJVUZjaU1Bb3pWalBoT1ZOTklVdmxQdzZiL0dx?=
 =?utf-8?B?ME92TnRMcWxWTXhmMlNOTkpSaDJiYXExSExaZXVsczRDdmtrWG1ycHExa2hs?=
 =?utf-8?B?bXREMkxMdG5VcmFkY2xiQ0xrdUxYbFZQOTNwRDAxam5RUkdUcmFNTkF3Nlp5?=
 =?utf-8?B?bHBZNFdmU01paXhWTVdDdWlJa3NJNTBWbE9qWXpVejJtYyt2dEcrQzA2N1V2?=
 =?utf-8?B?Q285VjU3Rm1DL2REdzgrNkJxS0krWmVROFE0ak9vS21xRmVKVzhqWW1zOHNJ?=
 =?utf-8?B?ZnB5czRXb0hjclhuQXExendGWS9NYm5rT1FnTXJXZ2pDaHNxVHBhNzljZmpz?=
 =?utf-8?B?U3BLdHBnSU42ZHF1Mnd1Z3J3N3YycmRkNWVINHZmT0pLN0FiTCszY2s3L3k0?=
 =?utf-8?B?d1RLS28xenhXQTlVU1JnMmFWOUp6QkRkSGhybHhubHBDM0M2V0YwVkVjajVN?=
 =?utf-8?B?UUhOOEtqQVRGOVA4dGpqdVduK2FreFBkM2J6V0pNQVZjK050bDNpR1RIaVZy?=
 =?utf-8?B?TU4vclBsVE1yMDE3emVUcURaMmNoTk93WW0zcldWRWFRcm91QzBxWHpQRXBk?=
 =?utf-8?B?UmtvZlNDS1c3TGZNWTlucTFDdk8xelFualBBd2RMSXE1Z0NRQ1o0RE4wNGNa?=
 =?utf-8?Q?HpKF8RVy9T3ssUXW4G+hDg4D2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39376d44-3b7b-4a2b-0ac0-08db1b210416
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2023 13:21:22.2293 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ErqMiBO0CgdWiRLVR6S6oTU6uAkideeD5B7PW2JI+VuKbD1yzcib924FeaS/tEs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6790
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>, Tian Tao <tiantao6@hisilicon.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 02.03.23 um 11:14 schrieb Simon Ser:
> On Thursday, March 2nd, 2023 at 08:11, Christian König <christian.koenig@amd.com> wrote:
>
>> Am 01.03.23 um 23:29 schrieb Simon Ser:
>>
>>> We don't populate gem_prime_import_sg_table so only DMA-BUFs
>>> exported from our own device can be imported. Still, this is useful
>>> to user-space.
>> But what happens if one of your BOs is imported into another device?
> Is there a way to make this fail, always?

Well you could return an error from the attach callback if I'm not 
completely mistaken.

But that's certainly not a standard function of the DRM helpers.

Regards,
Christian.
