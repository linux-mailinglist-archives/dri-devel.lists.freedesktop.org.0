Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBDC68C2C7
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 17:15:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FD3810E814;
	Mon,  6 Feb 2023 16:15:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2067.outbound.protection.outlook.com [40.107.220.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6084510E814;
 Mon,  6 Feb 2023 16:15:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lksoR2Z8QRKmeoAvHYHxfRAIObOfGOyxo8cK9oKdKew8w/solzspapbiaORmXPD3rG0XtSk0bkETcgjtIDBP+MQ7Zy8GmEIOgy+HTSiKz+8oqRkiRzbereejEDVUQIWAOb3Vz8Q8r0zqtboCRvJ54P9PCwdDh0f/zM/F4N0sm8ncxRRwGR94vAkHxpGL/yloYvRJYcKv2gBC6wFX94nYlfaSrJFlqkGp0ZB6mJjHdlRpjHREigVGX2D9989COLGOJa2c1G2CDEHDc2/S7PHJHdYFCVt7laopub+BCk7L46/0okV9qtatMRQrb6OlcnAYFJYjBJWsnvn88g3uag53rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ieKBmWLrrQzdTtcMGPgc2sBfRtpXnGnIHgrfCI5toi8=;
 b=aLN+p75XEXlH4B4MvGi3QJWuukAiEKM3XuDkB2hF9YE453wuD+qijyKgTbuWiX6YoPcohs4TOWgQFHXYfRU6oUMOiRKY9XE3Qp5cjQeogcGyqjm2B/Ek5NWbGM8TRX6PDThak1Jx6oxRBySyQGNqG3IEqjZ1hmIuGkFgJlNFCJoPVv5+qPAswrFjeUkFgZbMeHhxHH9Om6SWBd41opncPrw1e4c5qy0XYLNstSCfBXSt4Ij0blAyvfxRM8ZTibi76vGEI0Q696zyPp9Rr7lcEetkw3VjpHg3HKa7DosIjHdAZ/zP9DEKEKY/goINpQpIM6Q3byf7zhYBwV1P1fzkHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ieKBmWLrrQzdTtcMGPgc2sBfRtpXnGnIHgrfCI5toi8=;
 b=3I6M3fE4ZtaRriLndJ8aPJwYRFm4b5tEUQ81APJVLJOj/ggVC/c10RBynCnjR7TNDeAg7cgFT7kavEzBIGLLQ0KQRnVLfky/G3Ojw95LTiBLH5GgTHi9BBODj776sLNOHTOKo4lwAGl8Ftm7f1mB+aZaK5U7jFE4KEasJcVo/2Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SJ0PR12MB5408.namprd12.prod.outlook.com (2603:10b6:a03:305::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Mon, 6 Feb
 2023 16:15:01 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6064.032; Mon, 6 Feb 2023
 16:15:01 +0000
Message-ID: <c0635ff3-027f-bcd7-afbc-46f4e62d3651@amd.com>
Date: Mon, 6 Feb 2023 17:14:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [Nouveau] [PATCH drm-next 05/14] drm/nouveau: new VM_BIND uapi
 interfaces
Content-Language: en-US
To: Danilo Krummrich <dakr@redhat.com>, Dave Airlie <airlied@gmail.com>
References: <20230118061256.2689-1-dakr@redhat.com>
 <20230118061256.2689-6-dakr@redhat.com>
 <Y9MjSeMcsd18r9vM@DUT025-TGLU.fm.intel.com>
 <7c046ff9-728d-7634-9d77-8536308c7481@redhat.com>
 <c2256c7d-e768-ae3f-d465-b9f8080d111b@amd.com>
 <2427a918-5348-d1ef-ccae-a29c1ff33c83@redhat.com>
 <a214b28b-043c-a8bb-69da-b4d8216fce56@amd.com>
 <3a76bfa9-8ee5-a7d9-b9fb-a98181baec0b@redhat.com>
 <49ac3f95-6eda-9009-4b28-0167213301b2@amd.com>
 <bc523c5c-efe6-1a7f-b49a-e0867dc1413d@redhat.com>
 <15fb0179-c7c5-8a64-ed08-841189919f5e@redhat.com>
 <1840e9fb-fd1b-79b7-4238-54ae97333d0b@amd.com>
 <CAPM=9txON8VCb3H7vDY_DOgtUg2Ad3mBvYVxgSMyZ1noOu-rBQ@mail.gmail.com>
 <a1c526e0-0df7-12cb-c5a1-06e9cd0d876b@amd.com>
 <3f935a7e-fede-2bad-c029-4a3af850c9b5@redhat.com>
 <95d0631b-545c-ea4d-7439-75422e9a9120@amd.com>
 <67958920-c5bb-a0f5-2306-e3ae4fdbaeb3@redhat.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <67958920-c5bb-a0f5-2306-e3ae4fdbaeb3@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0029.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::22) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SJ0PR12MB5408:EE_
X-MS-Office365-Filtering-Correlation-Id: 545af347-bbb0-4c61-8112-08db085d4c8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4YgAr/WoUymFYgils929a4WuNmW+HdMTXALlGA9OldJO5cdWKEAXgTI8iw21fpGL6NpqA2YvSK/z2bNLgGjMow8ZaEXlexkr3dOfHn7ccMslRcf8InseVsEqlw2g84Fk7lJywdJvqjvsnVV9TKP9u3HvsIZ9fh/zrMKTQ5WZ/qbc5idwWGGBfMS0Mbuqt8EtLMnyXF6Wd7S7pySMz3TkWvLL2+I5C+LOdY9/yDbd9LkNwgolAYt6NoMRCy029Aemmc+bFqal7f/TbCzY3kwMiUHHu93t2QKBxXgpWEaC9zArBNkb5vKYJzbco8in8Lu3rxRpOIJ2NlnS2D6ypykRGYSkNpq1nc4PilvDtFxQ9LNDsKqN+PA58ha3P+jAx7cJaWPGu9NxerGJfR4reKR0jBi/eT3j2V+pN8AffMf7hCyBRoV2LYsSRmsppPibuwExtE9cm1iI9shxH6RHsPvQEUcW/1cam69DJyKZgigvCz/MxHgIL4P5PqfBicITD/LZwYa5Qqv3UAR0mo8zKvzJan/A2VpYpzUTNA17DWwHLRtXQMo2UCnMpnfC4FIyQuTgri9GhYTNj4CTnptU3ccr6+YtW+upJceFCBu9rOMIyI6g55i71F5caY+bE62S/47FPfdKDiMuDcGC/wkw+cfwmOUb3Bba/RbdFGr+ydSXS4np8tk5wPLZGlIHM+hbom4cz7opYGZoA6amw9Z9lmNn1mwsjoPEJTA2mm5udnfDwzQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(136003)(39860400002)(346002)(366004)(376002)(451199018)(36756003)(316002)(110136005)(6512007)(31696002)(86362001)(31686004)(186003)(6506007)(2906002)(66476007)(4744005)(66556008)(7416002)(4326008)(8936002)(8676002)(5660300002)(41300700001)(2616005)(6486002)(6666004)(478600001)(66946007)(38100700002)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFg0YzhwVSsvelErNXcwcmJ3L2xiTVZxeGlaTDN2a1huNHBwa0NHeXk2NWxk?=
 =?utf-8?B?bGIzaTNLb3BTaFpxeFBtTzFlbUpFMWRDZFJIbWtsTHF4bU1kSnhoSmxGK2NI?=
 =?utf-8?B?NnkreHFuVGdoeWQxUEhtaStiV1UrTmlQcndJOHU5SHNBb0t1TzZLQ0UxaC8z?=
 =?utf-8?B?bDU1NlpMTS9TakJlWWE4TCtFaXQ1a1NqZkdRWFd4R21SQ1NYdTFEc3UwR082?=
 =?utf-8?B?cU9seExYSHo1cE53RlFSa3k1L2NQRUJYdU9VcDNUKzB2SStwNDBQSWJKd0lP?=
 =?utf-8?B?Q09TemF0d3ZuSjZvYTNoRFJMZ0JGSHJrOVpPNEkvNk1YTDYwSi9UY3E5TXF3?=
 =?utf-8?B?T3ZuTWt0eDRIUWZLVmJaTEZsY0s0OGF1U1ZKbStybGdlR2tvZFREZkpKL3Rt?=
 =?utf-8?B?WGFweHAvTVM4MFJtUkYrMm0yU0pCNUVCRTF3UnhkLzJERlZvTFc2UDhBNCtZ?=
 =?utf-8?B?S2xrVEhPSHhaRHA0TVRQenhzbFdoS2JpTDhIakFBdUx4dzJra3dLYkJ5TGFL?=
 =?utf-8?B?Q0lPRHlzNHR5SW1ZN1RHWHFuSWlWc3BSWkpMQkJaR05SZnprVnVRakV1TXpD?=
 =?utf-8?B?VjN1YS9DdmpRaWh4TFUzeHdCOHA1cE5MODRFWTJqbXFCZmxFdksvNXZtSkRy?=
 =?utf-8?B?eEsvby9iaWVQVU9DSUJaeVZDV2pSRlg5RTRpZ3c0M0RGQ3BEaCsrQzgwcks1?=
 =?utf-8?B?bFhUNkhGekl0SUtSaFZMK0xXc3ZBLzkyMi9BbnQraHV4V2RZNG5OMjAyRDY3?=
 =?utf-8?B?amxiQS8rbTVYblYxcDBQQk1ucHJlcnIrYXUvYmM4V2w2eWhOVXZrcllrckFk?=
 =?utf-8?B?dW9aM08vRzdMSVo5K0loYnhxb2E3VXJhWHdDMGRML01MSmJaaHdPYXJuS0Ey?=
 =?utf-8?B?RnhreDhwdUV4cEZXM3NLU2J4dHhMS0l0VHdHREpONmdrMEx4ckRxeFl1c2Rl?=
 =?utf-8?B?T0x0NU1mNnVYZHpCdUZtbTFEbmhaam81dUh6OEMvdk1Yd1lPYWx6YS9JMXhk?=
 =?utf-8?B?NEVTY01tM1lIajNpWm9MOHlQWG9kRmJxSDcwMFNtZloyOGhkL2diOS9FTEc0?=
 =?utf-8?B?NHJ3eldBMU56eGE2Ujc0NzJsZGtLQkNQK3ArdS9HMzV3WHBFYngrcW1mRTZj?=
 =?utf-8?B?amJCMXRzSFhIYVAvVnZqdTB5ajJjZTVuY3JNVjY5T3kzU2NXRkp0THExamFx?=
 =?utf-8?B?eERuQWVrTjlBRWFmdWV1bnBJd0ZGbThCdGVKSTFqcnUrc1JoNUo4QVp5cmZ1?=
 =?utf-8?B?QkpINmdmRnVpNzd1eU01UlI0WlFnS0VHOUo0OStVVm9aQ3VRdUYzUlRQMU01?=
 =?utf-8?B?RXQzNFNyRTY1OW5kUjYvazhkUDVqTmJPaXNuRnNGTkRkZ0ZGbm5zUWFZeGNk?=
 =?utf-8?B?K3lkOHRiOU5zcjNBakVYUFVOMHpQWkJzTkx3OWVWMVlMRzhpRDdDNStqN0gr?=
 =?utf-8?B?TURSV0JWQTJ1MGxPdGdwMlgxWWM2bjFYUHYrWjFrZGpKZmIxR21xN3VGL3pl?=
 =?utf-8?B?QWp0RmdLVXdQQkxYN0JUSFovS2tBVXkydHVTcFpCejNLdGsvSHM1WDZvZEdi?=
 =?utf-8?B?bms4OGIxRWRxdnFyYmwxUGpVYVVDWWt3dnB0aEJ5UFp1UTdPaS9vTzFQa3BT?=
 =?utf-8?B?M1AwbGJ1UU9mQ1JnTmRWWjJ4SWdWNjU4blF1cDdYdms0RXY2WnFYYzBVczFE?=
 =?utf-8?B?dnYvZFhKQmFFUWlETzNCb3FjZng3Nk1vbmRGbmlVb1Vka3Z4Y1FyL213YUJi?=
 =?utf-8?B?ZnZDVzd3akZFbmU5WEtpRGRJcldhdGxPZTl5Q1JKTytPZUY2T0VpZ1dBdE9W?=
 =?utf-8?B?SWN3a1doSkp4TUZpY0lQNGhpTVdzcEh2alYxMTFFWEJQQ0FPSFByUVFCMXl1?=
 =?utf-8?B?dkRjZ0RoaFdLNXRha3M4Y1ZWemZPejB6eEtjWGxjbWJVLzJFYVM3WHBjdGd1?=
 =?utf-8?B?M2NvcHRMdnV2b2tiMm9abi9GY3ZQSm5tZzVGZzFIY1l2RHY4TkpCbnR5dWcx?=
 =?utf-8?B?U01WTmVkeERoNSsyVitoOHRSSytaN2M0WXgvbEM4Y2JJdzNhYXQvT25mS1pB?=
 =?utf-8?B?T0hyTndnSXFnU09nYmtJVk8vM2kreUlmZVh1dHJ3ajR5cEQ1dlBVbFRRaGkv?=
 =?utf-8?B?NUJORmVsNXVIVGp2TFJWMnFwU3JyQVBrN2NSTnB5dncrMXdFbk1XRDEwdnFH?=
 =?utf-8?Q?bsYD+PPXmVE8TSZHBSDzA0lPKG3U9hn117cjOQweEgtt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 545af347-bbb0-4c61-8112-08db085d4c8a
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 16:15:01.5464 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ny9pO6KBM6hIhN8Oizxqr9RFBcVpgfCL6PbOuG/tYj2OUdvU0Uygdf10N4UZaRzZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5408
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
Cc: Matthew Brost <matthew.brost@intel.com>, jason@jlekstrand.net,
 linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org, corbet@lwn.net,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, bskeggs@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Concentrating this discussion on a very big misunderstanding first.

Am 06.02.23 um 14:27 schrieb Danilo Krummrich:
> [SNIP]
> My understanding is that userspace is fully responsible on the parts 
> of the GPU VA space it owns. This means that userspace needs to take 
> care to *not* ask the kernel to modify mappings that are in use currently.

This is a completely wrong assumption! Take a look at what games like 
Forza Horizzon are doing.

Basically that game allocates a very big sparse area and fills it with 
pages from BOs while shaders are accessing it. And yes, as far as I know 
this is completely valid behavior.

So you need to be able to handle this case anyway and the approach with 
the regions won't help you at all preventing that.

Regards,
Christian.

