Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 937F074DBB3
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 18:56:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B20410E2A5;
	Mon, 10 Jul 2023 16:56:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2056.outbound.protection.outlook.com [40.107.93.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED0C910E2A5;
 Mon, 10 Jul 2023 16:56:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jxv3125hXVykZiK4AZxy895aEkNaGeMx4Q8sYsHMG8iJNv3Ck7jq3DZDkqMT1dcWS9ZqC4RDidSqyKVbgVNWSH5c5p36U7m2l1b24o6FBp9Hav6yeN2iFXHJfV/tEfbZGvqJAHBx7NFOsfrtDSn0E3IWPo/9s5btMkQg560rBv6ne9dw1tcQRww+GYt7C99KiOaFf3Yj/2ur+wvouCyG86gCIZPml/ugPaNIGlPvO1NgPsguyJv4wLKI9ESWZ/5dqB3w9YHoQJanvTdfd6TYqicqrhPC9UtmXF5aXfrMUh1gQh37DOaywIpctmV6ocm64OEZzx9Y1uvccm61Z9/biA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xdWUNVufsS7mVjxex+BAEG9lR3qCuhoBv0zOrJqe2UQ=;
 b=EtfqTOBKbztrio88bXhB8n28kaTz14ZSf45k4T7H4xkF6Zdj7g8s4nujMhfpTfAOkzOwGgwjN0VuoXay/4633p9twSCJTUqdDuzLqeCS7oMCMAUnCpw7Z2VVCoETUrZEs7DqWY8d+kSyyt8txpuUnwMOX4g/AdsZY1DhQ+EMwZHu9r21TCVa17wzEifYwY+sYrl+cUhzA9sh+BTCce3SQb9idVeWXeeZ35aS3/VPtt7dbJpAXTPOHJe4r2C86ksuIIiGlVnkJw/r9kP8dLPKWjh/exyPxtIriKxz2EMugfogk2Bzkf6r62zcHh6i2txFkUYuy7KXJEneuRWEY924cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xdWUNVufsS7mVjxex+BAEG9lR3qCuhoBv0zOrJqe2UQ=;
 b=pAWpUxYnBFHyr5XaYMPpeTthTyecHlFTzBhcs4KCZAm5VmHXgdVXC7CApHRzjHSs5EOQIQ8INPGJDiNe5HRvKrL9/oEKaAgPvY9jnMQz7OGMih4SnZ6Z5wD6ntpN7AVq2EFts/kzJ5bvCf69MLWNxmATjxxGhENIB5DAx51yXbE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH7PR12MB7428.namprd12.prod.outlook.com (2603:10b6:510:203::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 16:56:17 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::bce4:716a:8303:efcf]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::bce4:716a:8303:efcf%4]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 16:56:17 +0000
Message-ID: <a146abfa-fee9-a269-2aca-aeed922ea9b8@amd.com>
Date: Mon, 10 Jul 2023 11:56:13 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm/client: Send hotplug event after registering a client
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>, noralf@tronnes.org
References: <20230710091029.27503-1-tzimmermann@suse.de>
 <87edlghz5e.fsf@minerva.mail-host-address-is-not-set>
 <72ddab83-abec-b096-6c91-9cb2083c4c0a@suse.de>
Content-Language: en-US
From: "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <72ddab83-abec-b096-6c91-9cb2083c4c0a@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DS7PR03CA0222.namprd03.prod.outlook.com
 (2603:10b6:5:3ba::17) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|PH7PR12MB7428:EE_
