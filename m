Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCEB7E9705
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 08:22:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B57E310E034;
	Mon, 13 Nov 2023 07:22:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2078.outbound.protection.outlook.com [40.107.220.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90D5110E034;
 Mon, 13 Nov 2023 07:22:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QLo1GIUnqwvwR37TgwEfR2Uij5Iy4wB9TkZJiKs6xjM4QLQ38gZOAigQ43xKs9xqgNnkMLRmEvPenYE0IQrVwv1r2+jhO7h2f/EMy8IBMRy5VUSsMO28vnmGoaOfinc6Sv0gXo2phdXLcrLV1fME2tA+NrGJnD+aC6hN3UNSjbMBqjutZTxSm6uyVqV5xkYYLm3/+tUx+ND932Gf+165UIEy64sB5tX3sGfPsDI0J+myjEpx7AFe4wACzOV9Sjp3dx3DzSLGjZ4nOGbpo5JR4ig7r3+Id0b2lh2Xp34Ge2F5wva3MN0UwpPBt27WT12l+QnLpjRo+lTzgc8S7G1PnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OAewY52nRCdR8V/18QbUkJMgvU0waWYcHC8yn6+/Xwc=;
 b=A4LdtxBuLRYsUYD5JgTmHDsOBCF97nmOlYZgWb/Mg64dezILj6PP2AZxIW0+8Pz1OZYIg3aULPI2DbBb0vHdnBpsbWzDvY81HGEQ4RIeh0sIKk8WO6BXGBVBqTF/N8mTzrMSqsQjFmhmtZ8si4LlPIzzdOGgaR6OsIKa3xWNitCpzXAU5kcfLwcU3XNG2fryFm38tBauZiOq8scTHYNsGypO8qVSxPBOeEG7Zi4H9mmDrTad+0IM9SPbr/RoLZRYY9KBPnwEe2rLEA9t/tv5TtRAEsBn3JPd4GmVKa6IVs9Zy13Dz1Tqbacgw0aZI62iOddWlPrmvSM9atmJHsVdXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OAewY52nRCdR8V/18QbUkJMgvU0waWYcHC8yn6+/Xwc=;
 b=iqXReRTOiNgHF2KfnqigiTpVXnAKRAmPHI4usR1kRVoZs8bg987glkFayiN+X52LDtSRjMREdnDBeYp3POIctnVC6Plh0dt7TcLnQkmfmifbpVRMBszJ4V6vdGvwdOOPHf2FQnJsMm95cfWVfW0Z9D6iMVPemPfYPtB35oixlXY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CY5PR12MB6203.namprd12.prod.outlook.com (2603:10b6:930:24::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Mon, 13 Nov
 2023 07:22:24 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%7]) with mapi id 15.20.6977.029; Mon, 13 Nov 2023
 07:22:24 +0000
Message-ID: <71a50cac-3253-480f-adff-da475738ae6b@amd.com>
Date: Mon, 13 Nov 2023 08:22:18 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH drm-misc-next v8 09/12] drm/gpuvm: reference count
 drm_gpuvm structures
Content-Language: en-US
To: Danilo Krummrich <dakr@redhat.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
References: <20231101233113.8059-10-dakr@redhat.com>
 <be93d9ef-3d3e-4262-a280-d2922b983ca1@amd.com> <ZUTyGTxcH7WlHKsv@pollux>
 <a2e13a27-d2e5-4ae3-9c11-c18b425b69cc@amd.com>
 <b533af44-0404-49c9-9879-3414d0964acc@redhat.com>
 <51dea5f3-a18b-4797-b4fa-87da7db4624a@amd.com> <ZUjZFFtLM435tTxJ@pollux>
 <8e87d962-c80c-40d9-94d7-58b6cd9dd794@amd.com> <ZUj0DdYZUgjhcvf5@pollux>
 <6d3c48f6-a92d-49b3-b836-ee1bc95b56bf@amd.com> <ZUkXkJ+zT7OFGosC@pollux>
 <44bc28c7-05f4-4419-5183-453c4951aac0@linux.intel.com>
 <6c536c94-7072-403c-9c63-d932252fd66b@amd.com>
 <4532d9d5-4c5a-4639-8136-d3ba9995d7b6@redhat.com>
 <1d4ca394-ee0c-4617-adbe-1d47e295c8fb@amd.com>
 <987ac707-8f9b-4e33-86c3-decdc1c48a3a@redhat.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <987ac707-8f9b-4e33-86c3-decdc1c48a3a@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR5P281CA0047.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::10) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CY5PR12MB6203:EE_
