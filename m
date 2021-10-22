Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA02A4372C8
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 09:31:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDEFA6E8E8;
	Fri, 22 Oct 2021 07:31:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 378 seconds by postgrey-1.36 at gabe;
 Fri, 22 Oct 2021 07:31:05 UTC
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 805E66E8E8
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Oct 2021 07:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1634887863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+5aA5JWunl6cDqlrP3RRxmbEkj409sVyOwlDKFt7cS0=;
 b=g5t60MMiu7Q4EFJvtHSFQ8O/bkcHnR8MWeAp3OljsKlU8V7B1e5/LRZmLpksAho/ValLBg
 Rhs+pCrKp7YXPdbmFFeGCt7x1ap9jWhfNhBBVEF0zqItDYtTLvnYIv0bgT4A5h2y9HzKwj
 O4yxBaT53cKgjba4HOjlJtwPX1I/SSo=
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2113.outbound.protection.outlook.com [104.47.17.113])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-11-m3b__l39NUGNKSFgU8FKrQ-2; Fri, 22 Oct 2021 09:24:43 +0200
X-MC-Unique: m3b__l39NUGNKSFgU8FKrQ-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aXoOIjkVHXyH5VWCgjKdEjml89yYP7/LIcWtUHQLKHKKAaBuw/FztvcuwYAdNTDeSY1QOWeIjsk4/FFzXRg5dt3LGhrgnzihSpiqlCtX6KrdMbbBIxNHJoEisJM7BBE5534nrcjXDgyaEEqfIU4CWTw1rQWR6RDX1S7/f2B/7GKapnpH2MQ4ZJhFiA/PK5D3/jBmZasLnM/svcOU6s4ZkII1gHKG/dU4d36hnTXelswSMfP9jgRltVwb3ZJ1Iz2bO7UxwnN9pnTAQGubWi8s5n2RTq9VBcHYhZkXf39yCXbwrfcEaMkg8K+TCraZcJnH7U4jOBZj1hTuYIkp2m4y3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+5aA5JWunl6cDqlrP3RRxmbEkj409sVyOwlDKFt7cS0=;
 b=GxOR6EOi9zZFXx4heDfh7T7WIJHUbnEwKGjf2jWrKGiBO1ffakSznMxsMluYZnTNc14j4vUvzkQcLZgCkZn4ars43i2k8VKpBd2MpAqTyAjCWoTRwSxvgHfhOveGh0BYSb5QTc2gssMvIZdLtQKpJFhJ9jZMg2ZUlXx+yfwdPIutOKOB+O3kFu94Il4K+6YznmkkL+njLzsg5Odz2wT7NBmAN9WYoPqWIHBJvHtxJ0sT4ew1EhGXOsQkUen/4fA6qiKzg9jtYtF1tCC0L+LPWA7LULUrOgEmkPJYCDQcl7gBbfXU6buJYwSqHYB1Q6pRvZJoG9kdsLrWOfaKGMMSKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3773.eurprd04.prod.outlook.com (2603:10a6:803:1c::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Fri, 22 Oct
 2021 07:24:41 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4628.018; Fri, 22 Oct 2021
 07:24:41 +0000
Subject: Re: [PATCH 0/5] xen: cleanup detection of non-essential pv devices
To: Juergen Gross <jgross@suse.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 xen-devel@lists.xenproject.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <20211022064800.14978-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c4f534f1-8f07-085e-6a10-edbeb884d1a4@suse.com>
Date: Fri, 22 Oct 2021 09:24:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211022064800.14978-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR08CA0026.eurprd08.prod.outlook.com
 (2603:10a6:20b:c0::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR08CA0026.eurprd08.prod.outlook.com (2603:10a6:20b:c0::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.16 via Frontend Transport; Fri, 22 Oct 2021 07:24:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc72ac65-a16c-4d9c-8173-08d9952d0344
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3773:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS: <VI1PR0402MB377313A7B9A58A00D8058630B3809@VI1PR0402MB3773.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eijGHaq8+NVKXLDZhehKwUeaePIgKPgdNtejen1dJaLMwLom6gN6l47L2jjlP2OHc3/ZKyR9bNw8qrZZ6Ryr9Y26a80XkUL/24rCTNLMj830Th1VAf14Vf/c6bJE1cFldGgjdII0mwwT56T2eDgHJNREnjeZ9Y6Q61Rfc3XdExTvCrvBkcQb7V8c2j2TrCPjTNwga6cEm7JjvWcDBf61wzSZUajzKTPMDU6uDxlgq/5sXrPY45swTMpsq8sYbVZyQuUG5TN6zua6eS05HpxSrRk0QwJL9mLXu6B9x89ljwnULfXtgVLmfsIVsU+BJ7HekTPigHxtjTwDaFMj8wFyzZGp6eBWnEHe/kJhSY/9qS/ETyD+IhNb769awtoTAqvZxIHZRfDV4Oqn2++hHi2eSmhHgqchQXD0a8dJZiA7tcWWH87ATijpe5YqT/byWDk/IvAV7jlvh+5M4tqX9G/4ph0BeJb/t7iA6Aym8ekhI/4B8K9EVHy5MfuCaKa99TZkCz7DGR970jEZhWymnsRtQ+9JcxwlFgAQVL4AV6XZXOaSEKFu+q1py/wmH41hblBUDB3yFHkRGSzo6Lpta2lc/ZuLD6J5N+QEeshoPkGc8F9BeWjYHSKEklMEJ4IeaJLMIW3tEu2e1dNuAYtc/7Az1rF3D+mDVyh6ioEGxUtDXATfQz3AylIsGYDNWLVXswvQv9k0UttmJy8+SzbMC0h2WMJLGj2GK/t1F5OxgWMKYKL104t4+voxDSuDzFyeJ/4L
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5600.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(86362001)(54906003)(31686004)(8936002)(16576012)(2616005)(38100700002)(8676002)(5660300002)(6862004)(66556008)(4326008)(66476007)(316002)(6486002)(37006003)(508600001)(956004)(186003)(6636002)(53546011)(31696002)(7416002)(26005)(2906002)(36756003)(83380400001)(4744005)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3Ztb0lBL1IyZ0N1N1VWTDg0Z05tOFlRWTRkSmFINWxuZ1gvSDhBVE5JMFB6?=
 =?utf-8?B?L1BaSGZPVGc0VmZjeUh3aVhDZkc3WDRmYmNlTHVSZEpZdFNPbkJrTVZwOHhq?=
 =?utf-8?B?aWNGd01QQTdObE9NZGtzcGFxcHJpeFErc1lEa0NsakkyUzVOYmsvNWVZOHpK?=
 =?utf-8?B?MWxqTmgwcHoyc0s2SERhNzhtMWwxeEQxWU9XRGF1RTJuYUpyU2lZL3Frb3cz?=
 =?utf-8?B?T2hzWDlpcXF1R0o4eUt5aktsUXhzT01qL3RsWUREQ3JoN2FONklNKzV2RDRW?=
 =?utf-8?B?bk1NWmcrb0NPOUszN2Z2OEl0V2JXN2Jsc1pXOFBacytCUW1MckFLb1FtRmRO?=
 =?utf-8?B?WHhnUE5jOUViUFNIVWxwTld6cS9paFowWllJU1RoMUhGRzluWVlzaVNRc1N0?=
 =?utf-8?B?VzJMbXJZWmozQ1dtZ2RUb2VMem5zd2F2Z0tIcnRGUXlNM0hEZlZtNjE4TEtK?=
 =?utf-8?B?T3pwM3RyVllNcm9LWDhQTFlNbFlrd2N1R0VSRXZiU3Jjd1VxV2hYdXhTRi8y?=
 =?utf-8?B?U2RzOHBtbkZQRk9LUFNpMVhhUnVMSnMycVE2bmJOYmU3MmpocHg4YWJMRTZ4?=
 =?utf-8?B?Z0FqNWxDVno2bGUxWHFlOWRzWVBjL2lUZERTM1ZWSnFjRERqaldtQ29NaHZN?=
 =?utf-8?B?ZXZLR00wT09mUElQNzVrdDY4S05sWE5iQmkwRlhUSmM2VGNScmd2Qk1tQ1Zn?=
 =?utf-8?B?djcrZlR0ejBwdHdGTUFtSDVFeDBYZUg1em9GY1NQV2FPcWdxMHJaeUZtYkVB?=
 =?utf-8?B?bHFzbEFzMllLZDFmYVN1bHpMZ0lDOUs4VUpTRTFjTUNEeHhISFZvcVhEeGF1?=
 =?utf-8?B?dTdHSFJiakZNWmR3dmc3TTg5d2dtYlZKeDEzVzdiOU9sUWNEOEdVMW9vY1BH?=
 =?utf-8?B?cDhPTHljcnhnNkFPbnZwb21kMmdJVnpZY2REbXJhNTByYTRKclNGNXNEZVJE?=
 =?utf-8?B?MkhOZHJFNW5vTEZOQm5rM3pkeGVtbmtrOXhDaUZLbU85RUM3VlMwYjBCaktJ?=
 =?utf-8?B?bzZRSFdxMW1TSGVtZ0JjZDNnSnk0dXQ3SXY1K0FFbkhYUEQ2V1l5M3RaTXFr?=
 =?utf-8?B?Qlc5YUwyTWFnK1ZZcnYwa01wdjFKMnI2NTM4MVJtRnBiZDc0NEF6M1FhVkZG?=
 =?utf-8?B?a0NQM1hyM3VzYTRyWlZyS2pGYmIraDY4RUZDRWtIT2VOZ2ZKWkZGb3BObW1Y?=
 =?utf-8?B?RnQ0eE54cmFZKys5aTFTSm1STng1TlcvTzNQZE9XaEJwVW5wVmJtNTJwVnM3?=
 =?utf-8?B?enQrTkgxaFhmT1NVWHFCdC9qQi9iYlRwT0F4WmVFVTJaZENxdWtSSjNHczFk?=
 =?utf-8?B?dzJMTUxFZFZqLy9uOFFYTXFtd3BQSE5vYy83dXpTNXFwQU0veTFCem94Tisv?=
 =?utf-8?B?WmNPV0F6YWV1S0U3SXFlUDlINlFQZWliOEZqZ1BhRzRPYXVBNlB2dTllUEEw?=
 =?utf-8?B?RVRMTE1MUU1YUGRKY3Vyak1pYkhobTNKR0wyTjNDMVplYWNMUXpINzduWFZF?=
 =?utf-8?B?UHQ5Yzcxc0hRTlltUC8zdTg4MFZrbGx4M21DY3g3NzRkVUVKc0ozSHZ2TjNP?=
 =?utf-8?B?YkZlS0xuSjFjSWhUSXE0RlFIcWFLemxYZEFIVVowUThocjh4bloyWUNpSndU?=
 =?utf-8?B?djVuUHB4aWdoZEV2ODg5dFlRL1l4RGhTd2htYzlicjR1dDZYS0VLOE5Ta1pn?=
 =?utf-8?B?KytUbG9vSUh0VGZvSGhFbVNQYTlwNXV0cElTWGNtb3A5YkZsODMxVGs1OHRm?=
 =?utf-8?B?VFJPQ2I4dG9NUU1xbVUzcGZSMVcyMHlpTU9JZXk1L2hSa0JWaEZXeUhpYk5S?=
 =?utf-8?B?SFlvU0JLaEFTR2F2MlhCOUtlYjB4TXRpaHB6N1ZjcVNaTlI4aFNuV0J5SXJM?=
 =?utf-8?B?VFlsKyt1UG9aSldtbVVVanFkandENWQzUEJwSWphQXpLTEJvM0NkaC9qRzUr?=
 =?utf-8?Q?YhrCTgfmS1s=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc72ac65-a16c-4d9c-8173-08d9952d0344
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2021 07:24:41.2263 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jbeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3773
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22.10.2021 08:47, Juergen Gross wrote:
> Today the non-essential pv devices are hard coded in the xenbus driver
> and this list is lacking multiple entries.
> 
> This series reworks the detection logic of non-essential devices by
> adding a flag for that purpose to struct xenbus_driver.

I'm wondering whether it wouldn't better be the other way around: The
(hopefully few) essential ones get flagged, thus also making it more
prominent during patch review that a flag gets added (and justification
provided), instead of having to spot the lack of a flag getting set.

Jan

