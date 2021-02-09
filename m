Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9CB315193
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 15:31:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FA1F6EB53;
	Tue,  9 Feb 2021 14:30:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2086.outbound.protection.outlook.com [40.107.237.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 376746EB2F;
 Tue,  9 Feb 2021 14:30:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OPKX/l8op7AXcDiqM8MzSHWns1XDfvebKIWOA0rB6+VlEpEsgqpWGSvWptvpAIGBhP0wjyscZSfykLzHpSVk8pBaf6HaQaFVLjfLyrmf4TIBqurNh/AbqSXPDxxP0O51fKSJnSeScH/TCcF2/w7MAYZNmsc/1An0sTOMx0gJdZQXNE5kN+++6URpPizMy856i9rj2b7+RYrsLHgDRcA/gEgspJW/zY41sy+WDVquBSfLd64+44lmF9A7BYZ8GrCP8jTOVdAOXNv5fXBx8XhHE4xRhG4wFMFgR3+IaOqNs3vI22J2vQC/3GzMnuYQZ1QHx00AvPcjVjjJ2U/tdH0xAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ungelOCRJoLXspja9kQHUB3z3prePip9iaiR3SFgYGE=;
 b=oRDq+t8Ty7iLidFO30TGfsF3hXzWOz+hQbkS5QwmIVsyVFtLgSDfl4iN3Sv+eg/+sRdDlqKcKi993Q2vZbDX9FsQ7io2w7ZT1pHZfRU7qr2T41FpRo0TvIPHnjIb/SVGv1obMOVcvas9u7HMnE5Hv/eJn0GjknbMzVEeBZ2aLHw+LtLe9jDgxbpB/5JDvFQDNxCrmzFjrhwZoBGO8y3pmBWGD5eHn/0he4Kxhm/7ewLGr84qRCvxU6apCA+FSvS1q8ml1LnOUrCcW0WjIF8yJAPXV2X6z9Ilg6AD6xWAbhb+6x7hlGxL2jbG+aACTf3kIcHJImvzduyW+6XY0YZMhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ungelOCRJoLXspja9kQHUB3z3prePip9iaiR3SFgYGE=;
 b=nTo+AnPX905o/q75PjLpQ5HoBvfx6MH6ACGsioyvVHxXxBnTYt/leiGycyTCIYhbdGWAwnDBb8EIRgnP2iqPHak6aRUq4mQNFLGnzZSofVKWobYNbfNW55aBhUy6WbdqgWYNi0v+u+qhVDisvtDqdzorICY3/GPW3Q6ei2Vexg4=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4416.namprd12.prod.outlook.com (2603:10b6:806:99::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20; Tue, 9 Feb
 2021 14:30:56 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::41b1:11f5:fd1e:fc5f]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::41b1:11f5:fd1e:fc5f%5]) with mapi id 15.20.3846.025; Tue, 9 Feb 2021
 14:30:56 +0000
Subject: Re: [PATCH v4 11/14] drm/amdgpu: Guard against write accesses after
 device removal
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <07dceec0-0be9-1531-0357-353f04d1cb2b@amd.com>
 <69f036e2-f102-8233-37f6-5254a484bf97@amd.com>
 <0b502043-5a66-dcd5-53f9-5c190f22dc46@gmail.com>
 <78e4705d-c55f-6c68-d0f9-b1939b636121@amd.com>
 <CAKMK7uEm=N4kQYyzMt=nUefu2BdyKNcWikFiSJih7CthJMd2Aw@mail.gmail.com>
 <8fbeee95-b365-7f68-1e0b-1d42eb0dea70@amd.com>
 <CAKMK7uEJDfPsbnkVfunjVe2iNbpVBWY2_XHai4JntcxWkuVc3A@mail.gmail.com>
 <fcb2cf17-d011-55c6-1545-9fa190e358c3@gmail.com>
 <YCEJBfA6ce4dD3JT@phenom.ffwll.local>
 <6c639669-b78d-b6a3-71b9-d546ca34121b@gmail.com>
 <YCEOY5wFmpGRl7jJ@phenom.ffwll.local>
 <90eb7a73-1981-6d20-a83d-1690321212c7@amd.com>
 <CAKMK7uF3HkTgDhM5Lk3hnGB+35Vi-Nt7YOBJ_rpO8wZw9ifhcA@mail.gmail.com>
 <f8b3417f-a697-c8c7-b131-5c8823f969d7@amd.com>
 <55862d1f-42da-4a9c-0720-e6abf72615f5@amd.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <da7b71c6-5045-5a52-2ec6-504d0bfb6761@amd.com>