X-MS-Office365-Filtering-Correlation-Id: f0886d0a-5fe3-4a19-6983-08dbe4194861
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /rUCrFBB5t6UbzZPxpQLUYU4UneOvWnrJYrVMiirFs29k3TftHxfocBu9/ovld/OlhloTaRGAAD4gyj4YxF2r5PDU94KfmOGAOM4OMIXmnjT5JEulY/vyq46sD2D52Xv5Zyu/MH3PJKU6Qb4shct5qPn9kvuM1efO1aGj8/Ze0ypclMZBNMLi2p8LccVr2g9myQWM7U/1lZs/0DiFe62YpyOTYI4e4Kt4kCdUiQn8F5HrD9vYojz7lnH6DkazZdoAc8Khg8HmyOORF7JU/wj2ZJwplHAYwWm6N/ESi9RG2Sc5WHMsJORBfjCLm93tBPeXsOgRieTKihE9lYagOUylECRZ9aZxO7B1YTTGHUVq1Rkgmexc4ZF2D/8JXxQBcAls76/nmG5NSYtDLvOBxYrgqVTZgrl34pl3Dc7WfGQ5UEMr9LRS1hUpjXWRqCIPcwlZ9VTKOkoezQpkJjaWaUC0QxFidLFh4l7iFbUVtX64eaoR+ue1qRImEuUXrZVx694jW7bd11Wj4SQvaUOemqbMWeFimgaeZs3LAl/VMvKjo0OyvtwQBk0T/JjE8dUOSu3qCXr0kjPJImY1n1RyDlsFqK25uLw4z+abOPvoFL9lzpilb5kUpQHkUmJau5Jl2vDiD3+TfpgD1OzqzkBkzD74w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(136003)(396003)(39860400002)(366004)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(7416002)(5660300002)(86362001)(6486002)(478600001)(2906002)(6666004)(8676002)(8936002)(4326008)(31696002)(316002)(66476007)(66556008)(66946007)(110136005)(26005)(31686004)(36756003)(83380400001)(41300700001)(6512007)(6506007)(53546011)(38100700002)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGxDRnNpcE04ZXVwdG5pcTUvV3d2b2NySzNXSVpaN0QvbU96dm5MR0t3bzFS?=
 =?utf-8?B?N0o4WU9sMUVtamM4Rmp4ZUhVZ1E5QnRiclhMS1hudjd5NmpsV1lGdXpLMFhT?=
 =?utf-8?B?RVNtQkxHaW5rOHcvTVF2czNha0ZrR0RYQWo0cDM1YllpcGNKYUhrMHlXZVRq?=
 =?utf-8?B?K2Y1Qi9nc1FrTTA4VkJVMTZianJva3JhTTdjWTV6MEVSV0Y2TWhUeExDbmI1?=
 =?utf-8?B?V2V6aGxrZHh0R0I5OFdROUJOYUQzMEdyVkcwaVpmbk4xeDd5blFpeUx0SXJa?=
 =?utf-8?B?VFNiVFpkWXRzZmlvZjlPWWZzU2tvTlJ4d0JudGhSaTgwSXdYQnlJZitOdDZY?=
 =?utf-8?B?MHN1VnNhbVBOUGhkQW41U0dTOGFjTXhSdWJZaGxjYTdaQ3l2cERVUWZpSmFE?=
 =?utf-8?B?ams4aHJPVG03S3VpdjZhbFJEWGhxcllxZllSTDFURkNPbnUyc0dUYytHQ2VR?=
 =?utf-8?B?QUFYdEJKMGxmZ2pVMTFqT2lGeDMxazF4TWwxOWZseWRvUFYzOVBEZzFYS3g4?=
 =?utf-8?B?aG1Id1dsVlh6VXQrdktmS1N6MkF1SFkxS0ZwK3IrQitXOW55S2haZVh3ZCtI?=
 =?utf-8?B?c1ErT295bW5RR3FHN1JRNGRoZklMM2ZpTWFuTHFwR00vYlNjcGNVTkNFM0dx?=
 =?utf-8?B?MkFCRnB4YjQzU1ZaVVM2akFwaHRlVzBKUVVBTHE5dVlFWTF0QmpKaVFvMWhx?=
 =?utf-8?B?QThFRXhDVWlMNlVaSVZRaWdiQ3NpVHZZdndVZXY1NENTM3NXUHpBczB3Qm5N?=
 =?utf-8?B?Qy92VU5vbWlBRk9jNis2RkFycTBOb3JOQWhnM21Sc3NvcWRzN0pZcjFoTjJV?=
 =?utf-8?B?MkZCVXVCWjg2UTRDYWJUdW9tOTBGZlg3d1Z1K21uRzd2bTUwN2RqTWhidmRJ?=
 =?utf-8?B?Q0gwQ09NWG1SeG9HaWZPbjlJeDhYMlYwRkI2ZlAyMjNGQ2pJM1BQRS9ieHpr?=
 =?utf-8?B?QzdaNE5iS3pCSVhCdUJTdWtTOG5Zc2dVUktaYzMwdlYwMjFIUlFFVGlkZTMv?=
 =?utf-8?B?QVdkdllqYTRORXNoRE9jYTNyWjk1RzVTMVZ2ZU5hK0VIUmN6QTlXVUFkSm13?=
 =?utf-8?B?WHJMOXJrSVFqRXVUTXRrM29IVnd3cnh3VVNYSXhLbFZMVFZya3RqZEJzSmFu?=
 =?utf-8?B?bjNZajVGaWdwZ1ZKREQrUkt2QXhWUEZlditBdFdFU0ZlbjlPcXF2QnIvWk90?=
 =?utf-8?B?NSt6L3FTOWdaRTJvVkRVcFArTFVvbWZuU1JaNSsxbWdEVWFnUzFIRk1EcGtY?=
 =?utf-8?B?TGNVTDc0eGdZeU1pSkJMbE5uM0I5Qk56RWZVaTl2ZUtITEVwQmxnNGhqNUJE?=
 =?utf-8?B?UUY0ZGRRZzErZjBzMHBIcHlGVDVhSWdCbUxFTk1vb1VCbXg0VWZyakJZMTFS?=
 =?utf-8?B?Nll6Y3d0UDRILytMdElEYnBaMmFCY05zY0lwbWNDRC9rTWxPWVNLYmFsRXFI?=
 =?utf-8?B?dXc4REw1eWRMNjVLdGNPU2JqaDNqcklyZi9mdXFXVllrREdTU2xiaENPTTJw?=
 =?utf-8?B?emU5U0ZuSjFVdzUxR0d6YzRtdTZqTmZTM1VQTjdkaWhQMDIvWHRYcnEzSDIr?=
 =?utf-8?B?anVndzhBeThyZzFpY3huR1g2ZGw5U1lnNE5FMjlma1A5QldUMnd3U0lsckxW?=
 =?utf-8?B?S0RBc0ZyTlFGeVVkdGV2dVFvdTJEUzNFb3NNZkZNRUxUclM3NDRUNmxJeldO?=
 =?utf-8?B?Y3gwQ2xNSFVJd011NXozZXEydHBzU2RNQzFhbWJIVWQ1NU5mWGs3QmJESXdm?=
 =?utf-8?B?aDVKWnFvbjdDeThsc2J6eG1LYlREL0pJQVBza0NNK3JmWUs1RjVYUjMyRnNx?=
 =?utf-8?B?NzNsbnFEZ1RJTE51YkVzTjhWYW01dUkzRmtSTHBtWEEzT3ErRnFGVkMyOHpu?=
 =?utf-8?B?Rnc3eU9kZWx5YkVvTkg4S0tWc1lTYTM1K24zSThRclNydnFTcStqcFhBTmhm?=
 =?utf-8?B?R1B2UVJhazVFMk9aVm1FMXZJS0pMTkhXZnRCMGV2Qi9iT1VRaUdvN3QvNFpY?=
 =?utf-8?B?SkxoKzNtTFdDVyszbFk5b3hWd1FsWmZwM3BrcUZOTmNxWFhraFBkOG5BRmZ0?=
 =?utf-8?B?QkFmSVlzc0RoeW1GUVBrVFVYRDE3KytnRm9udGRjZEVnTGdBQUJoRnBmbTVa?=
 =?utf-8?Q?qyk4=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0886d0a-5fe3-4a19-6983-08dbe4194861
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 07:22:24.3940 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 31TnLx6yeMhxm+KmscF5iqd6UX2t9M/CsXkx2VJiYdJJJum6YMs1DPZFU0VtlqhO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6203
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
Cc: matthew.brost@intel.com, sarah.walker@imgtec.com,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, faith@gfxstrand.net,
 boris.brezillon@collabora.com, donald.robson@imgtec.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 10.11.23 um 17:57 schrieb Danilo Krummrich:
