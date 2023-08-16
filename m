Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF1A77E6FA
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 18:53:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53AE610E392;
	Wed, 16 Aug 2023 16:53:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2049.outbound.protection.outlook.com [40.107.94.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32C7C10E38F
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 16:53:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e8qMEV8yOxKHCWqKglX/G13KGjDYo4AyEWVXWKJz2GNlWj6DBa2Ae6MUxhylZcfsFoINKD60CA8uRCZ1Rho6B2e/txIANOG2GTZBRHgSPVl/JroDqD9aT2+k0DFAQnYGKw/aMeZxqz2dp3jjVlN2IWUuIGbXCSARmB1hTSEbxxzizSL+TQZKYkWVOlnMJFVT/qX739OBucLYCceYg7ptqwwwVlEZ4T8pojQJmCWIDv5NEDwsezR/8i/AXnmJGPsk90KPdRVif7BWL4IZ3HhE2+stBqaGZAhL7LYX4wKyvL+RdUiIhy1O94HBY70OV1w0PEtEtboK9ajvwU56ikhGug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dlGfzpiBk0gUQZx0oX32lw6ITLrbBg9RzPs0JgA7gxc=;
 b=TrS/gxtWXSr9kIijb/U/5DOB1mhpazqVvBjdfCyagbtoJeSkB5oSKyt6QPQb+Dpg/t+DmJw1UkgOhPDaaDG6fy8dInp07Odgw+HCJWQzpBqbf2vcBVFXrbpOHMJaQznPfLvS7DwmQxnfuFe5qtR+77qmzvZPWTVIAgJLQ74UCG8RoeMS1Gv/6vrv0t3OpXk1H8z9a6mS1z6nUXgReZzJQv3Eq1S8yv3ZajAVT3Euwti/uo5z6q85xMbIdkYoUKv0ZCWOyR3PXQzmdYEj7hFK1BfIx3aEsO2jpNuKbNsti/qaGz+/qK0KSkZF/Vg2n8ZXK/K9hTeBsMhqMsDML56K6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dlGfzpiBk0gUQZx0oX32lw6ITLrbBg9RzPs0JgA7gxc=;
 b=l9ioCqnRqsDy2ohgpRcMC2eu1fpBU+WmlqUwHxGolnU2KvtlAynMZH09yq1zEH2/zn9/3cB+MrwVoazYcIOmAhttiS84IXWlE26KYIclDTQM++0ero97H8EQKi3nK7IXx+uCcQN3PogY/l/2vLVcK8IKvbjh+4DUlJ6rPbzyfkTE+jiAk7mj25ztfjHhXNf8GtaZCaPdWGmuRagpymfIj2BC114p2RgCaMcuffFrUa4VPw87MFv8Qruj/FHj4c9nLDy8Mol2vRcecSqowigTQBk85+F4hengQgysb0O6zHKVBWOaUhjys7jH8PQPFwGz5wl0PfJjWDx8Ft+ESGFw9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH0PR12MB5122.namprd12.prod.outlook.com (2603:10b6:610:bd::12)
 by BL1PR12MB5237.namprd12.prod.outlook.com (2603:10b6:208:30b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.30; Wed, 16 Aug
 2023 16:53:45 +0000
Received: from CH0PR12MB5122.namprd12.prod.outlook.com
 ([fe80::c858:af19:997:b12a]) by CH0PR12MB5122.namprd12.prod.outlook.com
 ([fe80::c858:af19:997:b12a%3]) with mapi id 15.20.6678.029; Wed, 16 Aug 2023
 16:53:45 +0000
Message-ID: <87412161-6c77-ceb3-9f1a-8c9594709869@nvidia.com>
Date: Wed, 16 Aug 2023 09:53:42 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/syncobj: fix DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE
Content-Language: en-US
To: Simon Ser <contact@emersion.fr>
References: <1fac96f1-2f3f-f9f9-4eb0-340f27a8f6c0@nvidia.com>
 <XMsmays-xGmL68CFTjnEY24F0jiSpQld5_ErWb02c6_LToDRM4sGOs2vlsjGbgphvtFRVYSRCqqrg77ya2XUMkxerGOOM8YFBUWjq5C0oUo=@emersion.fr>
From: Erik Kurzinger <ekurzinger@nvidia.com>
In-Reply-To: <XMsmays-xGmL68CFTjnEY24F0jiSpQld5_ErWb02c6_LToDRM4sGOs2vlsjGbgphvtFRVYSRCqqrg77ya2XUMkxerGOOM8YFBUWjq5C0oUo=@emersion.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR01CA0023.prod.exchangelabs.com (2603:10b6:a02:80::36)
 To CH0PR12MB5122.namprd12.prod.outlook.com
 (2603:10b6:610:bd::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR12MB5122:EE_|BL1PR12MB5237:EE_
X-MS-Office365-Filtering-Correlation-Id: eba226f6-8db6-4c50-5214-08db9e795a6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tH0FlqMn45HsiiSR4ZGiKF4NsHMoR0j4mQEYpeeFLBH+DmACocatsAQElvt1IGktTpJB3b76d7tYtABQUMYf8Oi8yTIkkGmqM4sXoAxXSpuJGmWOnnpT+46sqs2KmwHS0EfhRDebwXoGh+pxKogVz4Zc/o0l3QEc6MtB+le9dclTCOL5XFFrtzBzf7JR6ybWvYI3hxyFWCka0oAhWaJGZQfq9BG5Z0dnr2Fgna/1GXA/0JJVyOa5FgvPu1oTRRhYue1yjlKW7jusnqoj6sTMBJEaNWU1ZKPCiQBO1rs/cj68bzo3GNKRn9UNF7BMsDZAmq6xtz/dmUftrRje6DzivBtgL08D/d1sKR1BtGa026Q2+XrJWiWe7R9TULy8DIUXKYGNMBwPqw/3QkJ5PO90UikpRyqTS7UC6mR/wv89UINLBa9qDgb+rPID+qfqMQlUVni3WA+M4boUoqw8XryDoiMXnd7fUpw3Szhtm5n9Bg80nH81dQWxsplG8WKXXaQ20eA+39Mm+/m9Go5B83uLCmnOD32q/OX9xU/l7K0YZjqhUGbYOxtIqBGGKIH+vzjLrNsfg6UBA2y2AVxWZ/8FamlRNfhGwVYoMK0Y7RycyC21CDe7gsY1bdHo3TppQ6YXYYfvhhaZZZSXLs3VOPLGgfpJefJxLtUt1IN6OVI1YjcxJfj2zADC0wNOjXNsVeSA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5122.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(346002)(366004)(376002)(136003)(1800799009)(451199024)(186009)(316002)(6916009)(66946007)(66476007)(66556008)(966005)(41300700001)(5660300002)(38100700002)(31686004)(8676002)(4326008)(8936002)(2906002)(4744005)(26005)(478600001)(86362001)(31696002)(6512007)(53546011)(6506007)(36756003)(6666004)(2616005)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2pmTW1qQk5DQVBjSDZ1cjN4dkxsZUZ3YllibEVPWnNOb1hWZ1FNL0xqaEs1?=
 =?utf-8?B?L0NvdmlwNVRIRDJQWkFEZytWeHhlS3I0RzZlbWpnQ2JqZHJCYVMyWnpRYjAw?=
 =?utf-8?B?bnMzUVpHekVVd2NzT3l5cmxDY0R0bE1iTUlKOTlQQVpOa1RyNHFDaUNlZDVW?=
 =?utf-8?B?WThMUGpra25BczFzS0lTWVh1WVphQXNmaHBDVjNINnpJLytXQXVCRkZ4QjNK?=
 =?utf-8?B?b1I1VGs4bXVVSDY4RUFQM0NzUllCdkljZnBRM2lUKzdPa2hzaURKVWxHVlA3?=
 =?utf-8?B?RmZiVXJnbGxzYkFlTTlyUUpudE94WFRyRWtJS3g4L2VsVXJNMkV6ZXlFUjdO?=
 =?utf-8?B?dll2N0h0TDFVajlKUGQwREVPUXdEdW83T2x4TmdlOG9TcVQ4Um9ZT29DN3Fv?=
 =?utf-8?B?eElqNWx1U3hWb0xyWFI0UlVxeVVCWmc1QW5kbDl3U0R3QVJxU1BQdDJJT3dp?=
 =?utf-8?B?OEVVaW9JYk5kY2h6VCs1NHJQU2paM2dYNGVPMEJoaStEMVArdThnem1xNlk5?=
 =?utf-8?B?YzhxbW5ud084SHk4Q2Q0c3RDZE5xNGZ2QnNwc0VJa0RrZmhKR1RBV2t0VHNZ?=
 =?utf-8?B?b1ZGUnpDa1BjdFRIUVhLTlg2Z0puSk1LcnRNdlFPRjVuSDNhNWRFUFNmeWNJ?=
 =?utf-8?B?MGFndTBKdU9SV3ZNcmV3emNqYUxsUXFPS1B3bTlid2hYeFVsT3NCTE5aWVB6?=
 =?utf-8?B?TkpkcEp6WGpKbkg3TXRzNUd3WGMya1M5emhDZVJNTXBtZnhtV0N2R0xjUGxG?=
 =?utf-8?B?dWxiNUdvRUZnaVVtT05HUWVtYWtZMjdlbk4vbkFUQUpBVllsZEtrZFB6dTlu?=
 =?utf-8?B?dGFUa3lIblIzWm1YSk1IVkpKNFBrcTkzN05PUmlJaVFIbWlISmtyYThSZjNt?=
 =?utf-8?B?T1lHYnhJRmZOcXFaSVR3UHZ6YmlkanFVOHVtS3U2VlEwdGdPOEQvdGNjUEl4?=
 =?utf-8?B?eTlQTUpsMloyaURmV05NbThaRjdURDhGY01WenMwMDR2VUNOcUpFbG5kZ3ky?=
 =?utf-8?B?NlV0RkJKMjlSZnJsbE16aWU3c2t0VG9JUkpSUXpjRkpDODNLV3NNN2h3VWVK?=
 =?utf-8?B?RjV0ZEVxS3RJMEpKYlEwTUc4T3luc1FmVXlzRlVLMTZVZEZEZjBFN3VKOFhx?=
 =?utf-8?B?Y3M3OFUvZnlUcXBRY1JFWm8vaCtTRU5XNTBHY29nQzNLVEM0SGlGMGh4b0pr?=
 =?utf-8?B?Y3pJMUgvNU1zRStNTlBIc3lmSGxnRGZmMVpuaStsQXBkWnZhRnhHa2svNm50?=
 =?utf-8?B?REhzZjBoWExLVysvUnFWUFIzcUR3VmM0QVBnekhHZUt5cFVWR2hhWGhRYnlY?=
 =?utf-8?B?aGZQR2hFdlJNMHJQNjVabGdMUVlqM1B2Q05Fc2RFTDRrZEVwZVpKOE42dWVN?=
 =?utf-8?B?dm1PakFEVHFsYktWMlJjZXVqQ0ZwZC8zSlJmUytJa2kyMVJwTFNra2g3OGlj?=
 =?utf-8?B?a0hNbjJoalk4UHRMd3lCL2JHajIzdVROQXpwLzZyVFhHN3l5elErWVI1SWI1?=
 =?utf-8?B?Q3pCY0xIYy9xbitFeDdUcEJCb2FpTjBNbHVNWmJUbmZUS3RNTG85MVpFblBJ?=
 =?utf-8?B?UEdmVEZuZW44Zk9Ed3Fna0xGT2poNmkyMUFyT29WYWgzK3g2UndlRzVvMEtM?=
 =?utf-8?B?MUlFU2FWbVM0YmNkSmQ3NU9LUmJaVStOSjgvNEs5REIvMThSSTFLNWhweWFR?=
 =?utf-8?B?VVJVMlJSd3A2cXRHZEsxMVJPQVlQR3RLRklmVFMvYnFITUlMREg3djVDRmNM?=
 =?utf-8?B?MkE1S3M1Vno0U24xNHozbU1QQ25jOWdydEdpVWpJdWcyc3VGckNzREVhVVpM?=
 =?utf-8?B?U0orYXlHdDVESmV1WldvRXhVLzJUbFVJWlBJYWxISzNNcTdxNmZZNTd3cUZS?=
 =?utf-8?B?QnJzS2daYkRHT3NHWlkyOTlNSEUrUzByN2wvSFk0Zkxsd00zK1Q0cVI4SmIz?=
 =?utf-8?B?d1F4TFlhRXAzdGZsTVF1ZWgxYUplRGFGaFNWdlRmbE9EdjZqUlZ5UVBQQkE2?=
 =?utf-8?B?SVpuTUR5Q3kvVDdZdDcyZm1sZ3RMdlVSZ1FrZ21QZVFHbFNxUWVUY1I3ZGFM?=
 =?utf-8?B?ZTMyS3BQU25LVnMwOVdtb1M2bDBCcG9iSEQzQ1I3a1J1TjhINXd3OVNHMWQw?=
 =?utf-8?Q?qu/nrJU9DIyGwvttEUyhEUuXi?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eba226f6-8db6-4c50-5214-08db9e795a6b
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5122.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 16:53:45.4840 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UCRxZhd3JYvxKO8dUZjoNHZCdrKYrqS5bTpxukQvn6cBf0DmHx8bCVMq0U1jl1KQuFJRXHYJv4jZDMkeIM8aJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5237
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
Cc: david1.zhou@amd.com, dri-devel@lists.freedesktop.org, faith@gfxstrand.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

That's actually a bit of a tricky question. It seems that the existing IGT syncobj_timeline test asserts the incorrect behavior that waiting for an unsubmitted fence with WAIT_AVAILABLE set should fail with EINVAL.

I've sent a patch to igt-dev correcting this https://lists.freedesktop.org/archives/igt-dev/2023-August/059858.html however that will cause the test to fail with current kernels.

I don't know how big of a problem that would be. Personally I kinda feel like the test *should* fail with current kernels, since current kernels do indeed have a bug.

On 8/16/23 09:40, Simon Ser wrote:
> BTW, question: do you know if we could add an IGT test to make sure we
> don't regress this?

