Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B583316F9
	for <lists+dri-devel@lfdr.de>; Mon,  8 Mar 2021 20:10:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B5226E417;
	Mon,  8 Mar 2021 19:09:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2086.outbound.protection.outlook.com [40.107.95.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D976890AA;
 Mon,  8 Mar 2021 19:09:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hmWHzwWiJ1iqUavLxSBfndwEDvC1ympfdt0ngPdrYKs7MHCf+447D2nW87tDTtM2kfP6ZgY3OvuBdwvt386MTW0NZZRuai5Cp5R+3GO7b4y0ppSv/syjrRasXb8ezDX7ITdc9KDzRd8owjTf4U4gfRvRkO5P7m3tpdJARwYWfY3mCheda2zvIDb1/DxV109T7H28QRsZFKovV/P4x1oFzmKlufcmBgjmY0pkGC/wtjatfYJTQ1Z7WQMBHqKyhJ2pt4EAN5eAPjvq+9O4L5on6cW95LEP8Hvtonp2kmRXqBGzDHiq2/mW/vDG2tYVC1rDZA7APrpyVXej6Zn58CcWDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GUIEjrM86PV1YmMt+1Ut/psNbgPAYkjGxBZUNPbLOSo=;
 b=dfQYGVfwYuAKLb4m2O9qT1SGWm8JPAWiDnb2wHEvY7zI61w46AXdon8rfH3EzhEz94pbdXEFsTeNEug9Q/PPNDWNi2UqTdkCXo5DK24wpCU1hSbLkCDkzByzCDNNLkvwbIEmGczDwAJLvZRsBK82DhXsw4ixz8wRvxjegFLxC+8BpGn7lhRc9ZEjGoN7WM6DQjKxAH9u/7RSjOLZOq31pK91AVH3qJ+GZWreqL1Ro3vbO7CF/WBeINSmTf2xtGPGHDBU6VRnvpobpLCPRtZP8o/uSgndWsrbd9F6NA4b6sFN0yIa7LLphToPrrXU5tyJpwfvzaVBacrGwcRB6oJ2IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GUIEjrM86PV1YmMt+1Ut/psNbgPAYkjGxBZUNPbLOSo=;
 b=unHH8TJjyzcpAvrr6ugDuKuhDTxdFvIhFMkpR/P26fxVUmqvrqTm7R/nMu91/vPfdxjiQls5GkeL16Eygzg24wMmsjMhnRKO1uMfwjyT2BPiMWkJfpUW4BNqkCUdU/k++S0SI6Gw3wJOFTiAopwrtZls6Ddn4CkwN+EHRB5Qmow=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by BL0PR12MB4916.namprd12.prod.outlook.com (2603:10b6:208:1ce::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Mon, 8 Mar
 2021 19:09:55 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::ec8d:851e:525d:a6ab]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::ec8d:851e:525d:a6ab%9]) with mapi id 15.20.3784.031; Mon, 8 Mar 2021
 19:09:55 +0000
Subject: Re: [PATCH] drm/amdkfd: fix build error with missing AMD_IOMMU_V2
To: Arnd Bergmann <arnd@kernel.org>
References: <20210308153359.2513446-1-arnd@kernel.org>
 <176cae4d-33bc-1d51-a7d7-58eeeea5180e@amd.com>
 <CAK8P3a0nUKSJ2+knM6+REp8HXRFbz5-DmNRAusezkT+XzZQa7Q@mail.gmail.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <92a6c999-c20a-2311-4e31-209a2d9229ed@amd.com>
Date: Mon, 8 Mar 2021 14:09:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <CAK8P3a0nUKSJ2+knM6+REp8HXRFbz5-DmNRAusezkT+XzZQa7Q@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [142.117.121.176]
X-ClientProxiedBy: YT1PR01CA0141.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::20) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.117.121.176) by
 YT1PR01CA0141.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.26 via Frontend Transport; Mon, 8 Mar 2021 19:09:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c53d0c28-a0fd-44db-17a5-08d8e265c226