> On 11/10/23 09:50, Christian König wrote:
>> [SNIP]
>>>>
>>>>>
>>>>> Another issue Christian brought up is that something intended to 
>>>>> be embeddable (a base class) shouldn't really have its own 
>>>>> refcount. I think that's a valid point. If you at some point need 
>>>>> to derive from multiple such structs each having its own refcount, 
>>>>> things will start to get weird. One way to resolve that would be 
>>>>> to have the driver's subclass provide get() and put() ops, and 
>>>>> export a destructor for the base-class, rather than to have the 
>>>>> base-class provide the refcount and a destructor  ops.
>>>
>>> GPUVM simply follows the same pattern we have with drm_gem_objects. 
>>> And I think it makes
>>> sense. Why would we want to embed two struct drm_gpuvm in a single 
>>> driver structure?
>>
>> Because you need one drm_gpuvm structure for each application using 
>> the driver? Or am I missing something?
>
> Right, *one*, but not more than one. Wasn't that the concern? Maybe I 
> misunderstood something. :)

Well, there is the use case of native context with XEN/KVM. In that 
situation QEMU opens tons of driver file descriptors on behalves of the 
virtual environment clients.

In this use case you have many drm_gpuvm instances for a single 
application. So you can't assume that you only have one VM per PID/TGID 
or something like that.

AMD already made that mistake with KFD and I strongly suggest not to 
repeat it :)

Regards,
Christian.
