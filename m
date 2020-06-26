Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C92820ACB2
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jun 2020 09:03:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 787C86E3DF;
	Fri, 26 Jun 2020 07:03:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2083.outbound.protection.outlook.com [40.107.244.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 837666E3DF;
 Fri, 26 Jun 2020 07:03:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N/CgkoHAPEqcN1OvkTzJEw4tJFkqKdIDURzNT1kczz6UAyIZR2v1zcc8DsNTErjYf1JIM7MPHyEhHisdE2qoT8rIsSYgwWhYHOvLCUnr0nnqKpVQSilYjdSJ0y4uocF2b2UJC2bxmU+VayeBsGPoj3S5lzuCyec3wubq61YyMtU7WX0dETUHbDclYvB8RZtH5cgYQR7mjPRgNuS4ANdD6Eu5PNuA5T7lhZ6IN4oh1zjmkSPnjXW4x7b6qBm8q4rj8w/VYnCnbCK/z2TfUsYbFQijJKxtO/YNqwtNivghRbABVGDHFkYWvNAdueccmjuqOSZ8nhVtm6pAYXKb9fAIDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0uRyc1P/GUihBU1D58/gOHcQ+pFi9gfFOL8PnXOM1eM=;
 b=HFDbWRmyYBGnY1NDfA5qgjxC9dxdLi6lEbHJXABUk00Dt9CDRGoMIYjCO7KifnvlXGgppxrFa8IHZQGEQUdasvJchYHn4hnnKt3hv49RuvNrM5URFOMDTTLgG6znRvahzxezNuy48FcwOPVdJDYljBTQrVmwd22V/dcSr65W2qzVA2fHjo7G1/7cjL/QPxzC3IYi36AO46nB6+v4ZxwfoKYK0fzAiuJEoBSgvuFtQPViIeiPgWXBNHbzJGXq93PRbhFr0WnFVJUF1Ua7T3NFCSeOLX9aiGBKBCr7AFUCxrA6ezzzqPfmLhlHAN5ixEUmTn3TYiLg3cApAi3O33PaJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0uRyc1P/GUihBU1D58/gOHcQ+pFi9gfFOL8PnXOM1eM=;
 b=waNVd5Vp+UsZc8PZXxvOiSZxJxIn+KPkueMkD5pxoPf0Rl72KO8jDffjyQkuxGAYB0fa7IxxyauQDgb+M4dKyIJc2d+3xGWdZ8oNnsiqK60nfCRf15gwjLW8kaYHpYQzC7AG0BMhRAIAr1vuAo57O68i68Xk04kKd5PQH1PG6CE=
Authentication-Results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by DM6PR12MB3433.namprd12.prod.outlook.com (2603:10b6:5:38::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21; Fri, 26 Jun
 2020 07:03:37 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::a045:f8c0:8edb:1ef1]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::a045:f8c0:8edb:1ef1%9]) with mapi id 15.20.3131.025; Fri, 26 Jun 2020
 07:03:37 +0000
Subject: Re: [Intel-gfx] [PATCH 1/2] Revert "dma-buf: Report signaled links
 inside dma-fence-chain"
To: Sumit Semwal <sumit.semwal@linaro.org>, Daniel Vetter <daniel@ffwll.ch>
References: <20200625123443.19680-1-lionel.g.landwerlin@intel.com>
 <51e00eed-c8f1-aabf-ec2c-07be0453ab3b@amd.com>
 <CAPM=9txhX5TVUdWibRFc1C+ip5a8-c07jZawds=k5T5pBTPASA@mail.gmail.com>
 <874kqzndxj.fsf@intel.com>
 <CAKMK7uErpxoFrT_K==7-PMGyg_eqF07T50eYfh5BFQLzra7TbQ@mail.gmail.com>
 <CAO_48GEa2ZgMph-1ZdsMcOdomZc4zNuRcNn_DoBZS3sNZa-LTg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <b7b1eb80-aa98-2d54-2344-dbc2e4bc0492@amd.com>
