Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3EFA134B0
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 09:08:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B60010E8DC;
	Thu, 16 Jan 2025 08:08:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=inmusicbrands.com header.i=@inmusicbrands.com header.b="KscJFgBA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2071d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::71d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD62810E050
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 10:40:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=isGUG46O9hfkxVmbx/KAWsEJdUfqxQQZkX6dZD31sf51pWZmNqSXPZL6EImc0P3DHYdIpa57LqXTcjq28YWPGIfPNmKOOki77RMOQ0xY7jK7CqF8aK2ugigDmhLU0HuijgssfYrVaJ7wDYwS0e1OgE+Wqn6PHRNC8mEyyH/DKrYDfdn0T9Q1Fe53N4cBjL9xo0c3Se8b/1kXXcz9SvutDgpmAC/U8BWKuNXAsqyoeU8fx5vq4hygolRQiNjVXuR8Z9W0i7bSKb0PfYJkcFEhRyiPzflZcxVR6p9PPRnHlQDY4wjStemlfr/4u1nTiquvGMyd7jxCSOnp7WE3Zew0ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GQDX1aLz2j+b1LvXw09kcLC+Mk4eahZu5gl9uhTAv7U=;
 b=ZgymnkOvXw9Nzo7iN/FIbOIMk+5Hp7nGMa6Z6stptPKelpsNIl0RaP6jZq6klV+yIeQwC7XeqNdQ+suOz1S3iSUUbiB80C60NzwvfLZJA3leEUy6gMqtqpx8urk2mmw4aN4M5dsWpd2DnISJz+6P1M/wumMj+73hd75KiK0EJNdx3P9xOs4b7JG2wXCQnWyv3S9nquTKWA4VT5Sdh0MKXoGVVfFOCwCwfqJZeZY5MTBo8nJ4ycg9YpVVbWwdSvhsl1hN6UPsSPsev6rsbmoR9rWaXeuFPfqDjaF5kbhOAsSa2e5vk2UGASSl50cFbJMMtW8HWYw+I3KHogcil3JJbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=inmusicbrands.com; dmarc=pass action=none
 header.from=inmusicbrands.com; dkim=pass header.d=inmusicbrands.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inmusicbrands.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GQDX1aLz2j+b1LvXw09kcLC+Mk4eahZu5gl9uhTAv7U=;
 b=KscJFgBA0KG0DLL7TS2dgS3JCw22W80v9y8xBfyovL4hsntFko5fQowQdogYUeXVEw+03n3NVruJBH8eZywxC0yDIuQ+roX6XJAdFD2C1k2+8D1+gXvYKv9YLZPcbwehRn80ACDHQ9uVBZoR5vdayQWczRJKcc1UQC06534P8+c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=inmusicbrands.com;
Received: from MW4PR08MB8282.namprd08.prod.outlook.com (2603:10b6:303:1bd::18)
 by CYXPR08MB9357.namprd08.prod.outlook.com (2603:10b6:930:d5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Wed, 15 Jan
 2025 10:40:11 +0000
Received: from MW4PR08MB8282.namprd08.prod.outlook.com
 ([fe80::55b3:31f1:11c0:4401]) by MW4PR08MB8282.namprd08.prod.outlook.com
 ([fe80::55b3:31f1:11c0:4401%3]) with mapi id 15.20.8335.015; Wed, 15 Jan 2025
 10:40:10 +0000
Date: Wed, 15 Jan 2025 10:40:04 +0000
From: John Keeping <jkeeping@inmusicbrands.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] drm/ssd130x: Fix reset timing for ssd132x
Message-ID: <Z4eQhOcQs6X0O75e-jkeeping@inmusicbrands.com>
References: <20250113152752.3369731-1-jkeeping@inmusicbrands.com>
 <20250113152752.3369731-2-jkeeping@inmusicbrands.com>
 <87y0zdvxy2.fsf@minerva.mail-host-address-is-not-set>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y0zdvxy2.fsf@minerva.mail-host-address-is-not-set>