X-MS-TrafficTypeDiagnostic: BL0PR12MB4916:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB49164377D074C0A54BA0D1AA92939@BL0PR12MB4916.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X/g89Wq6l1Bqh6FU1Hs9n4BFuC/Ode7+1zD3l9KrE7iz4HNJdpSpcB6dNfXZZcpHsRYK6szT7d2WvLhl8CJWWYP/BKmxc0gvAtdsclu+Bmi70lUNUZBAQsvRzN0Kl0uqh8ar+fc0F5HX0BaTzHfbokzvwE437pJw1WlU14EWikY/VgAYyNdo3AzfzmoAQA8gXsWbB4pivtV/DaKKBfg/yafWA/pCP4oJkMJiUAEWj9SNw8tCy/2EbZpvuQGAlHeuADVZjjf78OdlpwGrhnWPi6fU/StJjpzcCztioDMgpplqk3F7WMW6iFW08jfexWjPaq7ZflSr0227rj5K30l2sMrboeMZ0YKugRjhGHtm2f5T3NkbQF7spBED4wIannvXiXWvHfsBRFFZTX2/HKQ+5Uu+G7XNgtNO/D7Y2kIefNmT0bdEHoQVdXFlcY159gsssC96M3RJ6+xLx/cSIeDydfF6dowppEkpLRTZIDYTH5ugIYocQ2yHmtRqbANhR7bQ+YFQiuP12w9sYT+j/3j3GeHGPe0dGOwyp4P9QKU8oqB5toIrb+fDYnmdJmRFhINLH9gxZZnlz+ScBHwh9bSpbYlHmHD9ux/0p2Qlr+wF6XE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39860400002)(376002)(136003)(346002)(316002)(26005)(66556008)(54906003)(66946007)(66476007)(2616005)(2906002)(8676002)(16576012)(956004)(8936002)(478600001)(6486002)(16526019)(36756003)(6916009)(52116002)(53546011)(83380400001)(31686004)(4326008)(31696002)(44832011)(86362001)(186003)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?N2ltdy9idDJrYkE0WFVwYjBLMjNDYm9tYWpCbktCb3BSMFgzL3VxU3k3Q2Rr?=
 =?utf-8?B?UjhoSTNjUU1TVjMrVXJPM24xeHlLQjZkczZ2U3Q0SjNsQzBVQkFVdjRNUGcz?=
 =?utf-8?B?WGxkYzgxSS8vM2l4YTg0c0ozc2RFOXFvVEtZTllrUnhLVnlVNE5GRmcwR3Vl?=
 =?utf-8?B?U1lPZUhacHNsQ0haeitybjY2K0pZcGdISFZ6dTl5dEdBT0tnZVVMSkpuekgr?=
 =?utf-8?B?SjhrSmRVTGwyWmFFSnhvN0o0TGNUVG5rbGtRZEZMOVF4RDRGeVVYS1R3VDBn?=
 =?utf-8?B?enZidjhDNWNjNDUwM1Z4VmpoazFIeWkvV1VHNG12ais5QytKWWRYclQ2U0RZ?=
 =?utf-8?B?ZTUxZ3A1YTFDdys4MjVubUtlKzdEcHlBenNZV2h3b0RaOGhnS0gvVkdNOGli?=
 =?utf-8?B?d1NYNENQQ3lOV3VIQllQcytQSXJlSElLNVpVZmZjYnQ2aHFIalhaTWEzMkRt?=
 =?utf-8?B?WjNpaFgwU1IvaEVNOWlNUVNjQU8xY3Uzb1R1amhqWFNlMHMyTThMOVZpTC9H?=
 =?utf-8?B?anR6S3JYSWhQeWtNZFRYclFld1pIMXQzVjRKeEcxOWJ6TjBCZGh4MWszMDFK?=
 =?utf-8?B?RjA3VkZvVWx3azdxMzQ0RmNKQ3VOLzNkMitnSVFoWkpvMnJVdjNNa1VmZnNF?=
 =?utf-8?B?Skpjb2RnbVlEZ2Y4MkpHOE1lL0tQVXFzbmNiR3hnc3JxbWwzL1FIaFdBRTI3?=
 =?utf-8?B?dEtDNUYzMXpyNjFCSzI5Q2xJRzY4M0l1d1Vqc0c3ZlUyNlRDeDFweFQ4aVZz?=
 =?utf-8?B?dmdBMk1uYk9QbElrWWNtMWVnNWE3NDJZVVZzd2poQkw0OVMxM0FpOUozUC82?=
 =?utf-8?B?bXhteWlvWFBieHNOL0lsK3k0ZHhtUldwZFpaK2F2NmlyZCtrOGJMeE41eWVy?=
 =?utf-8?B?RFdzakk2Z3V5QzJkN3RQdWNVTitqS2NpS0ZxZDYwZjdIM0NndStyZi9xa1lt?=
 =?utf-8?B?WHZqUHc4TnFqQS9YbGNnbjVhcmM4b05vcjl6ZmptRVZPM2wyakF0c3BvZUtH?=
 =?utf-8?B?Q2l4WWM4TERIMm9DdHJpNzlEcFdqYWhzRFl6QTBNeWNLQVpvMGxPdzJtcE9L?=
 =?utf-8?B?M0VxY0RwekhKcXVuUWV2WXhtcnNsSGVER3ZadExlcFEvbkRqNEtkUDQ5NkJV?=
 =?utf-8?B?b2dPajNYOVloMVVaUW4zTmYxaGxGR1JMTnBVeDZqVG81S3NVZjR1TnQ4NTFz?=
 =?utf-8?B?MjRlN1FyVkx4K3Y1L2lvNW5FQ3hwcVV2VWZNOFd2OEZ1clptazJCdGgzZTRZ?=
 =?utf-8?B?UlhrMkRwWlpCYXlpZkJ4VS90b1U1R29abVNwZlorZ2tkVUFldWlpTm5hRnZs?=
 =?utf-8?B?WnNLYklFS0JJTXcwWHRvYTA2am9kNzF5aCtidkg5Ym5BakZleHpIWCtYTXlk?=
 =?utf-8?B?NXFqWHdJTW5qeFl3ZUVaSHd5NE01QW9XdGc5MllZREo1bS8yZ1krOE5HTHBn?=
 =?utf-8?B?b3dCQXpMRnBXQWMzYXZPdkw4TDMvanRtSk1HVTNTMmdaM1dFU25UdUtuSmFi?=
 =?utf-8?B?T0tHM0laZWJVZ1dMMUNNWlI5cUJWcFl1SEFORk5RQzJITlhwejFud0o4Rm9F?=
 =?utf-8?B?eXo0aDFiT1JOOWYzeCsvNi9IR1UweTZYY0dKQzJEUERTRjY5V0VidExaTCts?=
 =?utf-8?B?djRlRGJJcXB3dUFlQ3JpNlE1NXYvUHR5N2VVKzRScUd3ZVBZbCtPeVFJU2xx?=
 =?utf-8?B?WUdrRHNpNEgxa1I1aFVLSElFWE1xQ1RtQVdsQXk3Y0JFNVl3SDE4RnJHdzRk?=
 =?utf-8?Q?KqhpoKX/dgR1cRWFubwMXP8nJTJ8OpkIREBkMKZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c53d0c28-a0fd-44db-17a5-08d8e265c226
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 19:09:55.1269 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DNXzr+t3KyFF2bZ4LSq7afiI05mCAF7cl4xQh0+DT7TmihYeQm7Fs1gJKy+F7iZ9SXNid81E9yo29WPQ8FdlXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4916
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
Cc: Philip Yang <philip.yang@amd.com>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjAyMS0wMy0wOCB1bSAyOjA1IHAubS4gc2NocmllYiBBcm5kIEJlcmdtYW5uOgo+IE9uIE1v
biwgTWFyIDgsIDIwMjEgYXQgNToyNCBQTSBGZWxpeCBLdWVobGluZyA8ZmVsaXgua3VlaGxpbmdA
YW1kLmNvbT4gd3JvdGU6Cj4+IFRoZSBkcml2ZXIgYnVpbGQgc2hvdWxkIHdvcmsgd2l0aG91dCBJ
T01NVXYyLiBJbiBhbWRrZmQvTWFrZWZpbGUsIHdlCj4+IGhhdmUgdGhpcyBjb25kaXRpb246Cj4+
Cj4+IGlmbmVxICgkKENPTkZJR19BTURfSU9NTVVfVjIpLCkKPj4gQU1ES0ZEX0ZJTEVTICs9ICQo
QU1ES0ZEX1BBVEgpL2tmZF9pb21tdS5vCj4+IGVuZGlmCj4+Cj4+IEluIGFtZGtmZC9rZmRfaW9t
bXUuaCB3ZSBkZWZpbmUgaW5saW5lIHN0dWJzIG9mIHRoZSBmdW5jdGlvbnMgdGhhdCBhcmUKPj4g
Y2F1c2luZyB5b3VyIGxpbmstZmFpbHVyZXMgaWYgSU9NTVVfVjIgaXMgbm90IGVuYWJsZWQ6Cj4+
Cj4+ICNpZiBkZWZpbmVkKENPTkZJR19BTURfSU9NTVVfVjJfTU9EVUxFKSB8fCBkZWZpbmVkKENP
TkZJR19BTURfSU9NTVVfVjIpCj4+IC4uLiBmdW5jdGlvbiBkZWNsYXJhdGlvbnMgLi4uCj4+ICNl
bHNlCj4+IC4uLiBzdHVicyAuLi4KPj4gI2VuZGlmCj4gUmlnaHQsIHRoYXQgaXMgdGhlIHByb2Js
ZW0gSSB0cmllZCB0byBleHBsYWluIGluIG15IHBhdGNoIGRlc2NyaXB0aW9uLgo+Cj4gU2hvdWxk
IHdlIGp1c3QgZHJvcCB0aGUgJ2ltcGx5JyB0aGVuIGFuZCBhZGQgYSBwcm9wZXIgZGVwZW5kZW5j
eSBsaWtlIHRoaXM/Cj4KPiAgICAgICBkZXBlbmRzIG9uIERSTV9BTURHUFUgJiYgKFg4Nl82NCB8
fCBBUk02NCB8fCBQUEM2NCkKPiAgICAgICBkZXBlbmRzIG9uIEFNRF9JT01NVV9WMj15IHx8IERS
TV9BTURHUFU9bQo+Cj4gSSBjYW4gc2VuZCBhIHYyIGFmdGVyIHNvbWUgdGVzdGluZyBpZiB5b3Ug
cHJlZmVyIHRoaXMgdmVyc2lvbi4KCk5vLiBNeSBwb2ludCBpcywgdGhlcmUgc2hvdWxkIG5vdCBi
ZSBhIGhhcmQgZGVwZW5kZW5jeS4gVGhlIGJ1aWxkIHNob3VsZAp3b3JrIHdpdGhvdXQgQ09ORklH
X0FNRF9JT01NVV9WMi4gSSBkb24ndCB1bmRlcnN0YW5kIHdoeSBpdCdzIG5vdAp3b3JraW5nIGZv
ciB5b3UuIEl0IGxvb2tzIGxpa2UgeW91J3JlIGJ1aWxkaW5nIGtmZF9pb21tdS5vLCB3aGljaCBz
aG91bGQKbm90IGJlIGhhcHBlbmluZyB3aGVuIEFNRF9JT01NVV9WMiBpcyBub3QgZW5hYmxlZC4g
VGhlIGNvbmRpdGlvbiBpbgphbWRrZmQvTWFrZWZpbGUgc2hvdWxkIG1ha2Ugc3VyZSB0aGF0IGtm
ZF9pb21tdS5vIGRvZXNuJ3QgZ2V0IGJ1aWx0IHdpdGgKeW91ciBrZXJuZWwgY29uZmlnLgoKUmVn
YXJkcywKwqAgRmVsaXgKCgo+Cj4gICAgICAgICBBcm5kCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
