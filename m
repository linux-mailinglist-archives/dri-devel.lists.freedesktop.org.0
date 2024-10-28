Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6961D9B29CE
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 09:06:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F03C10E365;
	Mon, 28 Oct 2024 08:06:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="npu07FqU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B08010E365
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 08:06:52 +0000 (UTC)
Received: from [192.168.88.20] (91-157-155-49.elisa-laajakaista.fi
 [91.157.155.49])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DB55E346;
 Mon, 28 Oct 2024 09:06:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1730102809;
 bh=64bhKc6ADVnTibqZYrtpFULTHJkSVGNft3JAnqJxilE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=npu07FqU4ZoBwyc83N9WZr2w680C1BdO8xN4o39PyGsDzXvuwwYzyBSKItNfAqYtN
 sUK/smrOlVTN2wB8QEN2EW/EURbIOHieqJ79/7+zeyN8yhnB0v6qochUit+xA/skXh
 6hdXv0iU9UALbhWMU1YYxAYw3v2ZjENgrSExRgjI=
Message-ID: <76eb4a60-e192-4018-9770-4b973075a3cb@ideasonboard.com>
Date: Mon, 28 Oct 2024 10:06:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] driver core: fw_devlink: Stop trying to optimize cycle
 detection logic
To: Saravana Kannan <saravanak@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Aradhya Bhatia <aradhya.bhatia@linux.dev>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Devarsh Thakkar <devarsht@ti.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, kernel-team@android.com,
 linux-kernel@vger.kernel.org