X-ClientProxiedBy: LO4P123CA0612.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:314::6) To MW4PR08MB8282.namprd08.prod.outlook.com
 (2603:10b6:303:1bd::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR08MB8282:EE_|CYXPR08MB9357:EE_
X-MS-Office365-Filtering-Correlation-Id: b76436cf-5ce3-4959-a2a3-08dd3550fc71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|1800799024|376014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KLPw80LWrrUVdnKdRJ46VdOvG5DkuQh/LonHF0JwbFZd+66eTEE0OWevz/w6?=
 =?us-ascii?Q?ocwfjjk08AcMPltAeqVGe5GEuKdieg4T7xzcun0H+Jec+WSoxsBoxN1gZyPE?=
 =?us-ascii?Q?ccEfhz8xyx+uCoTNmRDycMEGCF7V7c/mLJ4jWOhOxUx+6mS0IdD+6oriK4UF?=
 =?us-ascii?Q?kzrxa8CRHVJcmw2TrTe8205Hqk5ayup+7sq4hMUE0ZZDRVyH5ZFKMFyOHtPA?=
 =?us-ascii?Q?CULneCLl7eXk7S8aAzuDc2SBfpG59n/8SxUYOIywOqgBRIVmykXRVTKbRtfD?=
 =?us-ascii?Q?8Scl+58ddXHb7AaCDo5Cb0aGWGmBJmmu580iFUtTtolkrUk/mhieyP9dIiuW?=
 =?us-ascii?Q?8v042vKs9FAvCGyNqFKo/ETvrUcHa/gahJBrkNA5qJYVHlLQLa2JMYaipluu?=
 =?us-ascii?Q?qqKVUDd+fzI+jEjxTWucG4iPIKVNHR86F/5YNl6T18+O3J1RF1LOF43ZD9Qg?=
 =?us-ascii?Q?YNjjjFKYYGJqFoqs+mkqVwn9oEY58sJ9FY45Ird3cw3TNIbOyNyxTYah/9Kh?=
 =?us-ascii?Q?BA+fbqBIh2/7pn2Gu8JwMpvOtNO59VU3gLGvl0l0o7rP7EWSLtxv72l5Yfqr?=
 =?us-ascii?Q?jZFK6rqKQ55/ffGNCXnI0THLHFIMVyAzSEnCkZgbV9rfqbQjmZKm7Vv74tT8?=
 =?us-ascii?Q?tpx9Ka+xlJvNrZGEaOegqUBPeNh3eDv9SZrKrSirPZGAIITaYoYgXIET20hH?=
 =?us-ascii?Q?T1vKIdNsloWnxjhjJEkSmaWNPcnB9sRZb2cE/kAg8+MFwzQJnBZoejb4ArhQ?=
 =?us-ascii?Q?Kmv/ZTaEx0L7ZkJzUQ7za4vV7nH1TVAmUwtD3dyGcV+sh3KFeRJaehlUQ2BA?=
 =?us-ascii?Q?2qhTGHNwXiEbE7M51qml+22ucuwILmxfB0gp0lhKgKUPlSeV61/VMaVCoz1C?=
 =?us-ascii?Q?4sKrJTMasxSM+G4Lf68XWct2Qxvb3dqF9r7qr4oL+II0hEQuOKWuVT5TRcaf?=
 =?us-ascii?Q?4rLJimX9Kk/rWoJvmGH2xylTGrG9qi5TGzs3IQQ61kmBbHG/ImAZ51fbUZaB?=
 =?us-ascii?Q?jNsNl4xZ/oWqwqMOJbWWJWzOtSPHkf42u8ZJFIG65agbZO5oiUhQdXz68oe0?=
 =?us-ascii?Q?Mh3+LhdhHKFebZ0g8P9zlf4FEJaAUpLzgqkj7zjgACTRia63ZkoWJNDcS8Jz?=
 =?us-ascii?Q?hc/KDQFwTUKRc7TvEnzP6aOQS+Hsi9AL6UrifggHW9wpAoStp42IgOoaw5hk?=
 =?us-ascii?Q?bKBzqkZO6ZQ+wPRW+wn960HHLtJZOUZFp+P/TCGMlGOhHdHB+XPoqgBpK422?=
 =?us-ascii?Q?5jXiQN19wBLCGAXwlLY5wh+Xm09yibDBAbQOiLZsw93bcDaYlt+zO0Ylv+8c?=
 =?us-ascii?Q?Wq463EHAadtQTG8zk/tq/3cSzF89O+wHYCXaj0hXjlvcPAdJEpzbo75BXXsz?=
 =?us-ascii?Q?OJwuhYPAAoB3BZ4dEfCKCI8hiGa3HvhD0YBKjL0oCVRSR9QmIgk7Nw5RANc4?=
 =?us-ascii?Q?TA+1JGJbLcIOvLmwtmRWmTk+RkcsTkY+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR08MB8282.namprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?W2f8/gfnwD3bAxGWlM7gP4RXooQM+LgHnyfm0X8buWkyRGv9ZwK3Wj/YNGq6?=
 =?us-ascii?Q?GqT1inSeGGHJYdT6/ffF5pGMImCfSV2kFUoRG5J6WmukbcP7SDeRaqPwHCKn?=
 =?us-ascii?Q?J6jfeWgci9Ocw1ZjwhHn8sRaIWiIVZkVsb5CbiRPXwCtYdOJ4u/hsBy1g5Lr?=
 =?us-ascii?Q?0rZKk8pN8L+N9ISuRFC2FgCweehH533057VWcW3tqECcHHitZeyr8XI7mEbs?=
 =?us-ascii?Q?2whfk7A1qM0+Gzjzi9KiuRWS/IpqWFw+9wNwWV/h1uRB/HVjlH0v6xn/xr0Y?=
 =?us-ascii?Q?UGACapKqUmRwBcderGw64o4dz4A4FvZwKL1Y8z1C2m8FWZF9+KZvI+6Fg7QG?=
 =?us-ascii?Q?fyry5DJNpllRoLxxn6yjoyGmwgfni0p1lZLve2WmkGwJCgITaQBXiozKme8x?=
 =?us-ascii?Q?S5FGXk2wVvdbHJ64AGc+PELrRZRi66zX9/7qHeR7CI7Ouficj0FmNrNwsj3L?=
 =?us-ascii?Q?2/mUgn8azo3uQXV31dGhCpNnbMd8vU9YPCiZWMRXCjKxT5unKExbKuQzmka7?=
 =?us-ascii?Q?Y++1w3shvigghyHJpoX+sT0sd/c3hvRIe8fNZ0kSIuWe8HYfgvox6jKwH3w5?=
 =?us-ascii?Q?WmuvfboXG5hVAA8/dMDmaAVMqAnS6ByEPy/pJFWvsUqoAbApnHpnAVcB8n3R?=
 =?us-ascii?Q?nCLk3ZuyeDoPiw+T0lq/qR1iy9BlW7E91mvpmWysUoR1AZYUkiMFLwOBHqba?=
 =?us-ascii?Q?dSC7Vl1D5hX1M8+ZdKKoeGwTr5yIRIDM+s2RZgfB5ilWwSJKKH/XKZRp3620?=
 =?us-ascii?Q?sqkx137Cz5Dx7r1o6a8B9bFQdxJHx0yW8UUjBj6MEsAspQ2jRsoBXd0QUznS?=
 =?us-ascii?Q?Kr/3X6AMaM5mD2DyJgtmkEcynY27RaQcnKETxJSS7f4Xl+jao+mGaySfbBNe?=
 =?us-ascii?Q?ixJjLKKdBfvSQDJ5yjD1153rtq9DQsODQSn8Pef75HRqnTqo+o9EZMHMJYuK?=
 =?us-ascii?Q?wpMK6n3kCtxJ9VHPIg+qkYz8ZIN9iE+lkKqbOsUkyO2dXeUcve0P3o3XEOys?=
 =?us-ascii?Q?q9Nn8roWEu9qAt7AfW9vxcVO02zI2O2diWEqIcQo5STvPR/Gd7ef+u3iJBzi?=
 =?us-ascii?Q?iBNtAZ25LMO3xJ2+CFqKrrxVHyKqnztmk/tUD89KfsRdjwZqlQcEoKotc2+Y?=
 =?us-ascii?Q?UYiUf41SWyDH0hUda6tVpOVZcVJQ25YtRUvMhZc2MPZt32435LhkKZg9AvhG?=
 =?us-ascii?Q?mTw5dB8L5OC8vWVyJUPJm/eFI2RVxzLy/tA37L0zz1ANvZHKVJf0ICBDHI3x?=
 =?us-ascii?Q?VBt402MhgLC64AXmOZ83SRzL/viX8ELKHljpjvi/Qcc0sN1GutJDGxk4nwtZ?=
 =?us-ascii?Q?9itL9JBedXOCQEA80RBWmAL4TsYr9HA8drUc4FHaI5F4SiVfTYdg+Cop+KfZ?=
 =?us-ascii?Q?hgHDlKgPUETm3sFfTjKP8uQ1sdIRtdkdYXaL1BkW88d5ahu1Ei+NYYEF5Zpa?=
 =?us-ascii?Q?xF9TLDdh0aHpB7EP1figr4NBgLV8t+UGtWqjjCIrvNS8lTk8I3z/cRPl5CsD?=
 =?us-ascii?Q?QsJO5k84SwrdnfoUURNHIL0enD+LaEaaVBD2hBgFRiFYGoVFVd1Wm8y8yy5Q?=
 =?us-ascii?Q?N/TIQnRz2g97bxLJ+mueMO6KGNrHKRRx1fCZH5cEeDi37cA2ppUJjw0idurv?=
 =?us-ascii?Q?cQ=3D=3D?=
X-OriginatorOrg: inmusicbrands.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b76436cf-5ce3-4959-a2a3-08dd3550fc71
X-MS-Exchange-CrossTenant-AuthSource: MW4PR08MB8282.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 10:40:10.6749 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 24507e43-fb7c-4b60-ab03-f78fafaf0a65
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GPsO09CWt13SDA2/wikveYIQiyNpJv6bY0VqXnldveP8rn2AlYFW49zKbTmIGUnHEEu8fC5/UYU7ua4kB1jqxhx9YaDjrZnYvKjnE/kQGS0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR08MB9357
X-Mailman-Approved-At: Thu, 16 Jan 2025 08:07:59 +0000
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

Hi Javier,

Thanks for the review.

On Tue, Jan 14, 2025 at 11:21:25PM +0100, Javier Martinez Canillas wrote:
> John Keeping <jkeeping@inmusicbrands.com> writes:
> Thanks for your patches!
> 
> > The ssd132x family of chips require the result pulse to be at least
> > 100us in length.  Increase the reset time to meet this requirement.
> >
> 
> That's not what the datasheet says AFAIU. It says the following in the
> "8.9 Power ON and OFF sequence" section.
> 
> Power ON sequence:
> 
> 1. Power ON VDD.
> 2. After VDD become stable, set RES# pin LOW (logic LOW) for at least
>    3us (t1) and then HIGH (logic HIGH).
> 3. After set RES# pin LOW (logic LOW), wait for at least 3us (t2).
>    Then Power ON VCC.
> 4. After VCC become stable, send command AFh for display ON. SEG/COM
>    will be ON after 100ms (tAF).

The version of the datasheet I have for SD1322 says:

Power ON sequence:

1. Power ON VCI, VDDIO.
2. After VCI, V DDIO become stable, set wait time at least 1ms (t 0) for
   internal V DD become stable. Then set RES# pin LOW (logic low) for at
   least 100us (t1) (4) and then HIGH (logic high).
3. After set RES# pin LOW (logic low), wait for at least 100us (t2).
   Then Power ON V CC.(1)
4. After VCC become stable, send command AFh for display ON. SEG/COM
   will be ON after 200ms (t AF).

And on the hardware I have 4us seems to be too short.

However, having tested it again today it seems to be fine with the 4us
delay so I suspect this was a misleading change in the midst of other
debugging.

I will drop this patch from v2.

> > Signed-off-by: John Keeping <jkeeping@inmusicbrands.com>
> > ---
> >  drivers/gpu/drm/solomon/ssd130x.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
> > index b777690fd6607..2622172228361 100644
> > --- a/drivers/gpu/drm/solomon/ssd130x.c
> > +++ b/drivers/gpu/drm/solomon/ssd130x.c
> > @@ -363,7 +363,7 @@ static void ssd130x_reset(struct ssd130x_device *ssd130x)
> >  
> >  	/* Reset the screen */
> >  	gpiod_set_value_cansleep(ssd130x->reset, 1);
> > -	udelay(4);
> > +	usleep_range(100, 1000);
> >  	gpiod_set_value_cansleep(ssd130x->reset, 0);
> >  	udelay(4);
> 
> That's why I think that the udelay(4) are correct here, since that will
> make for the delay to be bigger than 3 usecs.
> 
> Now, is true that the mentioned 100ms (tAF) after sending an AFh command
> might not happen. Since I see there's no delay after sending a display ON
> command in ssd130x_encoder_atomic_enable():

I don't think this matters.  It is a delay before the user sees the
image, but that is not relevant to the timing of any commands


Regards,
John