Date: Tue, 9 Feb 2021 09:30:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <55862d1f-42da-4a9c-0720-e6abf72615f5@amd.com>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:d837:3b43:4149:c64b]
X-ClientProxiedBy: YTOPR0101CA0017.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::30) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:d837:3b43:4149:c64b]
 (2607:fea8:3edf:49b0:d837:3b43:4149:c64b) by
 YTOPR0101CA0017.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19 via Frontend
 Transport; Tue, 9 Feb 2021 14:30:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a4471a67-1507-4e24-41bb-08d8cd074fb2
X-MS-TrafficTypeDiagnostic: SA0PR12MB4416:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4416344BE994FED1A46C156FEA8E9@SA0PR12MB4416.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yt6RdKfqXcICZ1Vh9Qqqi482E81S+B6H4PXiyEgS2HIHyxrk/z1AHcbN/Rnsgb3jD5E1UdOcGGArMjO+fYZQBOcpWNgqs5xC4ae5EXYl8p0yNCby1d/1ugxwK+GmIDpzT7pwxjCPfKvrJrPe3sIpo61oH9QMn0k9xVzf8/ZH0yWj/7SzPYPkMb7WxmOUWr0J41AM1LYf/FnVUNzmmbhMcNR/K1HkhCOLhzFzi2koojkQtPM5RQJ6NsFPDPpUWtcRKGzC8gU0+chIvBw6zjJ6CIz+lvtiOvYojhQ5dyOxHZppDBMu0zv0vmFAGM+qdJ5vmJbjUtfNbyaqnUQfz0jPCmcKX0BHbD+DGH2Lqf3c6BY1Q+32wQ3ol2NY2mXod4rbIVqr5qYqL2usC7wPquFDoJBrGimHZG7nC7aXAqyXrKq+EoHZ69EsbI1+gFqja8+M72dMXhnCnB9T8yvtelsLDdhKCI4evjaEO3qTHURb37Q70SoxLo9DO6Cz7oD+YfQjg5eEz3v/bNglQ/Ulg2LD0ha6ucM5oilJ2TxKg2hwVj+mXw66TicQDgDyaueQzuZubKIeh+p6iVlbMQir4Yykze8S+C4H/WFl0yGhYA0UootpPZAJbXDG9OdLvLUxZbPLvTg/0MbGaGfhTQDNd3sRUZ55GUKKJsp3RKUYhN9s9UpsD8RS49T7m5F9j0nxl0Wm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(346002)(376002)(366004)(39860400002)(5660300002)(8936002)(966005)(66946007)(110136005)(52116002)(36756003)(8676002)(2906002)(86362001)(316002)(83380400001)(16526019)(54906003)(53546011)(4326008)(186003)(478600001)(6486002)(45080400002)(66556008)(66574015)(66476007)(2616005)(31686004)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Q2VyL1JIcHBOMnB6a3lQMzhoRmdFM2JTdUVlVGUyRlZnQ2xQdnhsbXUwSGhw?=
 =?utf-8?B?V3VNNGtEaUREUzduQjdSVVZ1bkg5cTBVSkZEQ2ZwQ0tPc3p5T1ZNeWx0a2pL?=
 =?utf-8?B?Y3BiMlFrM3puQklOejZqRVJlNDliSDJPS0hRTTFibVFUeVdzQ3NBK25McG1q?=
 =?utf-8?B?eHNINitESXJ0R3dxOUEzcTBTTkdPbE1rZ1hUa1pLTFFHMTBtOVREZ3Rqcml6?=
 =?utf-8?B?c1BIbmVEenFaeXdTY3pnTG1TaXdvaDZQNE8ybDdSelA3bkh0d3pQM1VVOVM5?=
 =?utf-8?B?NGNDZHprTm9yL2ludWV5Z2k1Ny9obk5RbjRwQU9lV0xGNVduL2VIdkorYTJZ?=
 =?utf-8?B?ZXpEMUU1S1dySzRPcHVsYWFrQ3dvV09yenFzVWN2dWZXNVVDcmt5YnAzTmZu?=
 =?utf-8?B?YWNPT2ZIb3k0aUlNL0Q2M0NhNzNyVDljSXQyR2tkdm1tTHRzN3RRRXArWTdp?=
 =?utf-8?B?Vy90K2g4ZFh0dWZqK1hMVW93RUs5eDU3SmlxbFdtVTczQTd3aFpoYUJjYUpU?=
 =?utf-8?B?WVlFd3M3WkltbFhRVTdQYjRNNjY4clZueTlzaDgzeTBKenFEc3ZrNUt5N0tJ?=
 =?utf-8?B?L05aMVNjS1VwWjZCbVlwODVIbEdyWE9pNUhTR1JTUW9zdUsvdGJHNmZQSjVq?=
 =?utf-8?B?a2lQZTFSSlJSeUZoUGdJMHVORlY2NngwQmNIbG9mejZQN3Roczc1bWRhMjU2?=
 =?utf-8?B?NzRDTlp5RWlNcGV5ZjYwUHpSaSszV2gwWFBBQ29zTHhzKzI5cjAxdEJ0dlY1?=
 =?utf-8?B?Q1NrSkk2V0hRVzNBUXBNYlZUZURVWmk4TDljcXVpZ0dCVDVvZ0ZHSHBsQk55?=
 =?utf-8?B?QkMzR2ZPSmdyZTMvcGZXWmtZNEkrL2VDMytBZ2pHTUlhUzJhMldocE5WV3lO?=
 =?utf-8?B?Zk16Zm8vTVUvS1VMWWV3Uml4N0tOcnM0SkdoOGhGQ0pmL2JERER4cGN1OVdi?=
 =?utf-8?B?Y2VFMSt4T0o5WEpWKy82QngxaGVrYnhQYm8xdFNQMWY1MFYvYmRpK1NXdU01?=
 =?utf-8?B?MGN3Y3VveWdReVFRNUNvUmJJWkR6U1JiTFpkTW1UdHNCWDBTYmY5cGRyWUdo?=
 =?utf-8?B?MFpPSWRHdmJ6YmltN1BZQUd6NGlmYzV6MnlGSkhKUHI5OEk0TzFBMngvdVBy?=
 =?utf-8?B?QkNlWEUxVTFLQjR5UTQ1ZFRib05wVHZycG5XN0ZSSGZncm1uNWpDQS9QNUxJ?=
 =?utf-8?B?WWszRmtrVWpKdWFKak1CVFIyOWZEMGZJQ0IvVGxHYlJpODlDU3QyVzQvZEVn?=
 =?utf-8?B?dzQ0T2lMajBYZDBlTjhsaTZxcXVveFlhUGJWM2JFMm9pZjlPS1oxK0lYUzRk?=
 =?utf-8?B?azV5L05QcFovRVNwZEVWVTNvWFlscXlOeWtTa0duc0lob0ZVUUwzV2cxM2Vq?=
 =?utf-8?B?RFlFU3FKL1VEWVJ3TTc1WFZJQ252cGpxQlVBM2tqbjZkWkNzc3BnMHIrNXp0?=
 =?utf-8?B?NzZCWVUwbi9PbEN5T1N1RkkwMG1PRTRHY0VaL3NWYnc2cmJlRFcvZFhHRG1C?=
 =?utf-8?B?bDlBaGxWZ2hEd2VsZmZpcWprTjA2UitEMmEvTmFEbFFBd3RuSGhVejVJUmVV?=
 =?utf-8?B?aXp6N2lLTitnaG1DaU8rc1ZNM1dWUWxNY091QkpPeUtHOHI2bTNkc1J2UlNx?=
 =?utf-8?B?SGo0Y0VzdEo2WFMveFdlVWpKZFZlc0xNNEs2WEUvWkFJMHh2bU56SlBjY2NC?=
 =?utf-8?B?aElwNDJEN2drNkdiTmVaano0WEs4emJJL0FzL2tlZHd4YkhYRnUxR2Y0TFpR?=
 =?utf-8?B?amxiSmdiSFlvV1YzVjZLN3NlSWxnZEltWGtiMGlCcTIzQk93dU0rcElQNmtU?=
 =?utf-8?B?aUI5T3RsRXlucXN6Y2NmQlpGNTFnSE5WUmltK2xWS3dQOEVJK3BVWHVLeGdj?=
 =?utf-8?Q?agSBsVyvi33Je?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4471a67-1507-4e24-41bb-08d8cd074fb2
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2021 14:30:56.0151 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YqdVfuLOP3phLXx38CkDe5ys2zkW9P+7xpsXpMpwYiB14NgqNQAlc/meRAiXE2lAl7y7d7xS8cDLY2VcsOvhWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4416
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
Cc: Greg KH <gregkh@linuxfoundation.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <Alexander.Deucher@amd.com>, Qiang Yu <yuq825@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDIvOS8yMSAyOjU4IEFNLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Cj4gQW0gMDguMDIu
MjEgdW0gMjM6MTUgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPj4KPj4gT24gMi84LzIxIDEx
OjIzIEFNLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+Pj4gT24gTW9uLCBGZWIgOCwgMjAyMSBhdCAz
OjAwIFBNIENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4gCj4+PiB3
cm90ZToKPj4+PiBBbSAwOC4wMi4yMSB1bSAxMToxMSBzY2hyaWViIERhbmllbCBWZXR0ZXI6Cj4+
Pj4+IE9uIE1vbiwgRmViIDA4LCAyMDIxIGF0IDExOjAzOjE1QU0gKzAxMDAsIENocmlzdGlhbiBL
w7ZuaWcgd3JvdGU6Cj4+Pj4+PiBBbSAwOC4wMi4yMSB1bSAxMDo0OCBzY2hyaWViIERhbmllbCBW
ZXR0ZXI6Cj4+Pj4+Pj4gT24gTW9uLCBGZWIgMDgsIDIwMjEgYXQgMTA6Mzc6MTlBTSArMDEwMCwg
Q2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4+Pj4+Pj4gQW0gMDcuMDIuMjEgdW0gMjI6NTAgc2No
cmllYiBEYW5pZWwgVmV0dGVyOgo+Pj4+Pj4+Pj4gW1NOSVBdCj4+Pj4+Pj4+Pj4gQ2xhcmlmaWNh
dGlvbiAtIGFzIGZhciBhcyBJIGtub3cgdGhlcmUgYXJlIG5vIHBhZ2UgZmF1bHQgaGFuZGxlcnMg
Zm9yIAo+Pj4+Pj4+Pj4+IGtlcm5lbAo+Pj4+Pj4+Pj4+IG1hcHBpbmdzLiBBbmQgd2UgYXJlIHRh
bGtpbmcgYWJvdXQga2VybmVsIG1hcHBpbmdzIGhlcmUsIHJpZ2h0ID/CoCBJZiAKPj4+Pj4+Pj4+
PiB0aGVyZSB3ZXJlCj4+Pj4+Pj4+Pj4gSSBjb3VsZCBzb2x2ZSBhbGwgdGhvc2UgaXNzdWVzIHRo
ZSBzYW1lIGFzIEkgZG8gZm9yIHVzZXIgbWFwcGluZ3MsIGJ5Cj4+Pj4+Pj4+Pj4gaW52YWxpZGF0
aW5nIGFsbCBleGlzdGluZyBtYXBwaW5ncyBpbiB0aGUga2VybmVsIChib3RoIGttYXBzIGFuZCAK
Pj4+Pj4+Pj4+PiBpb3JlYW1wcylhbmQKPj4+Pj4+Pj4+PiBpbnNlcnQgZHVtbXkgemVybyBvciB+
MCBmaWxsZWQgcGFnZSBpbnN0ZWFkLgo+Pj4+Pj4+Pj4+IEFsc28sIEkgYXNzdW1lIGZvcmNlZnVs
bHkgcmVtYXBwaW5nIHRoZSBJTyBCQVIgdG8gfjAgZmlsbGVkIHBhZ2UgCj4+Pj4+Pj4+Pj4gd291
bGQgaW52b2x2ZQo+Pj4+Pj4+Pj4+IGlvcmVtYXAgQVBJIGFuZCBpdCdzIG5vdCBzb21ldGhpbmcg
dGhhdCBJIHRoaW5rIGNhbiBiZSBlYXNpbHkgZG9uZSAKPj4+Pj4+Pj4+PiBhY2NvcmRpbmcgdG8K
Pj4+Pj4+Pj4+PiBhbSBhbnN3ZXIgaSBnb3QgdG8gYSByZWxhdGVkIHRvcGljIGEgZmV3IHdlZWtz
IGFnbwo+Pj4+Pj4+Pj4+IGh0dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9v
ay5jb20vP3VybD1odHRwcyUzQSUyRiUyRnd3dy5zcGluaWNzLm5ldCUyRmxpc3RzJTJGbGludXgt
cGNpJTJGbXNnMTAzMzk2Lmh0bWwmYW1wO2RhdGE9MDQlN0MwMSU3Q0FuZHJleS5Hcm9kem92c2t5
JTQwYW1kLmNvbSU3QzlkMWJkZjRjZWU1MDRjZDcxYjQ5MDhkOGNjNGRmMzEwJTdDM2RkODk2MWZl
NDg4NGU2MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdDMCU3QzYzNzQ4Mzk4MjQ1NDYwODI0OSU3Q1Vu
a25vd24lN0NUV0ZwYkdac2IzZDhleUpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9pVjJsdU16SWlM
Q0pCVGlJNklrMWhhV3dpTENKWFZDSTZNbjAlM0QlN0MxMDAwJmFtcDtzZGF0YT1BbnclMkJPd0ol
MkI1dHZqVzN0bWtWTmR6MTMlMkJaMTh2ZHBmT0xXcXNVWkw3RDJJJTNEJmFtcDtyZXNlcnZlZD0w
IAo+Pj4+Pj4+Pj4+ICh0aGF0IHdhcyB0aGUgb25seSByZXBseQo+Pj4+Pj4+Pj4+IGkgZ290KQo+
Pj4+Pj4+Pj4gbW1pb3RyYWNlIGNhbiwgYnV0IG9ubHkgZm9yIGRlYnVnLCBhbmQgb25seSBvbiB4
ODYgcGxhdGZvcm1zOgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IGh0dHBzOi8vbmFtMTEuc2FmZWxpbmtz
LnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRnd3dy5rZXJuZWwub3Jn
JTJGZG9jJTJGaHRtbCUyRmxhdGVzdCUyRnRyYWNlJTJGbW1pb3RyYWNlLmh0bWwmYW1wO2RhdGE9
MDQlN0MwMSU3Q0FuZHJleS5Hcm9kem92c2t5JTQwYW1kLmNvbSU3QzlkMWJkZjRjZWU1MDRjZDcx
YjQ5MDhkOGNjNGRmMzEwJTdDM2RkODk2MWZlNDg4NGU2MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdD
MCU3QzYzNzQ4Mzk4MjQ1NDYwODI0OSU3Q1Vua25vd24lN0NUV0ZwYkdac2IzZDhleUpXSWpvaU1D
NHdMakF3TURBaUxDSlFJam9pVjJsdU16SWlMQ0pCVGlJNklrMWhhV3dpTENKWFZDSTZNbjAlM0Ql
N0MxMDAwJmFtcDtzZGF0YT1XYTdCRk55U1ZRSkx5RDZXWTRwWkhUUDFRZmVad0Q3RjV5ZEJyWHV4
cHBRJTNEJmFtcDtyZXNlcnZlZD0wIAo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBTaG91
bGQgYmUgZmVhc2libGUgKGJ1dCBtYXliZSBub3Qgd29ydGggdGhlIGVmZm9ydCkgdG8gZXh0ZW5k
IHRoaXMgdG8KPj4+Pj4+Pj4+IHN1cHBvcnQgZmFrZSB1bnBsdWcuCj4+Pj4+Pj4+IE1obSwgaW50
ZXJlc3RpbmcgaWRlYSB5b3UgZ3V5cyBicm91Z2h0IHVwIGhlcmUuCj4+Pj4+Pj4+Cj4+Pj4+Pj4+
IFdlIGRvbid0IG5lZWQgYSBwYWdlIGZhdWx0IGZvciB0aGlzIHRvIHdvcmssIGFsbCB3ZSBuZWVk
IHRvIGRvIGlzIHRvIAo+Pj4+Pj4+PiBpbnNlcnQKPj4+Pj4+Pj4gZHVtbXkgUFRFcyBpbnRvIHRo
ZSBrZXJuZWxzIHBhZ2UgdGFibGUgYXQgdGhlIHBsYWNlIHdoZXJlIHByZXZpb3VzbHkgdGhlCj4+
Pj4+Pj4+IE1NSU8gbWFwcGluZyBoYXMgYmVlbi4KPj4+Pj4+PiBTaW1wbHkgcHRlIHRyaWNrIGlz
bid0IGVub3VnaCwgYmVjYXVzZSB3ZSBuZWVkOgo+Pj4+Pj4+IC0gZHJvcCBhbGwgd3JpdGVzIHNp
bGVudGx5Cj4+Pj4+Pj4gLSBhbGwgcmVhZHMgcmV0dXJuIDB4ZmYKPj4+Pj4+Pgo+Pj4+Pj4+IHB0
ZXMgY2FuJ3QgZG8gdGhhdCB0aGVtc2VsdmVzLCB3ZSBtaW5pbWFsbHkgbmVlZCB3cml0ZSBwcm90
ZWN0aW9uIGFuZCB0aGVuCj4+Pj4+Pj4gc2lsZW50bHkgcHJvY2VlZCBvbiBlYWNoIHdyaXRlIGZh
dWx0IHdpdGhvdXQgcmVzdGFydGluZyB0aGUgaW5zdHJ1Y3Rpb24uCj4+Pj4+Pj4gQmV0dGVyIHdv
dWxkIGJlIHRvIG9ubHkgY2F0Y2ggcmVhZHMsIGJ1dCB4ODYgZG9lc24ndCBkbyB3cml0ZS1vbmx5
IHB0ZQo+Pj4+Pj4+IHBlcm1pc3Npb25zIGFmYWlrLgo+Pj4+Pj4gWW91IGFyZSBub3QgdGhpbmtp
bmcgZmFyIGVub3VnaCA6KQo+Pj4+Pj4KPj4+Pj4+IFRoZSBkdW1teSBQVEUgaXMgcG9pbnQgdG8g
YSBkdW1teSBNTUlPIHBhZ2Ugd2hpY2ggaXMganVzdCBuZXZlciB1c2VkLgo+Pj4+Pj4KPj4+Pj4+
IFRoYXQgaGFzdCB0aGUgZXhhY3Qgc2FtZSBwcm9wZXJ0aWVzIHRoYW4gb3VyIHJlbW92ZWQgTU1J
TyBzcGFjZSBqdXN0IGRvZXNuJ3QKPj4+Pj4+IGdvZXMgYmFuYW5hcyB3aGVuIGEgbmV3IGRldmlj
ZSBpcyBNTUlPIG1hcHBlZCBpbnRvIHRoYXQgYW5kIG91ciBkcml2ZXIgc3RpbGwKPj4+Pj4+IHRy
aWVzIHRvIHdyaXRlIHRoZXJlLgo+Pj4+PiBIbSwgYnV0IHdoZXJlIGRvIHdlIGdldCBzdWNoIGEg
Imd1YXJhbnRlZWQgbmV2ZXIgdXNlZCIgbW1pbyBwYWdlIGZyb20/Cj4+Pj4gV2VsbCB3ZSBoYXZl
IHRvbnMgb2YgdW51c2VkIElPIHNwYWNlIG9uIDY0Yml0IHN5c3RlbXMgdGhlc2UgZGF5cy4KPj4+
Pgo+Pj4+IERvZXNuJ3QgcmVhbGx5IG5lZWRzIHRvIGJlIFBDSWUgYWRkcmVzcyBzcGFjZSwgZG9l
c24ndCBpdD8KPj4+IFRoYXQgc291bmRzIHZlcnkgdHJ1c3RpbmcgdG8gbW9kZXJuIHN5c3RlbXMg
bm90IGRlY29kaW5nIHJhbmRvbQo+Pj4gcmFuZ2VzLiBFLmcuIHRoZSBwY2kgY29kZSBzdG9wcGVk
IGV4dGVuZGluZyB0aGUgaG9zdCBicmlkZ2Ugd2luZG93cyBvbgo+Pj4gaXRzIG93biwgZW50aXJl
bHkgcmVseWluZyBvbiB0aGUgYWNwaSBwcm92aWRlZCByYW5nZXMsIHRvIGF2b2lkCj4+PiBzdG9t
cGluZyBvbiBzdHVmZiB0aGF0J3MgdGhlIGJ1dCBub3QgbGlzdGVkIGFueXdoZXJlLgo+Pj4KPj4+
IEkgZ3Vlc3MgaWYgd2UgaGF2ZSBhIHJhbmdlIGJlaGluZCBhIHBjaSBicmlkZ2UsIHdoaWNoIGlz
bid0IHVzZWQgYnkKPj4+IGFueSBkZXZpY2UsIGJ1dCBkZWNvZGVkIGJ5IHRoZSBicmlkZ2UsIHRo
ZW4gdGhhdCBzaG91bGQgYmUgc2FmZQo+Pj4gZW5vdWdoLiBNYXliZSBjb3VsZCBldmVuIGhhdmUg
YW4gb3B0aW9uIGluIHVwc3RyZWFtIHRvIGRvIHRoYXQgb24KPj4+IHVucGx1ZywgaWYgYSBjZXJ0
YWluIGZsYWcgaXMgc2V0LCBvciBhIGNtZGxpbmUgb3B0aW9uLgo+Pj4gLURhbmllbAo+Pgo+Pgo+
PiBRdWVzdGlvbiAtIFdoeSBjYW4ndCB3ZSBqdXN0IHNldCB0aG9zZSBQVEVzIHRvIHBvaW50IHRv
IHN5c3RlbSBtZW1vcnkgCj4+IChhbm90aGVyIFJPIGR1bW15IHBhZ2UpCj4+IGZpbGxlZCB3aXRo
IDFzID8KPgo+Cj4gVGhlbiB3cml0ZXMgYXJlIG5vdCBkaXNjYXJkZWQuIEUuZy4gdGhlIDFzIHdv
dWxkIGNoYW5nZSB0byBzb21ldGhpbmcgZWxzZS4KPgo+IENocmlzdGlhbi4KCgpJIHNlZSBidXQs
IHdoYXQgYWJvdXQgbWFya2luZyB0aGUgbWFwcGluZ3MgYXMgUk8gYW5kIGRpc2NhcmRpbmcgdGhl
IHdyaXRlIGFjY2VzcyAKcGFnZSBmYXVsdHMgY29udGludW91c2x5IHVudGlsIHRoZSBkZXZpY2Ug
aXMgZmluYWxpemVkID8KUmVnYXJkaW5nIHVzaW5nIGFuIHVudXNlZCByYW5nZSBiZWhpbmQgdGhl
IHVwcGVyIGJyaWRnZSBhcyBEYW5pZWwgc3VnZ2VzdGVkLCBJIAp3b25kZXIgd2lsbCB0aGlzIGlu
dGVyZmVyZSB3aXRoCnRoZSB1cGNvbWluZyBmZWF0dXJlIHRvIHN1cHBvcnQgQkFScyBtb3ZlbWVu
dMKgIGR1cmluZyBob3QgcGx1ZyAtIApodHRwczovL3d3dy5zcGluaWNzLm5ldC9saXN0cy9saW51
eC1wY2kvbXNnMTAzMTk1Lmh0bWwgPwoKQW5kcmV5CgoKPgo+Cj4+Cj4+IEFuZHJleQo+Pgo+Pgo+
Pj4KPj4+PiBDaHJpc3RpYW4uCj4+Pj4KPj4+Pj4gSXQncyBhIG5pZnR5IGlkZWEgaW5kZWVkIG90
aGVyd2lzZSAuLi4KPj4+Pj4gLURhbmllbAo+Pj4+Pgo+Pj4+Pj4gUmVnYXJkcywKPj4+Pj4+IENo
cmlzdGlhbi4KPj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4+Pj4+PiBCdXQgdWdoIC4uLgo+Pj4+Pj4+Pj4+
Pgo+Pj4+Pj4+Pj4+PiBPdG9oIHZhbGlkYXRpbmcgYW4gZW50aXJlIGRyaXZlciBsaWtlIGFtZGdw
dSB3aXRob3V0IHN1Y2ggYSB0cmljawo+Pj4+Pj4+Pj4+PiBhZ2FpbnN0IDB4ZmYgcmVhZHMgaXMg
cHJhY3RpY2FsbHkgaW1wb3NzaWJsZS4gU28gbWF5YmUgeW91IG5lZWQgdG8gYWRkCj4+Pj4+Pj4+
Pj4+IHRoaXMgYXMgb25lIG9mIHRoZSB0YXNrcyBoZXJlPwo+Pj4+Pj4+Pj4+IE9yIEkgY291bGQg
anVzdCBmb3IgdmFsaWRhdGlvbiBwdXJwb3NlcyByZXR1cm4gfjAgZnJvbSBhbGwgcmVnIHJlYWRz
IAo+Pj4+Pj4+Pj4+IGluIHRoZSBjb2RlCj4+Pj4+Pj4+Pj4gYW5kIGlnbm9yZSB3cml0ZXMgaWYg
ZHJtX2Rldl91bnBsdWdnZWQsIHRoaXMgY291bGQgYWxyZWFkeSBlYXNpbHkgCj4+Pj4+Pj4+Pj4g
dmFsaWRhdGUgYSBiaWcKPj4+Pj4+Pj4+PiBwb3J0aW9uIG9mIHRoZSBjb2RlIGZsb3cgdW5kZXIg
c3VjaCBzY2VuYXJpby4KPj4+Pj4+Pj4+IEhtIHllYWggaWYgeW91ciByZWFsbHkgd3JhcCB0aGVt
IGFsbCwgdGhhdCBzaG91bGQgd29yayB0b28uIFNpbmNlCj4+Pj4+Pj4+PiBpb21tYXBwaW5ncyBo
YXZlIF9faW9tZW0gcG9pbnRlciB0eXBlLCBhcyBsb25nIGFzIGFtZGdwdSBpcyBzcGFyc2UKPj4+
Pj4+Pj4+IHdhcm5pbmcgZnJlZSwgc2hvdWxkIGJlIGRvYWJsZSB0byBndWFyYW50ZWUgdGhpcy4K
Pj4+Pj4+Pj4gUHJvYmxlbSBpcyB0aGF0IH4wIGlzIG5vdCBhbHdheXMgYSB2YWxpZCByZWdpc3Rl
ciB2YWx1ZS4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gWW91IHdvdWxkIG5lZWQgdG8gYXVkaXQgZXZlcnkg
cmVnaXN0ZXIgcmVhZCB0aGF0IGl0IGRvZXNuJ3QgdXNlIHRoZSAKPj4+Pj4+Pj4gcmV0dXJuZWQK
Pj4+Pj4+Pj4gdmFsdWUgYmxpbmRseSBhcyBpbmRleCBvciBzaW1pbGFyLiBUaGF0IGlzIHF1aXRl
IGEgYml0IG9mIHdvcmsuCj4+Pj4+Pj4gWWVhaCB0aGF0J3MgdGhlIGVudGlyZSBjcnV4IGhlcmUg
Oi0vCj4+Pj4+Pj4gLURhbmllbAo+Pj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