X-MS-Office365-Filtering-Correlation-Id: fbd4dade-74d7-4898-0a09-08db816693c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JwVDFLznWP6mXXr84QeTOmFyCVo02pHsU+z3KBNvs9EXm8Zvb4P4QH2l6EeZqHC1zZoDoiKD5U+C4jDQopUU2bobf4efYkemL6STIvPd4TwRt9LtFHwZE3bYmM6encU2QHZfcOyUZfBdFRN50kE+PUx1ORLbyetm4JQX+vABknfaur6tE43gpPNaY7OVBzhsvpi80X714QkW++bc/hUitjAC2v5FiQN9NAv8OM8OKjK7rZS7GE4EFcb64ayEp+YxeKMfXhrkK2DeRjF8uUTPDVHvGrbHAIWfQoNrkm20JL4E686olnkx6AX0yivD6sxLlGVr/sHVnN6gG/dyD+SSGPq+V6zBUNehOSnzzvPj1XPaH0QujYDA8ZUSKOPL/oJcCpfESkGOn1qSc7oJnB9DNTFAXU3ztj1OCm1F0+YIujNkARIaoMpVRJuvWCZNhkwYB8fydjpZyfuFAl4CeTa+hAgbmuwg1C8gYopejc9gKZ2BBO0VtHA6VLfaxSvAlRKnJzJsQicMnVRNSQAMPn527FkGiGT78BdsuWU+cQ4sI8W0o2nZpxd2jvZXyj1la6gzIF0GwRiz3HXvzGb8MpHo7hQf9GFLVgxMAAeNPzsqP8wysyzlI/pKvg4hK95PGAsN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(396003)(366004)(39860400002)(376002)(136003)(451199021)(86362001)(31696002)(38100700002)(31686004)(36756003)(6666004)(6486002)(54906003)(110136005)(6506007)(53546011)(26005)(186003)(966005)(6512007)(2616005)(7416002)(5660300002)(2906002)(66556008)(316002)(478600001)(66946007)(8936002)(66476007)(8676002)(66574015)(83380400001)(4326008)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHZENi8vWFV6ZUxXcmttbTVXbHNhV1pUcGFFYVZadlJSbGtFeTJjdGZObTlN?=
 =?utf-8?B?L0pyV3M3S3A4Ti94SUZHdndQSlBWVml6Z2xmUUt3TTR0WlJsVy9iMEhUMFJl?=
 =?utf-8?B?Z3R4N2Y2bVJLblVhSUprckptaERPbmUvMjhLbzFkbm9EcVN4SnU5bXVzdkNB?=
 =?utf-8?B?MEl3aGNGMlk3dGVtak4vajZYeURqNDBuWFEySWQ4OG5kRy9oY0JIeTNTdTVI?=
 =?utf-8?B?dU9WU2VLelVFbDhDeElWQUs3dTZESFdjRVJVTFFxdlFpRlR0NHNTaTZ4ZVNP?=
 =?utf-8?B?YUd2Zm1hdi9ISml0VmlJMjA3V3gzYkltRmRvT2RNWGVqUEUvdlg2Y3JmbU0x?=
 =?utf-8?B?cURyQVBwKzhvek0vWWcvY2ZWQTRZSG5IY2ZhVDNZL3E2ZEJJSUhmNnRadXJ0?=
 =?utf-8?B?UVMvWTZ2Y2lMN241dVlEVmhsZ2FVODlGcUlKamhHV1ZuK29XYlc0TE5Wa2Ri?=
 =?utf-8?B?cTZpZ210L1NCZE84VHlUVUV3RGNhR21QUHgyVkp0Sis3aVpGNzJxcnNtVDFu?=
 =?utf-8?B?SDVuQWxYSFBwYU45ZWliZGE5OUd6QXJsVTVpRE9kakVJYUlreTJGTHA5Y1Nt?=
 =?utf-8?B?a1BTTzEzVGMvQnVRcE0xVXZoekFpVlFaTWhnaktqa28yZDlCVWxUZk4wOXho?=
 =?utf-8?B?MDF6eGNRVDhmQVB2S05JZzFQTHhRbk93V2ZMTll0eWVuS2tNK3czZDJMUUtl?=
 =?utf-8?B?WjM1UWZmUVkwNno5aCtWMk1aZmxmQU0xOWF4eUhvdXZEWVRqOUdFeDlubWlV?=
 =?utf-8?B?T0xJOCtIbEVHUTdrVVluTC96ZTVwOTFXRzMzVE1NdDhlaVpNWGV3OHZrNno0?=
 =?utf-8?B?WnE1Qm9ETmpUczk4aTNXYXNzcjhIOHlhSGk4L0doT08wamdHL09UWjNKYWxM?=
 =?utf-8?B?QXp2ZmsvMHNjQmQ2eEhaK0U3czkvOFU2bGdyanBxMDdiZys1T0Uza256Ykd0?=
 =?utf-8?B?YTJmYkdHck4vK3VXZkFvT1lmUWdzVlRuNXFnMWhpOGJEYy9oWHVqeUQ5aG1y?=
 =?utf-8?B?WjkyUVF0elh2Mmx2M1R3bXIrTEhFa2QrQVdoNmUyR29OYm45Vi9IejlnbzVL?=
 =?utf-8?B?b2NIQXl3SUZ4RUFQUG43U2lQUGptYnVmYVQ3aW9nZ3hqNGU0Y01TcktidCtP?=
 =?utf-8?B?cW5SWEFFR294cWoydkN5OFpodElvclNnUmUwQ2hLUWFlWFljZWsxdkN4ZWE3?=
 =?utf-8?B?R05GWmRaVW5WWkIwSi9ZbWJqMGpIWTFSeGxiS015NEtmaEJUcHJBbFBhQTQ2?=
 =?utf-8?B?U3g3VWh1Wk1EajB4d29mQ2ZQMk1veXFnYWFLbGJpZXpsbkZkUU5JcnZ6bDRx?=
 =?utf-8?B?amx5bVdtc293b1dSeUZpZ1diK1UyMEZFL3laNS84cTdLWHNCODV2K2NjVjNz?=
 =?utf-8?B?SlhiN21Hb1R0Nmt4c0JkZVlXYUdNcVdWUDlNSExscGgzYmRlenVUZ1dVQzZj?=
 =?utf-8?B?M1hlQ2J3NXN4UEhyWG1zTWs3cWxOWEFhWnAyWEJhWEtxQVQxSExYZkdka3NN?=
 =?utf-8?B?WnNLOGdqYzdNcFFPU3RYOTVFWXNNQUQ5Ym9DR2NmVjAzWTY2MERNb3pNKzB5?=
 =?utf-8?B?N1dNOUZSTVdlRWFZYWlIaDF4b2pBWXNBMEt6Y2tieVB1SFNxVm0reUMrcTNW?=
 =?utf-8?B?Y2d3SWk3TEl6TVpDcUg0cDYyeTNIL2Zlb21icFducW83b0VjbkxCcjdEa3kv?=
 =?utf-8?B?OUlLSDZ3NW52ODVSMnRwaGpGZ1ZWeGw2bW1YYlpGZnZUTzZldWhOR1NrYXN0?=
 =?utf-8?B?OFZhWk14d2V3ZzgwN3lnRldBUWVxelU5N0Z5Z25ETllFTEU0ODVRNDVOeTNJ?=
 =?utf-8?B?R01YL0pYbkhHdHRxU2tWVUtGTndsM0JQT0xVWmxpdk5RQnREZmU1YWRFNDc2?=
 =?utf-8?B?ditQSkZEa2lXNXMvU1JxVGFaNDJNNlFFaTFaWEQ0TXhHd0JKVlZkSVFaVlBs?=
 =?utf-8?B?ZjczYVR4clYzdW81K1kwVFdEUlpvWmtXUkQyMlRRckdBVkhycGVIdUlIWHVC?=
 =?utf-8?B?RUd0bHpoK3d2aE9GZ1U0R2tEQSsrMllJY3VBc0ZMT3BDempweU94WkZ0YzZ6?=
 =?utf-8?B?MDU4Z25iQTlMd3FwZk1Pei9aMnNPMy92dnV6SUh5T0h0cmRNcGEyZGF3UmM4?=
 =?utf-8?Q?ut2ZPSpP303mfjq1qAYs408ZL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbd4dade-74d7-4898-0a09-08db816693c3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 16:56:17.1185 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tPgmHlEXrQFuiDRDfWttjtjy7fVlZtu18WX7JXV/Z9xkhyURRR13MgZtEnackrds87krVShsu3hB/yxM/F3FnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7428
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
Cc: Linux kernel regressions list <regressions@lists.linux.dev>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-samsung-soc@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, amd-gfx@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Paul Schyska <pschyska@gmail.com>, Torsten Krah <krah.tm@gmail.com>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Maxime Ripard <mripard@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Moritz Duge <MoritzDuge@kolahilft.de>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+regressions
On 7/10/2023 04:58, Thomas Zimmermann wrote:
> Hi
> 
> Am 10.07.23 um 11:52 schrieb Javier Martinez Canillas:
>> Thomas Zimmermann <tzimmermann@suse.de> writes:
>>
>> Hello Thomas,
>>
>>> Generate a hotplug event after registering a client to allow the
>>> client to configure its display. Remove the hotplug calls from the
>>> existing clients for fbdev emulation. This change fixes a concurrency
>>> bug between registering a client and receiving events from the DRM
>>> core. The bug is present in the fbdev emulation of all drivers.
>>>
>>> The fbdev emulation currently generates a hotplug event before
>>> registering the client to the device. For each new output, the DRM
>>> core sends an additional hotplug event to each registered client.
>>>
>>> If the DRM core detects first output between sending the artificial
>>> hotplug and registering the device, the output's hotplug event gets
>>> lost. If this is the first output, the fbdev console display remains
>>> dark. This has been observed with amdgpu and fbdev-generic.
>>>
>>> Fix this by adding hotplug generation directly to the client's
>>> register helper drm_client_register(). Registering the client and
>>> receiving events are serialized by struct drm_device.clientlist_mutex.
>>> So an output is either configured by the initial hotplug event, or
>>> the client has already been registered.
>>>
>>> The bug was originally added in commit 6e3f17ee73f7 ("drm/fb-helper:
>>> generic: Call drm_client_add() after setup is done"), in which adding
>>> a client and receiving a hotplug event switched order. It was hidden,
>>> as most hardware and drivers have at least on static output configured.
>>> Other drivers didn't use the internal DRM client or still had struct
>>> drm_mode_config_funcs.output_poll_changed set. That callback handled
>>> hotplug events as well. After not setting the callback in amdgpu in
>>> commit 0e3172bac3f4 ("drm/amdgpu: Don't set struct
>>> drm_driver.output_poll_changed"), amdgpu did not show a framebuffer
>>> console if output events got lost. The bug got copy-pasted from
>>> fbdev-generic into the other fbdev emulation.
>>>
>>> Reported-by: Moritz Duge <MoritzDuge@kolahilft.de>
>>> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/2649
>>
>> Aren't you missing a Fixes: for 0e3172bac3f4 too? Since that's the commit
>> that unmasked the bug for amdgpu, IMO that is the most important to list.
> 
> Well, OK.
> 
>>
>>> Fixes: 6e3f17ee73f7 ("drm/fb-helper: generic: Call drm_client_add() 
>>> after setup is done")
>>> Fixes: 8ab59da26bc0 ("drm/fb-helper: Move generic fbdev emulation 
>>> into separate source file")
>>> Fixes: b79fe9abd58b ("drm/fbdev-dma: Implement fbdev emulation for 
>>> GEM DMA helpers")
>>> Fixes: 63c381552f69 ("drm/armada: Implement fbdev emulation as 
>>> in-kernel client")
>>> Fixes: 49953b70e7d3 ("drm/exynos: Implement fbdev emulation as 
>>> in-kernel client")
>>> Fixes: 8f1aaccb04b7 ("drm/gma500: Implement client-based fbdev 
>>> emulation")
>>> Fixes: 940b869c2f2f ("drm/msm: Implement fbdev emulation as in-kernel 
>>> client")
>>> Fixes: 9e69bcd88e45 ("drm/omapdrm: Implement fbdev emulation as 
>>> in-kernel client")
>>> Fixes: e317a69fe891 ("drm/radeon: Implement client-based fbdev 
>>> emulation")
>>> Fixes: 71ec16f45ef8 ("drm/tegra: Implement fbdev emulation as 
>>> in-kernel client")
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> Tested-by: Moritz Duge <MoritzDuge@kolahilft.de>
>>> Tested-by: Torsten Krah <krah.tm@gmail.com>
>>> Tested-by: Paul Schyska <pschyska@gmail.com>
>>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>>> Cc: David Airlie <airlied@gmail.com>
>>> Cc: Noralf Trønnes <noralf@tronnes.org>
>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>> Cc: Maxime Ripard <mripard@kernel.org>
>>> Cc: Javier Martinez Canillas <javierm@redhat.com>
>>> Cc: Russell King <linux@armlinux.org.uk>
>>> Cc: Inki Dae <inki.dae@samsung.com>
>>> Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
>>> Cc: Kyungmin Park <kyungmin.park@samsung.com>
>>> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
>>> Cc: Rob Clark <robdclark@gmail.com>
>>> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>> Cc: "Christian König" <christian.koenig@amd.com>
>>> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
>>> Cc: Thierry Reding <thierry.reding@gmail.com>
>>> Cc: Mikko Perttunen <mperttunen@nvidia.com>
>>> Cc: dri-devel@lists.freedesktop.org
>>> Cc: linux-kernel@vger.kernel.org
>>> Cc: linux-arm-kernel@lists.infradead.org
>>> Cc: linux-samsung-soc@vger.kernel.org
>>> Cc: linux-arm-msm@vger.kernel.org
>>> Cc: freedreno@lists.freedesktop.org
>>> Cc: amd-gfx@lists.freedesktop.org
>>> Cc: linux-tegra@vger.kernel.org
>>> Cc: dri-devel@lists.freedesktop.org
>>> Cc: <stable@vger.kernel.org> # v5.2+
>>
>> While it's true that the but was introduced by commit 6e3f17ee73f7 and 
>> that
>> landed in v5.2, I wonder if this patch could even be applied to such 
>> olders
>> Linux versions. Probably in practice it would be at most backported to
>> v6.2, which is the release that exposed the bug for the amdgpu driver.
> 
> No idea. The fix looks simple enough, but a lot has changed in the 
> surrounding code.
> 

Actually it needs to go to at least 6.1.y.

Moritz found it in 6.1.35 (not present in 6.1.34).


> Best regards
> Thomas
> 
>>
>> Your explanation makes sense to me and the patch looks good.
>>
>> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>>
> 

