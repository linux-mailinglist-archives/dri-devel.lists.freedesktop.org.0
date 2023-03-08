Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6008B6B10CC
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 19:13:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6932910E6DD;
	Wed,  8 Mar 2023 18:13:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2075.outbound.protection.outlook.com [40.107.220.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C10E10E6DD
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 18:13:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cgvMamY4HYU5bYuiLJUiILvNnOtmZo3BBnjhFnM52C/f2g6gkbJh3l1ozNWl6sGOuab12F9f4q7pq/ie2u0BCdUruARlNqia2EL5twsmcbvQAsn6KuO7iBAXtaQUFLt3bmtRoFV+o7RBpamiZe31cac7F+5nrsZYYEcsc0XMj4aqYmaUnMgVSPEahSlEefEPPoW87m5g6bpAPa14JBhgiktC/Yg9b8MdYzNvEWW3eMgE9DCMcd/NzHPk+ANb603rriefyDBEIOivVwWMtlcnZG+/IhGkRP9s66KfEbQoiTOI98WL18HOEfU6vpnse9pN3fKad/Cvk2Kr+QH7RSBH5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8D8gQ3FtSSFF/DlEiI7Ra3uTUF717Zg186Kl28j7vrQ=;
 b=j+SQUvq9Bxh6MIKnNi6uhAER1c3kIJOjrakhqnm8x95OCFQUgJaAjU+lgiSvFS4bHvS7wtW4kU9NZhURCzyC+6O+xQ4xR7WyyuKen3l6FNixXcHVSZ8N4L3XUvILGOUxFIkGDJJsELSawaCYJCg/xd2Aoci5pZ9Ve9YGBz5k4a6OaT+wWdROMsTQl8LMpUdbWeJOPqwdteBy4P3wQkNZfHD0BTJf+E6kVAnJZh07KVbJIkiia1rIv+K7t50G/5+CWJbjXMjHPlyiFELoIjOrut/GcEJwUW4oZ6fD6CyrjoRyB++a3LGgoMCjWj/gQJ7NOABXwGoki0i0sTbn1X07iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8D8gQ3FtSSFF/DlEiI7Ra3uTUF717Zg186Kl28j7vrQ=;
 b=yVbqmVltvjB7cmXrgCun8m99jMryJd2g8YbA+XpA0oUiM4sE7szsjkj4CQoH4e9l9YiWPhMWUNJHY6HPUQRrNUUlIXkiZCUfS6/PaCVLIPpAkleclSLIwqO/aSWMwZJVHyy7PTZ2/Pnef6OZEFtOj5Bhj8dS6xX3oUGuBmnzPQI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BL1PR12MB5030.namprd12.prod.outlook.com (2603:10b6:208:313::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.17; Wed, 8 Mar
 2023 18:13:21 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918%4]) with mapi id 15.20.6178.017; Wed, 8 Mar 2023
 18:13:21 +0000
Message-ID: <bcdc7432-5a1f-fed2-1512-a3759fee94dd@amd.com>
Date: Wed, 8 Mar 2023 19:13:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH RFC 11/18] drm/scheduler: Clean up jobs when the scheduler
 is torn down
Content-Language: en-US
To: alyssa@rosenzweig.io, Asahi Lina <lina@asahilina.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=c3=b6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Luben Tuikov <luben.tuikov@amd.com>,
 Jarkko Sakkinen <jarkko@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>
References: <0f14c1ae-0c39-106c-9563-7c1c672154c0@asahilina.net>
 <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
 <20230307-rust-drm-v1-11-917ff5bc80a8@asahilina.net>
 <bbd7c5ee-c2f0-3e19-757d-a9aff1a26d3d@linux.intel.com>
 <585fa052-4eff-940e-b307-2415c315686a@amd.com>
 <3320e497-09c0-6eb6-84c5-bab2e63f28ec@asahilina.net>
 <7b39ef96-3ec5-c492-6e1b-bf065b7c90a2@amd.com>
 <8e93126cfaf47ebad0dc70e038ccc92f@rosenzweig.io>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <8e93126cfaf47ebad0dc70e038ccc92f@rosenzweig.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0188.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::20) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|BL1PR12MB5030:EE_
