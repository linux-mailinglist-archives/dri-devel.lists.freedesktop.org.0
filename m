Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CDB332AAB
	for <lists+dri-devel@lfdr.de>; Tue,  9 Mar 2021 16:37:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D14CA6E0F6;
	Tue,  9 Mar 2021 15:37:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20604.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::604])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 307896E0F6
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Mar 2021 15:37:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MwtjLs1cowUQQKKL4Zn4BK0/w69V2IXmy1jYIyDgWjSwDwdUwoLvRAidLXmScZfPBHHcH9zRFHxic5oRFo4c8C3CUK65RIefDXPssxyOfGXbdO5HEDGuqq7laOeG7mibW8tqojd1IfZ3Rf65P5OBesNE2ibLmSuR4WoOCGXXZzOuC9EGeTZqvETZXfFnwYrqqT7+JkSRpb8PhhBFBUdkrv5eelW4qdJVzow9uztJb/bdjXWEyvOGIKjJvMpBydXnNkk1t97n6t1ZOyeGWAZJ5gRm51ULhSNuPVpwDcviJe7tJN6l2AI/OBzP33gFpgOPdUpHPNkBWjn6sGRYBq910A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UHbXFM5CpsDubSwKEsY96p7Ir0qkV1h2KKNoD55Vqww=;
 b=UiztiOEkCyHCOBY8MTTdG3oDy413BjBrd/+WXY3DX5rGNj+P8i7m3pWTg5ZVUHDpbUFADvP49Efx5V3NHRwiM7zLxVaYmI8UlJSWvajb3d9aS1DcNrYqGO3rAuGku1qKbJNIcbHznYNI+xI5bH77TPNsMr77CwN4wDiKUeXWZ8c7O7yK3CqAydhElUfHodmxUez5PF/SBpV9VYtn+09GHTpJZMvNVxqo+OB2bUW+6ogwZudTw3aPR7GsDDXaNT46+aXQOBxJ4Py/PvuqiAsuSmBLZ7mlpwFpQREJEHynG1X++ZqiC/gmCm4Wm6iem9Jy04ygj16eHtzru1cILf785Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UHbXFM5CpsDubSwKEsY96p7Ir0qkV1h2KKNoD55Vqww=;
 b=0SuMUmedipoBNHqI1KhiiIzyFX3q2zdJ4xHiyFJN1fw/G+UKN8K16Bxd6SJC7aYtjU0E/YeyBExsKe4xshVFB2ijRjxarIRKSWk1m/+OZv8NGkGcn/9ZpY+LSgYpiPVFe3iBV+wXa/ykC9gcCwHq2EVnbcusMl/VE+jC+JibfQo=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=vmware.com;
Received: from MN2PR05MB6624.namprd05.prod.outlook.com (2603:10b6:208:d8::18)
 by MN2PR05MB6669.namprd05.prod.outlook.com (2603:10b6:208:df::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.9; Tue, 9 Mar
 2021 15:37:51 +0000
Received: from MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::88de:ad34:82d7:a02e]) by MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::88de:ad34:82d7:a02e%6]) with mapi id 15.20.3912.027; Tue, 9 Mar 2021
 15:37:51 +0000
Subject: Re: [PATCH 1/2] locking/rwsem: Add down_write_interruptible
To: Peter Zijlstra <peterz@infradead.org>
References: <20210308205456.1317366-1-zackr@vmware.com>
 <20210308205456.1317366-2-zackr@vmware.com>
 <YEc2ry1h1qC3N2m9@hirez.programming.kicks-ass.net>
From: Zack Rusin <zackr@vmware.com>
Message-ID: <cbaaf6b6-9981-997a-02ed-4d6055fd9833@vmware.com>
Date: Tue, 9 Mar 2021 10:37:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <YEc2ry1h1qC3N2m9@hirez.programming.kicks-ass.net>
Content-Language: en-US
X-Originating-IP: [71.175.59.246]
X-ClientProxiedBy: MN2PR15CA0030.namprd15.prod.outlook.com
 (2603:10b6:208:1b4::43) To MN2PR05MB6624.namprd05.prod.outlook.com
 (2603:10b6:208:d8::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.193] (71.175.59.246) by
 MN2PR15CA0030.namprd15.prod.outlook.com (2603:10b6:208:1b4::43) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Tue, 9 Mar 2021 15:37:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2cdf2d0e-b149-4882-172b-08d8e3114c5b