References: <20241026045243.452957-1-saravanak@google.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 xsFNBE6ms0cBEACyizowecZqXfMZtnBniOieTuFdErHAUyxVgtmr0f5ZfIi9Z4l+uUN4Zdw2
 wCEZjx3o0Z34diXBaMRJ3rAk9yB90UJAnLtb8A97Oq64DskLF81GCYB2P1i0qrG7UjpASgCA
 Ru0lVvxsWyIwSfoYoLrazbT1wkWRs8YBkkXQFfL7Mn3ZMoGPcpfwYH9O7bV1NslbmyJzRCMO
 eYV258gjCcwYlrkyIratlHCek4GrwV8Z9NQcjD5iLzrONjfafrWPwj6yn2RlL0mQEwt1lOvn
 LnI7QRtB3zxA3yB+FLsT1hx0va6xCHpX3QO2gBsyHCyVafFMrg3c/7IIWkDLngJxFgz6DLiA
 G4ld1QK/jsYqfP2GIMH1mFdjY+iagG4DqOsjip479HCWAptpNxSOCL6z3qxCU8MCz8iNOtZk
 DYXQWVscM5qgYSn+fmMM2qN+eoWlnCGVURZZLDjg387S2E1jT/dNTOsM/IqQj+ZROUZuRcF7
 0RTtuU5q1HnbRNwy+23xeoSGuwmLQ2UsUk7Q5CnrjYfiPo3wHze8avK95JBoSd+WIRmV3uoO
 rXCoYOIRlDhg9XJTrbnQ3Ot5zOa0Y9c4IpyAlut6mDtxtKXr4+8OzjSVFww7tIwadTK3wDQv
 Bus4jxHjS6dz1g2ypT65qnHen6mUUH63lhzewqO9peAHJ0SLrQARAQABzTBUb21pIFZhbGtl
 aW5lbiA8dG9taS52YWxrZWluZW5AaWRlYXNvbmJvYXJkLmNvbT7CwY4EEwEIADgWIQTEOAw+
 ll79gQef86f6PaqMvJYe9QUCX/HruAIbAwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgAAKCRD6
 PaqMvJYe9WmFD/99NGoD5lBJhlFDHMZvO+Op8vCwnIRZdTsyrtGl72rVh9xRfcSgYPZUvBuT
 VDxE53mY9HaZyu1eGMccYRBaTLJSfCXl/g317CrMNdY0k40b9YeIX10feiRYEWoDIPQ3tMmA
 0nHDygzcnuPiPT68JYZ6tUOvAt7r6OX/litM+m2/E9mtp8xCoWOo/kYO4mOAIoMNvLB8vufi
 uBB4e/AvAjtny4ScuNV5c5q8MkfNIiOyag9QCiQ/JfoAqzXRjVb4VZG72AKaElwipiKCWEcU
 R4+Bu5Qbaxj7Cd36M/bI54OrbWWETJkVVSV1i0tghCd6HHyquTdFl7wYcz6cL1hn/6byVnD+
 sR3BLvSBHYp8WSwv0TCuf6tLiNgHAO1hWiQ1pOoXyMEsxZlgPXT+wb4dbNVunckwqFjGxRbl
 Rz7apFT/ZRwbazEzEzNyrBOfB55xdipG/2+SmFn0oMFqFOBEszXLQVslh64lI0CMJm2OYYe3
 PxHqYaztyeXsx13Bfnq9+bUynAQ4uW1P5DJ3OIRZWKmbQd/Me3Fq6TU57LsvwRgE0Le9PFQs
 dcP2071rMTpqTUteEgODJS4VDf4lXJfY91u32BJkiqM7/62Cqatcz5UWWHq5xeF03MIUTqdE
 qHWk3RJEoWHWQRzQfcx6Fn2fDAUKhAddvoopfcjAHfpAWJ+ENc7BTQROprNHARAAx0aat8GU
 hsusCLc4MIxOQwidecCTRc9Dz/7U2goUwhw2O5j9TPqLtp57VITmHILnvZf6q3QAho2QMQyE
 DDvHubrdtEoqaaSKxKkFie1uhWNNvXPhwkKLYieyL9m2JdU+b88HaDnpzdyTTR4uH7wk0bBa
 KbTSgIFDDe5lXInypewPO30TmYNkFSexnnM3n1PBCqiJXsJahE4ZQ+WnV5FbPUj8T2zXS2xk
 0LZ0+DwKmZ0ZDovvdEWRWrz3UzJ8DLHb7blPpGhmqj3ANXQXC7mb9qJ6J/VSl61GbxIO2Dwb
 xPNkHk8fwnxlUBCOyBti/uD2uSTgKHNdabhVm2dgFNVuS1y3bBHbI/qjC3J7rWE0WiaHWEqy
 UVPk8rsph4rqITsj2RiY70vEW0SKePrChvET7D8P1UPqmveBNNtSS7In+DdZ5kUqLV7rJnM9
 /4cwy+uZUt8cuCZlcA5u8IsBCNJudxEqBG10GHg1B6h1RZIz9Q9XfiBdaqa5+CjyFs8ua01c
 9HmyfkuhXG2OLjfQuK+Ygd56mV3lq0aFdwbaX16DG22c6flkkBSjyWXYepFtHz9KsBS0DaZb
 4IkLmZwEXpZcIOQjQ71fqlpiXkXSIaQ6YMEs8WjBbpP81h7QxWIfWtp+VnwNGc6nq5IQDESH
 mvQcsFS7d3eGVI6eyjCFdcAO8eMAEQEAAcLBXwQYAQIACQUCTqazRwIbDAAKCRD6PaqMvJYe
 9fA7EACS6exUedsBKmt4pT7nqXBcRsqm6YzT6DeCM8PWMTeaVGHiR4TnNFiT3otD5UpYQI7S
 suYxoTdHrrrBzdlKe5rUWpzoZkVK6p0s9OIvGzLT0lrb0HC9iNDWT3JgpYDnk4Z2mFi6tTbq
 xKMtpVFRA6FjviGDRsfkfoURZI51nf2RSAk/A8BEDDZ7lgJHskYoklSpwyrXhkp9FHGMaYII
 m9EKuUTX9JPDG2FTthCBrdsgWYPdJQvM+zscq09vFMQ9Fykbx5N8z/oFEUy3ACyPqW2oyfvU
 CH5WDpWBG0s5BALp1gBJPytIAd/pY/5ZdNoi0Cx3+Z7jaBFEyYJdWy1hGddpkgnMjyOfLI7B
 CFrdecTZbR5upjNSDvQ7RG85SnpYJTIin+SAUazAeA2nS6gTZzumgtdw8XmVXZwdBfF+ICof
 92UkbYcYNbzWO/GHgsNT1WnM4sa9lwCSWH8Fw1o/3bX1VVPEsnESOfxkNdu+gAF5S6+I6n3a
 ueeIlwJl5CpT5l8RpoZXEOVtXYn8zzOJ7oGZYINRV9Pf8qKGLf3Dft7zKBP832I3PQjeok7F
 yjt+9S+KgSFSHP3Pa4E7lsSdWhSlHYNdG/czhoUkSCN09C0rEK93wxACx3vtxPLjXu6RptBw
 3dRq7n+mQChEB1am0BueV1JZaBboIL0AGlSJkm23kw==
In-Reply-To: <20241026045243.452957-1-saravanak@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi,