Date: Fri, 26 Jun 2020 09:03:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <CAO_48GEa2ZgMph-1ZdsMcOdomZc4zNuRcNn_DoBZS3sNZa-LTg@mail.gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR07CA0021.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::34) To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR07CA0021.eurprd07.prod.outlook.com (2603:10a6:208:ac::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.10 via Frontend Transport; Fri, 26 Jun 2020 07:03:36 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 16b2f4da-b1dd-4d73-2af9-08d8199f0caa
X-MS-TrafficTypeDiagnostic: DM6PR12MB3433:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3433B6BA603A67350FA9CFB883930@DM6PR12MB3433.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0446F0FCE1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vbTDJV6aQZyCLH635DvKVI9LzG/c3T//1+7OuKIB5+ZPQ9yoGltmAqTpPG/domS4ioH3zvRGH7pKp6JFKw/xX8mtOV1OvjG9F/5Jf7SS8SeuILFF4K4XKEhptRq6jEXRhuYaHENLwSc4SPtPWDMkBnqzBNkBmFgHRjr9RVLLbJOOx9asjtSUfcqc2pkq9661ZgYiMTV4y+7cXzm0p4/RZcGvVXrkey7BwLafuOgsBG/Sfo3Q6IhLbx7UwQnDtd9yUV6hPNwW7y/BIfaFoXX3+apyOROUTOP8MVoKftyoT2VhcDetvxJbOhc7qD0s9oUCHfc1ICLp+XhVFJdleIRvAVLQCzVmd0PwAxOj7BohA3h+tH1oVFI0gqFm6vDa4sUV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(396003)(39860400002)(346002)(136003)(366004)(5660300002)(54906003)(36756003)(31696002)(66556008)(86362001)(8676002)(110136005)(478600001)(6486002)(316002)(83380400001)(8936002)(53546011)(52116002)(66476007)(66946007)(6666004)(186003)(16526019)(2906002)(31686004)(4326008)(2616005)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 6O8qgpSuf55+9/pXnX6NJKjgZJ8WwrILsxfKbmMvknF1I+nMnDM67CerdTxyrVbng2q6H3bKsRYf1kD5sx+NQ5Sm1AEqRWx8NJTjUw3RmAly0AEUx+u47P03ELW05yNa67KEyTwzlpMkQtdXeuLrpq7atLiqUHaWjbNVBZui7n2c76K18sP/qYgM6DonsWqmI4zwRMjwZg7mxYXp9wtV/CaKfsJooLLtnhm6A+7qyS9cV3reWQkGB5XZCCkIDL7JBnHPVkm6jKVhm+tvkk1oXp0PQptAjGaQ6+Y7C4UAFZH1htwAje8o00OAGljwbeuFwNZNOml9+6vH6mi6yXlQZd0YuHW0VHcdI2F39/G7rdXfxGdiXmjg/yOm+OLAZBi0uk1sO/aUsCmszAyQCeh8zu0Ey0dWUugmrwMns4QFR/IzFDmKCvcBsQmau9I9ysp1wuvXfiJUwcW8ShQxLBJKIOikzXGXGSsfLNgsWPW6KVbORoZunh60iBL44J9wGoL65+FE4JA4XiH4CdTCUR7R6RuTXkGcKyR4NoUyHhWyJSZocBUfveQ5Oc4q1ouaWzQc
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16b2f4da-b1dd-4d73-2af9-08d8199f0caa
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4401.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2020 07:03:37.7322 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lDpXOmdKq2XPiY0npkH0fyGli98xGsmXbA5YZd7aASbCQLICI2+iwDaDhH9aP750
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3433
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 26.06.20 um 06:43 schrieb Sumit Semwal:
> On Fri, 26 Jun 2020 at 01:24, Daniel Vetter <daniel@ffwll.ch> wrote:
>> Ignoring everything else ...
>>
>> On Thu, Jun 25, 2020 at 9:28 PM Jani Nikula <jani.nikula@linux.intel.com> wrote:
>>> As a side note, there seem to be extra checks in place for acks when
>>> applying non-i915 patches to drm-intel; there are no such checks for
>>> drm-misc.
>> One option to generalize that that I pondered is to consult
>> get_maintainers.pl asking for git repo link, and if that returns
>> something else, then insist that there's an ack from a relevant
>> maintainer. It's a bit of typing, but I think the bigger problem is
>> that there's a ton of false positives.
> Right; for the particular patch, I wasn't even in the to: or cc: field
> and that made it slip from my radar. I would definitely ask any one
> sending patches for dma-buf directory to follow the get_maintainers.pl
> religiously.
>> But maybe that's a good thing, would give some motivation to keep
>> MAINTAINERS updated.

Should I maybe add myself as maintainer as well? I've written enough 
stuff in there to know the code quite a bit.

Christian.

>>
>> The other issue is though that drm-misc is plenty used to merge
>> patches even when the respective maintainers are absent for weeks, or
>> unresponsive. If we just blindly implement that rule, then the only
>> possible Ack for these would be Dave&me as subsystem maintainers, and
>> I don't want to be in the business of stamping approvals for all this
>> stuff. Much better if people just collaborate.
>>
>> So I think an ack check would be nice, but probably not practical.
>>
>> Plus in this situation here drm-misc.git actually is the main repo,
>> and we wont ever be able to teach a script to make a judgement call of
>> whether that patch has the right amount of review on it.
>> -Daniel
> Best,
> Sumit.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