X-MS-TrafficTypeDiagnostic: MN2PR05MB6669:
X-Microsoft-Antispam-PRVS: <MN2PR05MB66697625068F3E7E181A9B41CE929@MN2PR05MB6669.namprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z/bKsg8fa2qpn5W5799d+UdLBw4B4bNdAPHg0ko2om1xPbBaZhC7uLb9OtEINbZimCXVE4xfBf2he1CIgGhGBjGMD6B0qaaUd71/zAhKY2kmA3O9l8XYwKaUuRq4yglCDnqeG7oFsZ3IgDixpSDH7lk/pcgDZ2W94gUxjNKNQvNLBbKiDlieXh2xwWUbnIEB7jBiDCdiIvlme7Khn9qsEviTZ1AY7PVzunbGxKicXnBzBcK2nBUsph9zTyeLEH7IXvbwVaE3akYxlThvqSR8ZvFo0HWpkYzmhSTFitS1B23Xn4/SPe6J0FswqOIEJWApLYsCqVn0awARQ6KEXP9kvCMF23gIt1D+bYDlo5L9CCn/yOlpypUGxP/1dy/3kFr46LzcipEdToi5yJanTTn3LBGPhMAEl5g7EfyuWjm4jcAjvqpvSDHxMp53y9gckXtfeYQd7uwPdK2AfFihoQSkPPA3Eb9G2mV/jmS9I6e6mgO/FerND4O7xRRQ0a8bDUsA1LEIXoo3UgOjjEoRzS3D8mXggHibvrydW/SzNqExWr2TNaoDvYVuyycV0KRPv3im0pRxgCE2MPFGXYHU24rGVIY4MEkD8BNMr0QGfh8Vaan5rrCfokmKECXQIEIaViB41CqM7+WV6Ns6nSb/SSZBqG/GBr/QWfdF1oDwNmxQnHdA90xSNrMquEBjUE8PxuSX83d0P2Oscr91JmBAi0biKEFTefVjIhZzznkehOpz8gI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR05MB6624.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6486002)(186003)(36756003)(966005)(66556008)(66476007)(26005)(16526019)(5660300002)(31686004)(498600001)(31696002)(6916009)(16576012)(54906003)(83380400001)(4326008)(8676002)(53546011)(956004)(86362001)(8936002)(66946007)(2616005)(2906002)(4744005)(45980500001)(43740500002)(10198025002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OUdNNnpoeUpTZGxRcERQSXhyRVYyWDk1NHVEM0N6TEh1TU9WcnNHZFFEQUlJ?=
 =?utf-8?B?RVFSaDd4U1FITjd2Vm5sc1EyOXIrMWkzYVl2a2dETjVOMkFNVmFIcnBPVk5H?=
 =?utf-8?B?by9WREUrZms2dmZSQXFwODArVTY2NGV5V0FNMUVPcExNa045Mmg4U1V3Qytj?=
 =?utf-8?B?TGh6SFB6MjVQR2FDUXZQR3BSNU5ZQUtPbFcxVTN4VllOZTJLWXpVdzNXNDVG?=
 =?utf-8?B?Z0VHanMvV2hPVmpiNFlPN0xFeTlLTStyOVBiZjA2L3JUMmRCSlNJR2t1dWhT?=
 =?utf-8?B?bWJiTGVBZzN2c1NNNzlkKzkzM2dFN1JBQW1CQTVUM3lzWnE1S1dreUtVZGhv?=
 =?utf-8?B?U1lIcTNDbE9IK2hPOTcwTjVLWHVWeVhqaGUwOWs4WU4vQWtQWjliczhNdFcv?=
 =?utf-8?B?MVpaM1BxczdXSU1adHJsN1lGYWk0dDBlaWx2SE1IS1dWZC9WdEdmMjRidFRQ?=
 =?utf-8?B?Z0JqVXBtOTNudE1ldzlBM3ljempsdk8zaGd5UmJ3eENOOXp0YWZleEdQMUVV?=
 =?utf-8?B?cFExUmE3VXJDNktCNTNyWm9tTFNrYVQyU3JRd2h3TUpyYXpBemlKWEthWC85?=
 =?utf-8?B?dURMUlVENVBGRjRvbnJqYmFVditHd0tOVDF0OEYwYmFVSlBSb3pkTGVVaUlu?=
 =?utf-8?B?ZUlUczc4am5xYTFDbVZwNFFwcXdzaGtIRlI5Z0dGdi9od05zRXllaXd5TXI3?=
 =?utf-8?B?MUxZb0xTK3pmQnlGNE43VlVQajNTa3crcnBtS3kxVkR1eFpaOStoWitpVjdS?=
 =?utf-8?B?bnZiMkE5amNMSEVUSERNSXdFcFdLUzllaTJrM0VVd1dYQmRSTWJHTHFZU1l4?=
 =?utf-8?B?SjFYeERSTE05aVgxRW1qQ253SzdKYXd3RWc5dTFOMUFuMm81eXk1dmpnMVdH?=
 =?utf-8?B?bDZycUsva3I0VEl2Tzlvcm42VEdiczJCcFpaVVlNTDFNQWsvdjJscTNRYmdh?=
 =?utf-8?B?WU5LTEZsVXRtMUZXNXJCeWk5UHJlRWNZbTlFUktMSnZ3OFpGSmdjUlJBM1FJ?=
 =?utf-8?B?Y21KOXB2bXUrZ2E5dFpQVHF6UW8yNVVpV0RIdG41UVpONEt1V1psR3NwUldq?=
 =?utf-8?B?ais2azJQL05Lc3lCNlJhUjZnb3UrdjhVbm54SEJBTFdCTk5wSWplRmg3Qk94?=
 =?utf-8?B?cnVQMmFiUFhiRC9wOEJQV0RsY2ZtTHlSeTNmWjM4L3k0dXdCYS9oRG1oVzFE?=
 =?utf-8?B?eldrZGlFUEpsZFMyQlFIZlhkS3h0YkFreFRXdmNMOUZNNUhGaDJtemh3UkZN?=
 =?utf-8?B?eFhPTlMxQ0tVUFIzaGNpbWZnMXgxbEExaHZBaWNGMzlmZlN3Z3dzQ2hESzJj?=
 =?utf-8?B?aVprL2Z1TUpVZm5jNDRyT25MK0NuR3pNT2FJOEJ6NnBTL2FIQlpJVjd1K29n?=
 =?utf-8?B?ZmRWczQ4S055eUh6T1R0dm1EK2N6aWp5R2xmRnFEYjUvNElOSWRFaWNHeFla?=
 =?utf-8?B?QUlpSEkwWUVpS2N2dUdtWjBtZS9CMHpDU2crWG56dlhvNGplRmFraVFxZkh6?=
 =?utf-8?B?ZEdUUzFYQS9UUkhNeGo4OTYveDZOZ0hYbEVnWVVHcW9ieE50V2NlRHFZRXRN?=
 =?utf-8?B?dVJQL1RrOWtTbW1LOEQ2dTFYMXdIZU44RDlQbHBWelhFNVNnQ2hMQ3k0Yjhz?=
 =?utf-8?B?S0tRQmd3Mjhzeit3WG9UVlNZV2FZcjBNbHJZZ3QvRllHRzB0TzJ3dk9QZ1l1?=
 =?utf-8?B?eGJMSitzVnZNUzY0K3NESklTM1lVVmFwSmd3d1NJWEdVRnVPTmxnZE44bWhp?=
 =?utf-8?Q?QqHl0aoUXGef/6XeQeUVBPAh5vPZI6toaY+PAYj?=
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cdf2d0e-b149-4882-172b-08d8e3114c5b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR05MB6624.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2021 15:37:51.0690 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NZmq/LVUweQpQfaA5T14E+iosVhZXgOEDg/DMQtYElYPPxFQGNgi4yD8YWFvTP9mtWVU2CrYYfOv4/N1mZVZbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6669
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
Cc: Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/9/21 3:49 AM, Peter Zijlstra wrote:
> On Mon, Mar 08, 2021 at 03:54:55PM -0500, Zack Rusin wrote:
>> Add an interruptible version of down_write. It's the other
>> side of the already implemented down_read_interruptible.
>> It allows drivers which used custom locking code to
>> support interruptible rw semaphores to switch over
>> to rwsem.
>>
>> Cc: Peter Zijlstra <peterz@infradead.org>
>> Cc: Ingo Molnar <mingo@redhat.com>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: linux-kernel@vger.kernel.org
>> Cc: dri-devel@lists.freedesktop.org
> 
> No SoB!

Ah, sorry, fixed that locally.

> Assuning you actually wrote and and simply forgot to add it, the patch
> does look ok, so:
> 
> Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

Thank you. I didn't want to bother you with the code in vmwgfx, so I 
only sent it to the lists (it was missing SoB as well):
https://lore.kernel.org/patchwork/patch/1391810/

z
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