On 26/10/2024 07:52, Saravana Kannan wrote:
> In attempting to optimize fw_devlink runtime, I introduced numerous cycle
> detection bugs by foregoing cycle detection logic under specific
> conditions. Each fix has further narrowed the conditions for optimization.
> 
> It's time to give up on these optimization attempts and just run the cycle
> detection logic every time fw_devlink tries to create a device link.
> 
> The specific bug report that triggered this fix involved a supplier fwnode
> that never gets a device created for it. Instead, the supplier fwnode is
> represented by the device that corresponds to an ancestor fwnode.
> 
> In this case, fw_devlink didn't do any cycle detection because the cycle
> detection logic is only run when a device link is created between the
> devices that correspond to the actual consumer and supplier fwnodes.
> 
> With this change, fw_devlink will run cycle detection logic even when
> creating SYNC_STATE_ONLY proxy device links from a device that is an
> ancestor of a consumer fwnode.
> 
> Reported-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Closes: https://lore.kernel.org/all/1a1ab663-d068-40fb-8c94-f0715403d276@ideasonboard.com/
> Fixes: 6442d79d880c ("driver core: fw_devlink: Improve detection of overlapping cycles")
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> ---
> Greg,
> 
> I've tested this on my end and it looks ok and nothing fishy is going
> on. You can pick this up once Tomi gives a Tested-by.

I tested this on TI AM62 SK board. It has an LVDS (OLDI) display and a 
HDMI output, and both displays are connected to the same display 
subsystem. I tested with OLDI single and dual link cases, with and 
without HDMI, and in all cases probing works fine.

Looks good on that front, so:

Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

You also asked for a diff of the devlinks. That part doesn't look so 
good to me, but probably you can tell if it's normal or not.

$ diff devlink-single-broken.txt devlink-single-fixed.txt
2d1
< i2c:1-0022--i2c:1-003b
11d9
< 
platform:44043000.system-controller:clock-controller--platform:20010000.i2c
27d24
< platform:44043000.system-controller:clock-controller--platform:601000.gpio
42d38
< 
platform:44043000.system-controller:power-controller--platform:20010000.i2c
58d53
< platform:44043000.system-controller:power-controller--platform:601000.gpio
74d68
< platform:4d000000.mailbox--platform:44043000.system-controller
76d69
< platform:601000.gpio--i2c:1-0022
80d72
< platform:bus@f0000:interrupt-controller@a00000--platform:601000.gpio
82d73
< platform:f4000.pinctrl--i2c:1-0022
84d74
< platform:f4000.pinctrl--platform:20010000.i2c

"i2c:1-003b" is the hdmi bridge, "i2c:1-0022" is a gpio expander. So, 
for example, we lose the devlink between the gpio expander and the hdmi 
bridge. The expander is used for interrupts. There's an interrupt line 
from the HDMI bridge to the expander, and from there there's an 
interrupt line going to the SoC.

Also, I noticed the devlinks change if I load the display drivers. The 
above is before loading. Comparing the loaded/not-loaded:

$ diff devlink-dual-fixed.txt devlink-dual-fixed-loaded.txt
3d2
< i2c:1-003b--platform:30200000.dss
23d21
< 
platform:44043000.system-controller:clock-controller--platform:30200000.dss
52d49
< 
platform:44043000.system-controller:power-controller--platform:30200000.dss
73d69
< platform:display--platform:30200000.dss
78d73
< platform:f4000.pinctrl--platform:30200000.dss
97a93
 > regulator:regulator.0--platform:display

  Tomi