X-MS-Office365-Filtering-Correlation-Id: ba2fe3e4-7382-4676-b44b-08db2000cce3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vgxfjgD6e/1yIj8lYwunnNY4XcUcCPphj7nFEFRog/IvYqNQo3x7rqws3bOlW6mwkeYTTyDcaLbBwydPGj3XSWo9MelU0Rlu6ZmCSkebzdgqo2vNvyrpP5Kut0A7fXtN9tw8ByLLuFbKf0h41Huh0P1wb7vpEwzgfJ0aR9Ivw6ovxZyLzNBpExnt8uEVX5AdEcFBnpLQ8qV7H/npWT1rpoQGKPBuS02Tp+tz5kkkzlF5O960XDOM5uJAmRV3nXYjlG5l+xDu8VuSK+5PxQn1kCHx4qiNQ0nBvR1wb3othGEZ9WATdYA6VeOMnjv2ZzdqxNW9JG5KBbjruKx8o4MnSeklbGehRQ5IIwnhrEqtFSCKWjT80KZKbhizDWtXa37z4VRhUI0YdzMBIoPJtMaBhhgntL/7y/9XSGNUONunB2+ksBtZiXWyt/H3MWFtwbka1ie41FfUh+KXGUzaI20Ww6RiDCxYA27N4Ugeyl8+lC+zVRDyaznb4okluMozpTM8RbvYarkTQACdYeP4eHzxFd2FplMifyVKZgRg8pnNs10Qdun4hoGIxLP7G2tHiINtmnnfvRc718gTt25w6YPv43yymxkSgWJ3fuU0QwymPcn3wl0Y8MH/i0c4ZCB8VRpGhGMdhOBE25npx/hh1+wBWzXTJocYkHhlG1BAWXk+ZdSOY5E+Hkdb0swApTW3ZkOy9mHRkMWSnxgLMu2cU2oIlH3BRg9Sqacd1LScYwO9aGQ6d8KbeIC8pkfYOPobGgb+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(366004)(396003)(376002)(39860400002)(346002)(451199018)(38100700002)(478600001)(31686004)(36756003)(54906003)(316002)(2906002)(186003)(110136005)(921005)(2616005)(6512007)(6506007)(4744005)(8936002)(5660300002)(66946007)(66556008)(66476007)(8676002)(4326008)(6666004)(7416002)(6486002)(86362001)(41300700001)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0h0MFVTczFwd1B1aWRkUko1OFNLMXo2dGw2UW8xL1o1L29UaWc3STF2VVVS?=
 =?utf-8?B?VWlvWGpaN3VvT0hsaDJUa1NUMEFjZUVWYmFyZTgrVGs1a3JqK25Gc3k5c0c0?=
 =?utf-8?B?LzFacXFVZzFmU0YxZDRHOHduRkZDNnVadTNHbzhCWDFSWHZ3S0FoY1Z1TC9H?=
 =?utf-8?B?SkRPRDA5eDU3VkYzSDFCWWI4Q3NzTXVVRTBoTE9xVEdJUExna3lVTHplWmZs?=
 =?utf-8?B?UThlaGdneUY3UWlPRVZIN0x1TVRUTXZQd1VjRTJ0bjdPdGt3cHJTVmhxc1dZ?=
 =?utf-8?B?NnZBNFNsYTVENDZXUlRPalhRTlZtQ3Zac3k3RUQybUZtbFZhaDNkR1prS3dO?=
 =?utf-8?B?MWtwYjJETnBaZTUzbFpXbE1YRGluYWdoemQ3RElVc1pveEZZNUl4ZTNOQkV6?=
 =?utf-8?B?TG9ib3h0Y3JDWm1zcyt5bHRvQ3ZoWWdEaEpyMFp3cjJBNVE4VjBFaGZ2dUpH?=
 =?utf-8?B?Wm1WQ0FzLzMwS3A4UENKL1N6TVdTYkJGb1M3R1d1c1dLSjZWMW9QVXg3VmJQ?=
 =?utf-8?B?eTVTZ2dwaU1iMzFDaC9PTzJmNWRnMitkTkg2R0I2ZVUzeEMxZGg4dTlkWHdq?=
 =?utf-8?B?aUZ2NXNCKzU3dlhjQy9DRmJmR1dHNUZYZHBIRUgzY1k2S2JOMTNMai9lRVo5?=
 =?utf-8?B?T0VsSkttNTFPMU1HODZFOTc5WDZUVlc5QitmaEtHbkhMV0ZUck5LUHNEL0Uy?=
 =?utf-8?B?VjZnZXFtck1HanhrR2lTSDdra05RTkdBd2RBZ0d4NWJwQWtKUnIrakxBM0NH?=
 =?utf-8?B?VStrMUptd1hRVXUyS2V2T3ZYeGhJaGEyMVlBTHlyK1JrMlkxM0dRelR1T2ti?=
 =?utf-8?B?c3ZqVi9yWTJ3bFk2Zk0vNW9PaTJwRkF2OFhBb2VLZHBmaGxhMG5aQzRKWkVN?=
 =?utf-8?B?UjU3NUJ2cS9ISTFlbEN2QVNhV2ZYWHRVSXZZTkxrdVpxL1hMK2tsUEZhQktE?=
 =?utf-8?B?dHJmLzRRTS9KTk9wUklKNGpnd3QyUVIvN0UvY1VHdU03RTF1QVBxOXlHODBt?=
 =?utf-8?B?bjRJRjd0SVhOcklsV21LTGRBS05ZTzVwRDBnM0JEalpEV2Vpdk9Yd3ljdmsw?=
 =?utf-8?B?NFVGY0pMdlJCbFVnVFN6SlVWRkRzL0RSYlZMTnc4aU16M0oyUVhveENTcmls?=
 =?utf-8?B?WUhoWTdYTFlMTlJKN3JrUlM4QzNzeEdxRFBlMXpTQW1LNHhuRXlqN0RDOE5a?=
 =?utf-8?B?TkFYNEF2YTJBQ2xtV3FhcUxBa1VNMG5uTi9GVThBajJyTGFqbk9ldlY3NGlo?=
 =?utf-8?B?ditFL25QRElHSG9MU0J0VldJd0V4dnRsZUxkcnRYUHpFZ2FtbGRWdld6RkNU?=
 =?utf-8?B?bjlPVkZDSHlrN0Q4a3ZmTE44dEFlZ2lnMFpLUXkzbWNHRmFGbzM1Nms4emFB?=
 =?utf-8?B?S0YwVFlaK2FWQng5aytqTEp6QmJIdmdteVBlei82aXRUeXE4bXBXU0VMWXZ5?=
 =?utf-8?B?QkRJM2FzZmZ3Q1hXTUxlYWkzRTFhSjVrcWZKY1FENU5YQlo4RXEvQW5wS1NC?=
 =?utf-8?B?OXZzYm9kMDVHTXo5RE5vVEp1dllZVlg1UExnNWNZUEg3WE9PQVFOUS9RNkxh?=
 =?utf-8?B?N3VRb0dmWTdrUWRaOFhVdjBobENSV0JaK09lTUg2aEdSRjBIR0UrSjBpR3dn?=
 =?utf-8?B?ZmNNU0d5R2h1N1FOTUJOVitNSWRlOGkyUnJjSUMyTFFVQTlHWFBTZUI3aC8z?=
 =?utf-8?B?VWIvSXJmRTNQTzdOZE9rQ0FXZDRjZlRuMHBkTEZoNjhGakJJeGcvbnZ6UDI5?=
 =?utf-8?B?Q0N6UjdoU29EUDQ1Q3VHL2RYQWpBdE1SWnJtSjJyYW1MNlhkZ1JlUEY5RkR1?=
 =?utf-8?B?OUNBSUh2YXJTR3JUV3ZObjJsSTQybk1PTEI2c2xVdmgzdHlRTU1ndUg0RkFG?=
 =?utf-8?B?cmlVZzJmcElPZ3BldkJCc2RvSUQyd1kyRElJVXBJWm9XRzBFLzNtTDg0d3J6?=
 =?utf-8?B?QkI4MVF0c0xnN292RFlGU24xcnFxeGp1NWhRdlkvcHR1cGNBTHhKV1pYZWtt?=
 =?utf-8?B?eXU1SDVmeG54Z3pSWWNrVnBLTHpFK3dOQ21yVEYvazZWbDNiOUgxc2Q0SlBS?=
 =?utf-8?B?eUNWYlp3RU5RRHhlZ3JuejZoSWc1a1ozNE0vbnlOdHZjcTIxd2tvV08yOXN2?=
 =?utf-8?B?Z1lTM2VJK3hIMFNWZml1bVJpQnEyOERSNHczMTBlOHB2NGNKUmxiWUp3RW8r?=
 =?utf-8?Q?sUSmFGhQrLFg9dSFMQp4EIIpypTjlwa6IRZHPGhhGXLL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba2fe3e4-7382-4676-b44b-08db2000cce3
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 18:13:21.5276 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aY9W7E1kf0NJRrBeUwNlVFvNAt4jWn4Qy/fyJqxtBqHAoHAe5U0owR7WC3ep2BO/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5030
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
Cc: linaro-mm-sig@lists.linaro.org, rust-for-linux@vger.kernel.org,
 Karol Herbst <kherbst@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mary <mary@mary.zone>, asahi@lists.linux.dev,
 linux-sgx@vger.kernel.org, Ella Stanforth <ella@iglunix.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 08.03.23 um 18:39 schrieb alyssa@rosenzweig.io:
>> You can't ask me for a list
>> of pending jobs (the scheduler knows this, it doesn't make any sense to
>> duplicate that outside)
> Silly question: could you add a new exported function to drm_sched to get the list of pending jobs, to be used by the Rust abstraction internally? IDK if that makes any sense.

I was thinking about something similar as well. The problem is that you 
could only use this function from the scheduler thread itself, e.g. from 
one of its callback functions.

Christian.