> Thanks,
> Saravana
> 
> v1 -> v2:
> - Removed the RFC tag
> - Remaned the subject. v1 is https://lore.kernel.org/all/20241025223721.184998-1-saravanak@google.com/T/#u
> - Added a NULL check to avoid NULL pointer deref
> 
>   drivers/base/core.c | 46 ++++++++++++++++++++-------------------------
>   1 file changed, 20 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index 3b13fed1c3e3..f96f2e4c76b4 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -1990,10 +1990,10 @@ static struct device *fwnode_get_next_parent_dev(const struct fwnode_handle *fwn
>    *
>    * Return true if one or more cycles were found. Otherwise, return false.
>    */
> -static bool __fw_devlink_relax_cycles(struct device *con,
> +static bool __fw_devlink_relax_cycles(struct fwnode_handle *con_handle,
>   				 struct fwnode_handle *sup_handle)
>   {
> -	struct device *sup_dev = NULL, *par_dev = NULL;
> +	struct device *sup_dev = NULL, *par_dev = NULL, *con_dev = NULL;
>   	struct fwnode_link *link;
>   	struct device_link *dev_link;
>   	bool ret = false;
> @@ -2010,22 +2010,22 @@ static bool __fw_devlink_relax_cycles(struct device *con,
>   
>   	sup_handle->flags |= FWNODE_FLAG_VISITED;
>   
> -	sup_dev = get_dev_from_fwnode(sup_handle);
> -
>   	/* Termination condition. */
> -	if (sup_dev == con) {
> +	if (sup_handle == con_handle) {
>   		pr_debug("----- cycle: start -----\n");
>   		ret = true;
>   		goto out;
>   	}
>   
> +	sup_dev = get_dev_from_fwnode(sup_handle);
> +	con_dev = get_dev_from_fwnode(con_handle);
>   	/*
>   	 * If sup_dev is bound to a driver and @con hasn't started binding to a
>   	 * driver, sup_dev can't be a consumer of @con. So, no need to check
>   	 * further.
>   	 */
>   	if (sup_dev && sup_dev->links.status ==  DL_DEV_DRIVER_BOUND &&
> -	    con->links.status == DL_DEV_NO_DRIVER) {
> +	    con_dev && con_dev->links.status == DL_DEV_NO_DRIVER) {
>   		ret = false;
>   		goto out;
>   	}
> @@ -2034,7 +2034,7 @@ static bool __fw_devlink_relax_cycles(struct device *con,
>   		if (link->flags & FWLINK_FLAG_IGNORE)
>   			continue;
>   
> -		if (__fw_devlink_relax_cycles(con, link->supplier)) {
> +		if (__fw_devlink_relax_cycles(con_handle, link->supplier)) {
>   			__fwnode_link_cycle(link);
>   			ret = true;
>   		}
> @@ -2049,7 +2049,7 @@ static bool __fw_devlink_relax_cycles(struct device *con,
>   	else
>   		par_dev = fwnode_get_next_parent_dev(sup_handle);
>   
> -	if (par_dev && __fw_devlink_relax_cycles(con, par_dev->fwnode)) {
> +	if (par_dev && __fw_devlink_relax_cycles(con_handle, par_dev->fwnode)) {
>   		pr_debug("%pfwf: cycle: child of %pfwf\n", sup_handle,
>   			 par_dev->fwnode);
>   		ret = true;
> @@ -2067,7 +2067,7 @@ static bool __fw_devlink_relax_cycles(struct device *con,
>   		    !(dev_link->flags & DL_FLAG_CYCLE))
>   			continue;
>   
> -		if (__fw_devlink_relax_cycles(con,
> +		if (__fw_devlink_relax_cycles(con_handle,
>   					      dev_link->supplier->fwnode)) {
>   			pr_debug("%pfwf: cycle: depends on %pfwf\n", sup_handle,
>   				 dev_link->supplier->fwnode);
> @@ -2140,25 +2140,19 @@ static int fw_devlink_create_devlink(struct device *con,
>   		return -EINVAL;
>   
>   	/*
> -	 * SYNC_STATE_ONLY device links don't block probing and supports cycles.
> -	 * So, one might expect that cycle detection isn't necessary for them.
> -	 * However, if the device link was marked as SYNC_STATE_ONLY because
> -	 * it's part of a cycle, then we still need to do cycle detection. This
> -	 * is because the consumer and supplier might be part of multiple cycles
> -	 * and we need to detect all those cycles.
> +	 * Don't try to optimize by not calling the cycle detection logic under
> +	 * certain conditions. There's always some corner case that won't get
> +	 * detected.
>   	 */
> -	if (!device_link_flag_is_sync_state_only(flags) ||
> -	    flags & DL_FLAG_CYCLE) {
> -		device_links_write_lock();
> -		if (__fw_devlink_relax_cycles(con, sup_handle)) {
> -			__fwnode_link_cycle(link);
> -			flags = fw_devlink_get_flags(link->flags);
> -			pr_debug("----- cycle: end -----\n");
> -			dev_info(con, "Fixed dependency cycle(s) with %pfwf\n",
> -				 sup_handle);
> -		}
> -		device_links_write_unlock();
> +	device_links_write_lock();
> +	if (__fw_devlink_relax_cycles(link->consumer, sup_handle)) {
> +		__fwnode_link_cycle(link);
> +		flags = fw_devlink_get_flags(link->flags);
> +		pr_debug("----- cycle: end -----\n");
> +		pr_info("%pfwf: Fixed dependency cycle(s) with %pfwf\n",
> +			link->consumer, sup_handle);
>   	}
> +	device_links_write_unlock();
>   
>   	if (sup_handle->flags & FWNODE_FLAG_NOT_DEVICE)
>   		sup_dev = fwnode_get_next_parent_dev(sup_handle);

